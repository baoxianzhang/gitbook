# proj4

http://proj4.org/

http://blog.csdn.net/csxiaoshui/article/details/48679703

 GIS(Geographic Information System 地理信息系统）领域中最常提及 的一个概念是坐标系统，当我们提及一个地理位置的时候，与之伴随而产生的是该位置必定在一个空间参考下。当我们使用GPS设备获取到某个位置的经纬度的时候，我们实际上得到的是一个WGS-84椭球坐标系统下的空间地理坐标。目前空间坐标系统已经十分繁多，这些坐标系统有着特定的使用场合，并且可以通过一定的方式实现它们之间的相互转换，本文提到的Proj.4库正是这样一个提供了不同坐标系统（空间参考）之间相互转换的强大的工具。关于空间参考的详细介绍以及它们之间的转换方法可以参考以下的内容：[Geometric Aspects of Mappin](http://kartoweb.itc.nl/geometrics/index.html)g