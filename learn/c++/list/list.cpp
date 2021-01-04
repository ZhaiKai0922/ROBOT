// #include <iostream>
// #include <cstdlib>
// #include <string>
// using namespace std;

// struct datas
// {
//     int number;
//     char name[10];
//     char sex[10];
// };
// struct listpoint
// {
//     datas* information;
//     listpoint* next;
//     listpoint* last;
// };

// listpoint* creat_normal_list(int n)
// {
//     listpoint* end;
//     listpoint* head = new listpoint;

//     //head=(listpoint*)malloc(sizeof(listpoint));
//     //head->information=(datas*)malloc(sizeof(datas));
    
//     end=head;
//     for(int i=0; i<n; i++)
//     {
//         //normal=(listpoint*)malloc(sizeof(listpoint));
//         //normal->information=(datas*)malloc(sizeof(datas));
//         listpoint* normal = new listpoint;
//         normal->information = new datas;
//         cout<<"input the number :";
//         cin>>normal->information->number;
//         cout<<"input the name   :";
//         cin>>normal->information->name;
//         cout<<"input the sex    :";
//         cin>>normal->information->sex;
//         cout<<"-----------------------------"<<endl;
//         end->next=normal;
//         normal->last=end;
//         end=normal;
//     }
//     end->next=NULL;
//     head->last=NULL;
//     return head;
// }

// void output_point(listpoint* point)
// {
//     cout<<"The number is :"<<point->information->number<<";";
//     cout<<"The name   is :"<<point->information->name<<";";
//     cout<<"The sex    is :"<<point->information->sex<<";"<<endl;
// }

// void output_list(listpoint* list)
// {
//     listpoint* p;
//     p=list;
//     while((p=p->next)!=NULL)
//     {
//         output_point(p);
//     }
// }
// //**********************************************************

// int main(int argc, char** argv)
// {
//     listpoint* head;
//     head=creat_normal_list(2);
//     output_list(head);
//     return 0;
// }


#include <iostream>
#include <cstdlib>
using namespace std;

struct data
{
    int number;
    char name[10];
    char sex[10];
};
struct listpoint
{
    data* information;
    listpoint* next;
    listpoint* last;
};

listpoint* creat_normal_list(int n)
{
    listpoint* head, *normal, *end;
    head=(listpoint*)malloc(sizeof(listpoint));
    head->information=(data*)malloc(sizeof(data));
    end=head;
    for(int i=0; i<n; i++)
    {
        normal=(listpoint*)malloc(sizeof(listpoint));
        normal->information=(data*)malloc(sizeof(data));
        cout<<"input the number :";
        cin>>normal->information->number;
        cout<<"input the name   :";
        cin>>normal->information->name;
        cout<<"input the sex    :";
        cin>>normal->information->sex;
        cout<<"-----------------------------"<<endl;
        end->next=normal;
        normal->last=end;
        end=normal;
    }
    end->next=NULL;
    head->last=NULL;
    return head;
}

void output_point(listpoint* point)
{
    cout<<"The number is :"<<point->information->number<<";";
    cout<<"The name   is :"<<point->information->name<<";";
    cout<<"The sex    is :"<<point->information->sex<<";"<<endl;
}

void output_list(listpoint* list)
{
    listpoint* p;
    p=list;
    while((p=p->next)!=NULL)
    {
        output_point(p);
    }
}
//**********************************************************
int main()
{
    listpoint* head;
    head=creat_normal_list(2);
    output_list(head);
    return 0;
}