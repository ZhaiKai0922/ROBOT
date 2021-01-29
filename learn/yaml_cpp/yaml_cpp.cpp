#include "yaml_cpp.hpp"
template <typename T>
void operator>>(const YAML::Node& node, T& i)
{
	i = node.as<T>();  //what???
};
using namespace std;
void loadYamlFile(std::string name)
{
	YAML::Node node =YAML::LoadFile(name);
	node["test_param1"]>>test_param1;
	node["test_param2"]>>test_param2;

	cout<<test_param1<<endl;
	cout<<test_param2<<endl;
}

int main()
{
	loadYamlFile("./test.yaml");
	return 0;
}
