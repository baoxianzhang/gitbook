# CMakeLists区分电脑架构版本和ROS版本

第一，库需要编译成静态库；

第二，需要直接编译成对应名称的库，而不能事后修改库的名称。

```cmake


  if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")

​    if("$ENV{ROS_DISTRO}" STREQUAL "kinetic")

​      set(FILTER_LIB "filters_x86_64")

​      message("FILTER_LIB: " ${FILTER_LIB} )

​    else()

​      message(FATAL_ERROR "ROS VERSION NOT SUPPORT" )

​    endif()

  elseif (${CMAKE_SYSTEM_PROCESSOR} STREQUAL "aarch64")

​    if("$ENV{ROS_DISTRO}" STREQUAL "kinetic")

​      set(FILTER_LIB "filters_tx2")

​      message("FILTER_LIB: " ${FILTER_LIB} )

​    else()

​      message(FATAL_ERROR "ROS VERSION NOT SUPPORT" )

​    endif()

  else()

​    message(FATAL_ERROR "ARCHITECTURE NOT SUPPORT" )

  endif()
```

