# icp point_to_plane

http://www.pcl-users.org/Re-How-to-use-TransformationEstimationPointToPlane-td3930196.html

  pcl::copyPointCloud(current_pointcloud_, current_pointcloud_normal_);

  pcl::NormalEstimation<pcl::PointNormal, pcl::PointNormal> norm_est;

  norm_est.setSearchMethod (pcl::search::KdTree<pcl::PointNormal>::Ptr (new pcl::search::KdTree<pcl::PointNormal>));

  norm_est.setKSearch (10);

  norm_est.setInputCloud (current_pointcloud_normal_.makeShared());

  norm_est.compute (current_pointcloud_normal_);

  registration_.setInputCloud(current_pointcloud_normal_.makeShared());

  registration_.setInputSource(current_pointcloud_normal_.makeShared());

  registration_.setRANSACOutlierRejectionThreshold(0.03);

  registration_.setRANSACIterations(20);

  registration_.setMaximumIterations(50);

  registration_.setTransformationEpsilon(1e-3);

  pcl::PointCloud<pcl::PointNormal> output;

  registration_.align(output);

If you intend to use TransformationEstimationPointToPlane with the IterativeClosestPoint object, here is the sample code. The trick is to set the transformation estimation object in IterativeClosestPoint using setTransformationEstimation() function. 

Things are a bit different with the new registration pipeline in PCL for which I will be writing a tutorial. 

\#include <pcl/features/normal_3d.h>

\#include <pcl/registration/transformation_estimation_point_to_plane.h>

void point_to_plane (pcl::PointCloud<pcl::PointXYZ>::Ptr& cloud1, 

​               pcl::PointCloud<pcl::PointXYZ>::Ptr& cloud2) 

{

  pcl::PointCloud<pcl::PointNormal>::Ptr src(new pcl::PointCloud<pcl::PointNormal>);

  pcl::copyPointCloud(*cloud1, *src);

  pcl::PointCloud<pcl::PointNormal>::Ptr tgt(new pcl::PointCloud<pcl::PointNormal>);

  pcl::copyPointCloud(*cloud2, *tgt);

  pcl::NormalEstimation<pcl::PointNormal, pcl::PointNormal> norm_est;

  norm_est.setSearchMethod (pcl::search::KdTree<pcl::PointNormal>::Ptr (new pcl::search::KdTree<pcl::PointNormal>));

  norm_est.setKSearch (10);

  norm_est.setInputCloud (tgt);

  norm_est.compute (*tgt);

  pcl::IterativeClosestPoint<pcl::PointNormal, pcl::PointNormal> icp;

  typedef pcl::registration::TransformationEstimationPointToPlane<pcl::PointNormal, pcl::PointNormal> PointToPlane;

  boost::shared_ptr<PointToPlane> point_to_plane(new PointToPlane);

  icp.setTransformationEstimation(point_to_plane);

  icp.setInputCloud(src);

  icp.setInputTarget(tgt);

  // icp.setRANSACOutlierRejectionThreshold(ransac_par);

  icp.setRANSACIterations(100);

  icp.setMaximumIterations(1000);

  icp.setTransformationEpsilon(1e-3);

  pcl::PointCloud<pcl::PointNormal> output;

  icp.align(output);

 

  std::cout << icp.getFinalTransformation() << std::endl;	

}