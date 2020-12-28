// #include <iostream>
// #include <vector>

// using namespace std;

// vector<int> twoSum(vector<int>& nums, int target)
// {
//     vector<int> re;
//     for(int n=0; n<nums.size()-1; n++)
//     {
//         for(int m=n+1; m<nums.size(); m++)
//         {
//             if(nums[n]+nums[m]==target)
//             {
//                 //vector<int> re;
//                 re.push_back(n);
//                 re.push_back(m); 
//                 //return re;
//             }
//         }
//     }

//     return re;
//     //cout<<"error";
// }

// int main()
// {
//     int a[5];

//     cout<<"请输入５个数字";

//     for(int i=0; i<5; i++)
//     {
//         cin>>a[i];
//     }

//     cout<<"end"<<endl;

//     vector<int> b;
    
//     for(int j=0; j<5; j++)
//     {
//         b.push_back(a[j]);
//     }

//     for(int k=0; k<b.size(); k++)
//     {
//         cout<<b[k];
//     }
//     cout<<endl;

//     int tar;
//     cout<<"输入target: ";
//     cin>>tar;

//     vector<int> output = twoSum(b, tar);

//     for(int l=0; l<output.size(); l++)
//     {
//         cout<<output[l];
//     }
//     cout<<endl;


//     return 0;
// }

#include <iostream>
#include <vector>

using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
            vector<int> re;
    for(int n=0; n<nums.size()-1; n++)
    {
        for(int m=n+1; m<nums.size(); m++)
        {
            if(nums[n]+nums[m]==target)
            {
                //vector<int> re;
                re.push_back(n);
                re.push_back(m); 
                //return re;
            }
        }
    }
    return re;
    }

    int target;
    vector<int> nums;
};

int main(int argc, char **argv)
{
    int a[5];

    cout<<"请输入５个数字";

    for(int i=0; i<5; i++)
    {
        cin>>a[i];
    }

    cout<<"end"<<endl;

    vector<int> b;
    
    for(int j=0; j<5; j++)
    {
        b.push_back(a[j]);
    }

    for(int k=0; k<b.size(); k++)
    {
        cout<<b[k];
    }
    cout<<endl;

    Solution zk;
    cout<<"输入target:";
    cin>>zk.target;
    
    zk.nums = b;

    vector<int> output = zk.twoSum(zk.nums, zk.target);

    for(int l=0; l<output.size(); l++)
    {
        cout<<output[l];
    }
    cout<<endl;

    return 0;    

}