#ifndef PARTICLEFILTER_H
#define PARTICLEFILTER_H

#include <stdlib.h>
#include <sys/types.h>
#include <vector>
#include <utility>
#include <cmath>
#include <limits>

template <class Particle, class Numeric>
struct uniform_resampler
{
	std::vector<unsigned int> resampleIndexes(const std::vector<Particle> & particles, int nparticles=0) const;
	std::vector<Particle> resample(const std::vector<Particle> & particles, int nparticles=0) const;
	Numeric neff(const std::vector<Particle> & particles) const;
};

template <class Particle, class Numeric>
std::vector<unsigned int> uniform_resampler<Particle, Numeric>:: resampleIndexes(const std::vector<Particle>& particles, int nparticles) const
{
	Numeric cweight=0;

	//compute the cumulative weights
	/*计算总的权重*/
	unsigned int n=0;
	for (typename std::vector<Particle>::const_iterator it=particles.begin(); it!=particles.end(); ++it)
	{
		cweight+=(Numeric)*it;
		n++;
	}

	if (nparticles>0)
		n=nparticles;
	
	//compute the interval
	Numeric interval=cweight/n;

	//compute the initial target weight
	Numeric target=interval*::drand48();
	//compute the resampled indexes

	/*根据权值进行采样*/
	//采用度盘轮转算法，target每次加interval。如果某个粒子的权重比较大的话，那么他肯定会被采样到很多次。
    //比如说如果某个粒子的区间为4*interval。那么它至少被采样3次。
	cweight=0;
	std::vector<unsigned int> indexes(n);
	n=0;
	unsigned int i=0;
	for (typename std::vector<Particle>::const_iterator it=particles.begin(); it!=particles.end(); ++it, ++i)
	{
		cweight+=(Numeric)* it;
		while(cweight>target)
		{
			indexes[n++]=i;
			target+=interval;
		}
	}
	return indexes;
}

template <class Particle, class Numeric>
std::vector<Particle> uniform_resampler<Particle,Numeric>::resample
  (const typename std::vector<Particle>& particles, int nparticles) const
{
	Numeric cweight=0;

	//compute the cumulative weights
	unsigned int n=0;
	for (typename std::vector<Particle>::const_iterator it=particles.begin(); it!=particles.end(); ++it){
		cweight+=(Numeric)*it;
		n++;
	}

	if (nparticles>0)
		n=nparticles;
	
	//weight of the particles after resampling
	double uw=1./n;

	//compute the interval
	Numeric interval=cweight/n;

	//compute the initial target weight
	Numeric target=interval*::drand48();
	//compute the resampled indexes

	cweight=0;
	std::vector<Particle> resampled;
	n=0;
	unsigned int i=0;
    for (typename std::vector<Particle>::const_iterator it=particles.begin(); it!=particles.end(); ++it, ++i)
    {
		cweight+=(Numeric)*it;
        while(cweight>target)
        {
			resampled.push_back(*it);
			resampled.back().setWeight(uw);
			target+=interval;
		}
	}
	return resampled;
}

template <class Particle, class Numeric>
Numeric uniform_resampler<Particle,Numeric>::neff(const std::vector<Particle> & particles) const
{
	double cum=0;
	double sum=0;
    for (typename std::vector<Particle>::const_iterator it=particles.begin(); it!=particles.end(); ++it)
    {
		Numeric w=(Numeric)*it;
		cum+=w*w;
		sum+=w;
	}
	return sum*sum/cum;
}

#endif
