Ԥ������
���̳������ǽ����õ�ros-tutorials����������Ȱ�װ��

$ sudo apt-get install ros-<distro>-ros-tutorials
�� <distro> �滻��������װ�İ汾������Jade��Indigo��hydro��groovy��fuerte�ȣ���

#1,�ļ�ϵͳ����
Packages: ���������ROSӦ�ó���������֯��Ԫ��
ÿ������������԰�������⡢��ִ���ļ����ű����������ֶ������Ķ�����
Manifest (package.xml): �嵥���Ƕ���'�����'�����Ϣ������,���ڶ�����������Ԫ��Ϣ֮���������ϵ����Щ��Ϣ�����汾��ά���ߺ����Э��ȡ�

#1.1�ļ�ϵͳ����
�÷���# rospack find [������]
ʾ����$ rospack find roscpp
Ӧ�����YOUR_INSTALL_PATH/share/roscpp
/opt/ros/groovy/share/roscpp

roscd # roscd [���ذ�����[/��Ŀ¼]]
ʾ����$ roscd roscpp

roscd log:ʹ��roscd log�����л���ROS�����ռ��ļ���Ŀ¼�¡�

rosls��rosbash����е�һ���֣�
��������ֱ�Ӱ�����������ƶ����Ǿ���·��ִ��ls���
rosls [���ذ�����[/��Ŀ¼]]
rosls roscpp_tutorials:
cmake  package.xml  srv

#�ܽ�:
ROS����ߵĵ�������ʽ��
rospack = ros + pack(age)
roscd = ros + cd
rosls = ros + ls