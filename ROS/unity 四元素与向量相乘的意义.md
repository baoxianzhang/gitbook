# unity 四元素与向量相乘的意义



http://blog.sina.com.cn/s/blog_799860f90102w840.html

Quaternion.Euler(x,y,z) 返回一个绕x轴旋转x度再绕y轴旋转y度再绕z轴旋转z度的Quaternion

 

因此Quaternion.Euler(0,90,0)返回一个绕y轴旋转90度的旋转操作.

Quaternion作用于Vector3的右乘操作（*）返回一个将向量做旋转操作后的向量

 

举例：Quaternion.Euler(0,90,0)*Vector3(0.0,0.0,-10) 相当于把向量Vector3(0.0,0.0,-10)绕y轴旋转90度，得到的结果为Vector3(-10,0.0.0.0)