# Cast Eigen MatrixXd to Eigen MatrixXf

https://stackoverflow.com/questions/24764031/cast-eigenmatrixxd-to-eigenmatrixxf

Try this:

```c++
Eigen::MatrixXd d;                       // Matrix of doubles. 

Eigen::MatrixXf f = d.cast <float> ();   // Matrix of floats.
```

