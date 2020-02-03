# pcl 计算程序运行时间

\#include <pcl/console/time.h>

pcl::console::TicToc tt;

tt.tic();

std::cout << "[done, " << tt.toc () << " ms ]" << std::endl;