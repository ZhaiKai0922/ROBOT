#ifndef YAML_CPP
#define YAML_CPP

#include <iostream>
#include <yaml-cpp/yaml.h>
template <typename T>
void operator>>(const YAML::Node& node, T& i);
double test_param1;
double test_param2;

#endif
