//switch case用法
// switch(表达式)
// {
//     case 常量表达式1：
//     {
//         语句块1；
//         break;
//     }
//     case 常量表达式2：
//     {
//         语句块2；
//         break;
//     }
//     case 常量表达式3:
//     {
//         语句块3；
//         break;
//     }
//     default:
//     {
//         语句块n；
//     }
// }

// #include <iostream>

// using namespace std;

// int main()
// {
//     float a,b;
//     char oper;
//     cout<<"请输入一个表达式："<<endl;
//     std::cin>>a>>oper>>b;
//     switch(oper)
//     {
//         case '+':
//         {
//             std::cout<<a<<oper<<b<<"="<<a+b<<endl;
//             break;
//         }
//         case '-':
//         {
//             std::cout<<a<<oper<<b<<"="<<a-b<<endl;
//         }
//         case '/':
//         {
//             std::cout<<a<<oper<<b<<"="<<a/b<<endl;
//             break;
//         }
//         case '*':
//         {
//             std::cout<<a<<oper<<b<<"="<<a*b<<endl;
//             break;
//         }
//         default:
//         {
//             std::cout<<"出错啦！";
//         }
//     }
//     return 0;
// }

// #include "iostream"

// using namespace std;

// int main()
// {
//     int mark;
//     cout<<"请输入成绩（0~100）:";
//     cin>>mark;

//     switch (mark/20)
//     {
//         case 5:
//         {
//             if(mark>100)//100~119都是mark/20==5，所以要用if语句再次进行过滤
//             {
//                 cout<<"ERROR"<<endl;
//                 break;
//             }
//             cout<<"perfect"<<endl;
//             break;  
//         }
//         case 4:
//         {
//             cout<<"Good!"<<endl;
//             break;
//         }
//         case 3:
//         {
//             cout<<"Soso"<<endl;
//             break;
//         }
//         case 2:
//         case 1:
//         case 0:
//         {
//             if (mark >=0)
//             {
//                 cout<<"Please work harder!"<<endl;
//                 break;
//             }

//             cout<<"ERROR!"<<endl;
//         }
//     }
//     return 0;
// }


//枚举和switch是最好的搭档：
#include "iostream"

using namespace std;
enum enumType{Step0, Step1, Step2, Step3, Done};

int main()
{
    enumType Step;
    Step = Step0;
    do
    {
        switch (Step)
        {
            case Step0: 
            {
                //语句块；
                Step = Step1; 
                cout<<"Step0"<<endl;
                break;
            }
            case Step1:
            {
                //语句块；
                Step = Step2;
                cout<<"Step1"<<endl;
                break;
            }
            case Step2:
            {
                //语句块；
                Step = Step3;
                cout<<"Step2"<<endl;
                break;
            }
            case Step3:
            {
                //语句块
                Step = Done;
                cout<<"Step3"<<endl;
                break;
            }
            default:{}
        }
    
    } while (Step != Done);

    return 0;

}

