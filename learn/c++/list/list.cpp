#include <iostream>
#include <cstdlib>
using namespace std;

struct data
{
    int number;
    string name;
    string sex;
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
    //head=(listpoint*)malloc(sizeof(listpoint));
    //head->information=(data*)malloc(sizeof(listpoint));
    
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
    cout<<"The number is :"<<point->information->number;
    cout<<"The name   is :"<<point->information->number;
    cout<<"The sex    is :"<<point->information->sex;
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
    head=creat_normal_list(4);
    output_list(head);
    return 0;
}