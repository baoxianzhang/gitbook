# No rule to make target 'opencv_calib3d-NOTFOUND'



原因是： opencv 3.3.1 需要是release

其他配置都会报这个错

Always build OpenCV with CMAKE_BUILD_TYPE=Release

https://github.com/ros-gbp/opencv3-release/pull/15

https://github.com/ros-gbp/opencv3-release