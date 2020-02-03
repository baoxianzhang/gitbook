# use_sim_time

 there is a a way to force the ROS system time to use the time stored in your bagfile. To do this you must:

**1. set the use_sim_time parameter to true:**

rosparam set use_sim_time true

**2. play your bag file with the argument --clock:**

rosbag play xxxx.bag --clock

I hope this solve your issue. For further info you can check this [page](http://www.ros.org/wiki/Clock)

more info: [here](http://answers.ros.org/question/12577/when-should-i-need-clock-parameter-on-rosbag-play/) and in the [wiki](http://wiki.ros.org/rosbag/Commandline)