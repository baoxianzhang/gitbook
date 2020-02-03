# error request for member ‘__getMD5Sum’ in ‘m’, which is of non-class type ‘const

error: request for member ‘__getMD5Sum’ in ‘m’, which is of non-class type ‘const float’

原因是因为，publish中出现直接publsh int float等类型，应该为std_msgs::Float32等故会报错。