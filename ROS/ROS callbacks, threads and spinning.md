# ROS callbacks, threads and spinning

http://answers.ros.org/question/53055/ros-callbacks-threads-and-spinning/

Briefly: It won't work as you expect and you probably do not need such a complex way of designing your node.

**The theory**

When it comes to communication in roscpp, two kind of objects are handling callbacks:

- [callback queues](http://ros.org/doc/groovy/api/roscpp/html/classros_1_1CallbackQueue.html)
- [spinners](http://ros.org/doc/groovy/api/roscpp/html/classros_1_1Spinner.html)

A spinner is an object that has the ability to call the callbacks contained in a callback queue. A callback queue is the object in which each subscriber will add an element each time a message is received by resolving which kind of message should call which callbacks (and with which arguments).

Regarding the spinners, there is currently three implementations available in roscpp:

- [Single thread spinner](http://ros.org/doc/groovy/api/roscpp/html/classros_1_1SingleThreadedSpinner.html): the default one, takes the messages contained in a callback queue and process the callbacks one by one while blocking the execution of the thread that called it.
- [Multi-threaded spinner](http://ros.org/doc/groovy/api/roscpp/html/classros_1_1MultiThreadedSpinner.html): spawns a couple of threads (configurable) that will execute callbacks in parallel when messages are received but blocks the execution of the thread that called it.
- [Asynchronous spinner](http://ros.org/doc/groovy/api/roscpp/html/classros_1_1AsyncSpinner.html): spawns a couple of threads (configurable) that will execute callbacks in parallel while **not** blocking the thread that called it. The start/stop method allows to control when the callbacks start being processed and when it should stop.

These objects **may** be instantiated manually in advanced ROS nodes but to avoid verbose initialization, an [alternative, object-less, API](http://ros.org/doc/groovy/api/roscpp/html/init_8h_source.html) is provided through functions in the ROS namespace. Aka ros::spin(), ros::spinOnce() and so on. This API rely on a default callback queue implemented as a singleton which is accessible through the ros::getGlobalCallbackQueue() function.

So basically when you call the ros::spinOnce() function, a single-thread spinner is created and its spin method is called once using the default callback queue (see [init.cpp](https://github.com/ros/ros_comm/blob/groovy-devel/clients/roscpp/src/libros/init.cpp) from roscpp).

And to finish, when you create a Subscriber, you pass it a NodeHandle and each NodeHandle has an associated callbackqueue that default to the global one but which can be overridden using the getCallbackQueue/setCallbackQueue methods.

**Your case**

If you take a look at [spinner.cpp](https://github.com/ros/ros_comm/blob/groovy-devel/clients/roscpp/src/libros/spinner.cpp) you will see there is a mutex that make the SingleThreader thread-safe *while*discouraging you to use it in this case (line 48).

Conclusion: what you do is safe *but* will trigger regularly ROS error messages as there is chances that several instances of ros::SpinOnce will be executed in parallel.

**Proposed solution**

Considering your applications, I think your callbacks are just not written as they should. **A callback should stay as simple and fast as possible**. In most of the cases, a callback is just feeding ROS data to your own classes which is usually as simple as copying data (and maybe converting them). It will help you ensuring that your callbacks are thread-safe (if you want to convert your node to a nodelet for instance, one day) and avoid making "ros::Spin" blocking for a long time, even in the case you are using the single-threaded spinner.

Typically, if you want to do time-consuming computations such as "leg detection", the callbacks are definitively *not* the place to do it.

Just, copy your data to a LegDetector object instance and call in your main thread the method that will do the heavy work. In particular here, you really don't care about losing old messages if your node is not fast enough so there is really no reason to pay the extra-burden of all the multi-thread infrastructure. Use Boost.Bind for instance, to pass a reference to your LegDetector class to the callback that will just copy the relevant laser data into it.

If, at some point, you need to synchronise the received data, use the [message_filters](http://www.ros.org/wiki/message_filters) API. In this case again, trying to use multi-thread to do so is definitively a bad idea.