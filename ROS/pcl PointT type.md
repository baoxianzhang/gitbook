

# pcl PointT type

http://pointclouds.org/documentation/tutorials/adding_custom_ptype.php

举例：

*PointXYZ* - Members: float x, y, z;

This is one of the most used data types, as it represents 3D xyz information only. The 3 floats are padded with an additional float for SSE alignment. The user can either access *points[i].data[0]* or *points[i].x* for accessing say, the x coordinate.

**union** **{**  **float** **data[****4****];**  **struct**  **{**    **float** **x;**    **float** **y;**    **float** **z;  }; };**

使用union是为了自己对其，使用SSE加速。所以要有4个float类型。

union中最大的大小是，采用的是union中所有类型中占用的最大空间的类型， 比如例子中的union为4个float型大小。