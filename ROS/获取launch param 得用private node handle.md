# 获取launch param 得用private node handle

[http://wiki.ros.org/roscpp/Overview/Parameter%20Server](http://wiki.ros.org/roscpp/Overview/Parameter Server)

I think you should use the private namespace:

ros::param::get("~camera_index", camera_index); ros::NodeHandle nh("~"); nh.getParam("camera_index", camera_index);

see [http://wiki.ros.org/roscpp/Overview/P...](http://wiki.ros.org/roscpp/Overview/Parameter Server)

[http://wiki.ros.org/roscpp/Overview/Parameter%20Server](http://wiki.ros.org/roscpp/Overview/Parameter Server)