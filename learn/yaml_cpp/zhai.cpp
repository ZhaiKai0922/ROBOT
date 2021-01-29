#include <yaml-cpp/yaml.h>
#include <glog/logging.h>
#include <iostream>

std::string t1, t2;
int a;

void print(const YAML::Node& node)
{
    t1 = node["t1"].as<std::string>();
    t2 = node["t2"].as<std::string>();
    a = node["age"].as<int>();
    LOG(ERROR)<<t1<<t2<<a;
}

int main(int argc, char** argv)
{
    google::InitGoogleLogging(argv[0]);  //初始化GLog
    FLAGS_logtostderr = 1;
    FLAGS_colorlogtostderr = 1;

    std::string name_1, name_2;
    YAML::Node config_node = YAML::LoadFile("./test.yaml");
    name_1 = config_node["name_one"].as<std::string>();
    name_2 = config_node["name_two"].as<std::string>();
    LOG(INFO)<<name_1;
    LOG(INFO)<<name_2;

    print(config_node[name_1]);
    
    print(config_node[name_2]);

    return 0;

}