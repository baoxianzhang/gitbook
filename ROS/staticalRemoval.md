# staticalRemoval





  /** \brief @b StatisticalOutlierRemoval uses point neighborhood statistics to filter outlier data.

​    \* \details The algorithm iterates through the entire input twice:

​    \* During the first iteration it will compute the average distance that each point has to its nearest k neighbors.

​    \* The value of k can be set using setMeanK().

​    \* Next, the mean and standard deviation of all these distances are computed in order to determine a distance threshold.

​    \* The distance threshold will be equal to: mean + stddev_mult * stddev.

​    \* The multiplier for the standard deviation can be set using setStddevMulThresh().

​    \* During the next iteration the points will be classified as inlier or outlier if their average neighbor distance is below or above this threshold respectively.

​    \* <br>

​    \* The neighbors found for each query point will be found amongst ALL points of setInputCloud(), not just those indexed by setIndices().

​    \* The setIndices() method only indexes the points that will be iterated through as search query points.

​    \* <br><br>

​    \* For more information:

​    \*   - R. B. Rusu, Z. C. Marton, N. Blodow, M. Dolha, and M. Beetz.

​    \*     Towards 3D Point Cloud Based Object Maps for Household Environments

​    \*     Robotics and Autonomous Systems Journal (Special Issue on Semantic Knowledge), 2008.

​    \* <br><br>

​    \* Usage example:

​    \* \code

​    \* pcl::StatisticalOutlierRemoval<PointType> sorfilter (true); // Initializing with true will allow us to extract the removed indices

​    \* sorfilter.setInputCloud (cloud_in);

​    \* sorfilter.setMeanK (8);

​    \* sorfilter.setStddevMulThresh (1.0);

​    \* sorfilter.filter (*cloud_out);

​    \* // The resulting cloud_out contains all points of cloud_in that have an average distance to their 8 nearest neighbors that is below the computed threshold

​    \* // Using a standard deviation multiplier of 1.0 and assuming the average distances are normally distributed there is a 84.1% chance that a point will be an inlier

​    \* indices_rem = sorfilter.getRemovedIndices ();

​    \* // The indices_rem array indexes all points of cloud_in that are outliers

​    \* \endcode

​    \* \author Radu Bogdan Rusu

​    \* \ingroup filters

​    */

K,的选取应该按照实际点云的分散程度，对应的点云部分取值。

stddev_mul应该是越大对应的滤除的点云就越小。

其中说的 Using a standard deviation multiplier of 1.0 and assuming the average distances are normally distributed there is a 84.1% chance that a point will be an inlier

是通过下高斯分布特性得到的84.1%