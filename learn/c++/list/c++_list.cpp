#include <iostream>
#include <list>
using namespace std;

struct data
{
    int number;
    char name[10];
    char sex[10];
};
//**********************************************************
int main()
{
    list<data> l1;

    for(int i=0; i<2; i++)
    {
        data* list_data = (data*)malloc(sizeof(data));
        cout<<"Input the number is :";
        cin>>list_data->number;
        cout<<"Input the name is :";
        cin>>list_data->name;
        cout<<"Input the sex is :";
        cin>>list_data->sex;
        cout<<"--------------------------------"<<endl;
         
        l1.push_back(*list_data);
    }

    list<data>::iterator iter;
    for(iter = l1.begin(); iter != l1.end(); iter++ )
    {
        cout<<"The number is : "<<iter->number<<";";
        cout<<"The name      is : "<<iter->name<<";";
        cout<<"The sex           is : "<<iter->sex<<";"<<endl;
    }

    return 0;
}
