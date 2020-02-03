

# MagCalibration

描述硬磁和软磁： Hard and Soft Iron Model

最小二乘法，4， 7， 10算法（所有的理论都有）

Document Number: AN5019



Freescale Semiconductor  Application note:

Document Number: AN4246

<<Calibrating an eCompass in the Presence of Hard and Soft-Iron Interference>>

描述硬磁和软磁： Hard and Soft Iron Model

最小二乘法，4 参数算法



https://community.freescale.com/thread/353097

Great question! I queried the engineer who wrote the code, and the following is his reply:

*The decision not to (by default) save the calibration parameters in the reference software was made for two reasons:*

1. *From a marketing perspective, Freescale felt that it was more valuable to demonstrate the operation of the calibration algorithms after a cold start rather than using pre-stored values.*
2. *Calibration coefficients are temperature dependent and coefficients stored at the last power down will be non-optimal if the ambient temperature or electronics' temperature has changed in the meantime.*

*The safest approach is therefore to recompute the calibration whenever the electronic compass is powered up.*

*If this is inconvenient, then the following approach should be used:*

- *The hard iron calibration vector (fV), the inverse soft iron matrix (finvW) and the geomagnetic field strength (fB) from the*

*MagCalibration structure should be stored on power down and copied into the structure on next power up. The logic here is that these parameters may be inaccurate due to temperature changes since the last power down but are still better than a null calibration.*

- *The contents of the magnetic buffer should not be stored. The logic here is that these measurements may have been captured at a different operating temperature and will simply get in the way of computing a new calibration after power up at the new operating temperature.*
- *The percentage Fit Error (fFitErrorpc in the MagCalibration structure) should not be stored but should be initialized on power up to a value such as 10% (corresponding to 3 green bars on the Freescale demonstration user interface) or 12% (corresponding to 2 green bars). This ensures that the previously stored calibration is quickly replaced once new measurements are captured into the magnetic buffer. This avoids the problem of an excellent calibration with, say, 1% fit error, being stored at power down with its fit error and then locking out a new calibration which may be more accurate at the new operating temperature but only achieves a (still excellent) calibration fit of 2%.*