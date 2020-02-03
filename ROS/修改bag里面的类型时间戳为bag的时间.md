# 修改bag里面的类型时间戳为bag的时间

https://answers.ros.org/question/82091/how-to-associate-rosbag-time-with-data/



```python
import os
import sys

import rosbag

def print_usage():
    print("Usage: fixbag.py <ros bag> <target topic>")


    print("Usage: fixbag.py recorded.bag /robot/imu")


if __name__ == "__main__":


    # Check CLI args
    if len(sys.argv) != 3:
        print_usage()
        exit(-1)

    bag_path = sys.argv[1]  # Path to ROS bag you want to repair
    target_topic = sys.argv[2]  # Target topic you want to repair
    repair_path = bag_path.replace(".bag", "-repaired.bag")  # Output bag path

    # Open bag
    bag = rosbag.Bag(bag_path, 'r')
    fix_bag = rosbag.Bag(repair_path, "w")  # Create a repaired bag

    # Iterate through bag
    for topic, msg, t in bag.read_messages():
        # Add time back to the target message header
        if topic == target_topic:
            msg.header.stamp.secs = t.secs
            msg.header.stamp.nsecs = t.nsecs

        # Write message to bag
        fix_bag.write(topic, msg, t)

    # Close bag - Very important else you'll have to reindex it
    fix_bag.close()
```

