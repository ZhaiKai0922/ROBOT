#include <glog/logging.h>
int main(int argc, char **argv) {
    google::InitGoogleLogging(argv[0]);      // 初始化GLog库
    FLAGS_logtostderr = 1;                                //设置只在终端打印，即终端打印出全部信息，则下面lod_dir与stderrthreshold设置可以忽略。
    FLAGS_log_dir = "./Log";
    FLAGS_stderrthreshold = 1;
    FLAGS_colorlogtostderr = 1;                     //终端打印颜色设置


    LOG(INFO) << "There is info";
    LOG(WARNING) << "There is warning";
    LOG(ERROR) << "There is error !!!";
    LOG(WARNING) << "There is another warning";

    for(int i=0; i<20; i++)
    {
            LOG_IF(INFO, i>15)<<i<<">15";         //当i>15时，记录Log
    }

    return 0;
}
