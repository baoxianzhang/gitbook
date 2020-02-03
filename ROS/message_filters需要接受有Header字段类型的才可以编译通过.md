# message_filters需要接受有Header字段类型的才可以编译通过

  // sync the rslidarscan

  message_filters::Subscriber<sensor_msgs::Imu> scan_sub1(nh, scan1_topic, 1);

  message_filters::Subscriber<sensor_msgs::Imu> scan_sub2(nh, scan2_topic, 1);

  // typedef message_filters::sync_policies::ApproximateTime<std_msgs::Header, std_msgs::Header> ScanSyncPolicy;

  typedef message_filters::sync_policies::ApproximateTime<sensor_msgs::Imu, sensor_msgs::Imu> ScanSyncPolicy;

  message_filters::Synchronizer<ScanSyncPolicy> scan_sync(ScanSyncPolicy(10), scan_sub1, scan_sub2);

  scan_sync.registerCallback(boost::bind(&scanCallback, _1, _2));

如果把sensor_msgs::Imu换成，std_msgs::Header，尽管这个是Header， 但是也不行，其他没有时间的也不行

不然报错：

<M0, M1, M2, M3, M4, M5, M6, M7, M8>

https://answers.ros.org/question/84456/trying-to-write-test-pgm-for-timesync/

如果只要Header, 由要Synchronizer, 可以用sensor_msgs::TimeReference