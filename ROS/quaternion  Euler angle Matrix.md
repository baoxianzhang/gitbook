# quaternion  Euler angle Matrix

\1. quternion to eulerAngles

Eigen:：Quaterniond q;

  q.toRotationMatrix().eulerAngles()

\2. eulerAngles to matrix

  Eigen::Matrix4d fl_T  = Eigen::Matrix4d::Identity();

  Eigen::AngleAxisd V_roll(4*M_PI/180, Eigen::Vector3d(1, 0, 0));

  Eigen::AngleAxisd V_yaw(13.5*M_PI/180, Eigen::Vector3d(0, 0, 1));

  fl_T.block<3, 3>(0, 0) = V_yaw.matrix()*V_roll.matrix();

  fl_T(0, 3) = 4.23 - half_x - 1;

  fl_T(1, 3) = 1.48 - half_y;

  fl_T(2, 3) = 0;

\3. matrix to quternion

​    Quaterniond q{Rs[i]};

\4. quternion to matrix

q.toRotationMatrix()