# GPS XYZ proj4

Proj.4是开源GIS最著名的地图投影库，许多GIS开源软件的投影都直接使用Proj.4的库文件。该项目遵循MIT license，用C语言编写，由USGS的Gerald I. Evenden在1980年代创立并一直维护到退休，后转手到Frank Warmerdam手中。Warmerdam现任OSGeo主席，于2008年5月把Proj.4纳入成为**MetaCRS**的一部分。需要自己编译安装才可使用。

功能主要有经纬度坐标与地理坐标的转换，坐标系的转换，包括基准变换等，下面以命令行方式和编程方式来说明经纬度坐标与地理坐标转换功能的使用。

 

**3.1 格式**

\1.  球面坐标与投影坐标

proj [-control] [+control] [files]

-：表示输出控制。

+：表示设定投影参数。

CTRL+Z退出。

正常情况：从球面坐标到投影坐标。

-I：从投影坐标到球面坐标。

1)  正常情况

输入：X（经度），Y（纬度）

输出：X(水平方向坐标) Y(垂直方向坐标)

2)  反向转换

输入：X(水平方向坐标) Y(垂直方向坐标)

输出：X（经度），Y（纬度）

\2.  坐标与距离

geod –control +control

-：表示输出控制。

+：表示设定投影参数。

CTRL+Z退出。

正常情况：根据起点，以及距离起点的角度和距离，确定终点的坐标以及终点到起点的角度。

-I：根据起点和终点的坐标，确定起点到终点的角度，终点到起点的角度、距离。

1)  正常情况

输入：X(起点纬度) Y(起点经度) A(起点到终点角度) D(起点到终点距离)

输出：X(终点纬度) Y(终点经度) A(终点到起点角度)

2)  反向转换

输入：X(起点纬度) Y(起点经度) X(终点纬度) Y(终点经度)

输出：A(起点到终点角度) A(终点到起点角度) D(起点到终点距离)

**3.2 坐标定义：+control**

+proj=name：定义投影坐标系统名称

+ellips=name：定义椭球体。

+lon_0=n：定义中央经线。

+lat_1=n：定义标准纬线1。

+lat_2=n：定义标准纬线2。

+x_0=n：定义东移距离。

+y_0=n：定义南移距离。

+k=n：定义缩放倍数。

+init=文件路径<关键字>：文件路径是存放坐标系统定义的文件，关键字用于标识坐标系统。

自定义坐标系统：<坐标系统关键字>……（坐标定义）<>(结束标识)。就可以将定义的坐标系统保存到文件中

**Proj4使用方法：**

\#define RAD_TO_DEG 57.29577951308232//1弧度转换为角度

\#define DEG_TO_RAD .0174532925199432958//1角度转换为弧度

projPJ:void *型指针，用于表示一个投影类型，对于地理坐标，也使用这个类型，定义时使用’+proj=name +ellps’定义。

projPJ pj_init_plus(const char *);//用于生成projPJ类型的指针。成功返回指针，失败返回NULL

int pj_transform(src,des,count,offset,x,y,z);//src:源坐标系统，des:目标坐标系统，count：点数目，offset:起始索引，x,y,z：经度，纬度，高度的数组地址。成功返回0，失败返回错误代码。

void pj_free(projPJ pj);//释放当前的坐标系统。

int pj_is_latlong(projPJ pj);//如果定义时使用+proj=latlong，则返回TRUE（在Windows下）。

int pj_is_geocent(projPJ pj);//如果定义时使用+proj=geocent，则返回TRUE（在Windows下）。

projPJ pj_latlong_from_proj(projPJ pj);//返回pj投影对应的地理坐标系。

char *pj_get_def(projPj pj,int option);// option是保留参数。返回pj的定义。

char *pj_strerrno(int errno);//返回errno对应的错误号的详细内容。

int *pj_get_errno_ref(void);//返回当前的错误号。

const char*pj_get_release();//返回当前版本信息。

  Eigen::Matrix4d rpp_matrix;

  rpp_matrix << -0.917575522608719, -0.397561517641403, 0, 0,

​                 0.155712254473981, -0.359385269789666, 0.920106473004532, 0,

​                 -0.36579892579936, 0.844267177822799,  0.391668326949169, 0,

​                 -2334314.577652, 5387618.829984, 2482666.030232, 1;

  // XYZ to LLA

  Eigen::Vector4d xyz;

  xyz << 1, 2, 3, 1;

  Eigen::Vector4d ecef_xyz;

  ecef_xyz = rpp_matrix.transpose() * xyz;

  const char* projStrCartesian = "+proj=geocent +datum=WGS84";

  const char* projStrWGS84 = "+proj=latlong +datum=WGS84 +units=m";

  projPJ projWGS84;

  projPJ projCartesian;

  projWGS84 = pj_init_plus(projStrWGS84);

  projCartesian = pj_init_plus(projStrCartesian);

  double lon = ecef_xyz[0] , lat = ecef_xyz[1], h = ecef_xyz[2];

  int ret = pj_transform(projCartesian, projWGS84, 1, 1, &lon, &lat, &h);