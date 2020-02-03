# ros 时间差

///////////////////////////////////////////

  std::cout <<  "time diff: " << ros::Time::now() - input_cloud->header.stamp << std::endl;

///////////////////////////////////////////

  double input_time = input_cloud->header.stamp.sec + input_cloud->header.stamp.nsec * 1e-9;

  double time_diff = ros::Time::now().toSec() - input_time;

​    