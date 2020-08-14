# C++11并发编程-条件变量(condition_variable)详解
修改自： https://www.2cto.com/kf/201506/411327.html

头文件主要包含了与条件变量相关的类和函数。相关的类包括 std::condition_variable和 std::condition_variable_any，还有枚举类型std::cv_status。另外还包括函数 std::notify_all_at_thread_exit()，下面分别介绍一下以上几种类型。

## 1 std::condition_variable 类介绍
std::condition_variable是条件变量，更多有关条件变量的定义参考维基百科。Linux下使用 Pthread库中的 pthread_cond_*() 函数提供了与条件变量相关的功能， Windows 则参考 MSDN。

当 std::condition_variable对象的某个wait 函数被调用的时候，它使用 std::unique_lock(通过 std::mutex) 来锁住当前线程。当前线程会一直被阻塞，直到另外一个线程在相同的 std::condition_variable 对象上调用了 notification 函数来唤醒当前线程。

std::condition_variable 对象通常使用 std::unique_lock 来等待，如果需要使用另外的 lockable 类型，可以使用std::condition_variable_any类，本文后面会讲到 std::condition_variable_any 的用法。
``` c++
#include <iostream>                // std::cout
#include <thread>                  // std::thread
#include <mutex>                   // std::mutex, std::unique_lock
#include <condition_variable>      // std::condition_variable
 
std::mutex mtx; // 全局互斥锁.
std::condition_variable cv; // 全局条件变量.
bool ready = false; // 全局标志位.
 
void do_print_id(int id)
{
    std::unique_lock <std::mutex> lck(mtx);
    while (!ready) // 如果标志位不为 true, 则等待...
        cv.wait(lck); // 当前线程被阻塞, 当全局标志位变为 true 之后,
    // 线程被唤醒, 继续往下执行打印线程编号id.
    std::cout << "thread " << id << '\n';
}
 
void go()
{
    std::unique_lock <std::mutex> lck(mtx);
    ready = true; // 设置全局标志位为 true.
    cv.notify_all(); // 唤醒所有线程.
}
 
int main()
{
    std::thread threads[10];
    // spawn 10 threads:
    for (int i = 0; i < 10; ++i)
        threads[i] = std::thread(do_print_id, i);
 
    std::cout << "10 threads ready to race...\n";
    go(); // go!
 
  for (auto & th:threads)
        th.join();
 
    return 0;
}
```

结果：
```
10 threads ready to race...
thread 1
thread 0
thread 2
thread 3
thread 4
thread 5
thread 6
thread 7
thread 8
thread 9
```
好了，对条件变量有了一个基本的了解之后，我们来看看 std::condition_variable 的各个成员函数。

std::condition_variable 的拷贝构造函数被禁用，只提供了默认构造函数。

## 2 std::condition_variable::wait() 介绍
```c++
void wait (unique_lock<mutex>& lck);
void wait (unique_lock<mutex>& lck, Predicate pred);
```
std::condition_variable提供了两种 wait() 函数。当前线程调用 wait() 后将被阻塞(此时当前线程应该获得了锁（mutex），不妨设获得锁 lck)，直到另外某个线程调用 notify_* 唤醒了当前线程。

在线程被阻塞时，该函数会自动调用 lck.unlock() 释放锁，使得其他被阻塞在锁竞争上的线程得以继续执行。另外，一旦当前线程获得通知(notified，通常是另外某个线程调用 notify_* 唤醒了当前线程)，wait()函数也是自动调用 lck.lock()，使得lck的状态和 wait 函数被调用时相同。

在第二种情况下（即设置了 Predicate），只有当 pred 条件为false 时调用 wait() 才会阻塞当前线程，并且在收到其他线程的通知后只有当 pred 为 true 时才会被解除阻塞。因此第二种情况类似以下代码：
```c++
while (!pred()) 
    wait(lck);
```
例子：    
```c++
#include <iostream>                // std::cout
#include <thread>                // std::thread, std::this_thread::yield
#include <mutex>                // std::mutex, std::unique_lock
#include <condition_variable>    // std::condition_variable
 
std::mutex mtx;
std::condition_variable cv;
 
int cargo = 0;
bool shipment_available()
{
    return cargo != 0;
}
 
// 消费者线程.
void consume(int n)
{
    for (int i = 0; i < n; ++i) {
        std::unique_lock <std::mutex> lck(mtx);
        cv.wait(lck, shipment_available);
        std::cout << cargo << '\n';
        cargo = 0;
    }
}
 
int main()
{
    std::thread consumer_thread(consume, 10); // 消费者线程.
 
    // 主线程为生产者线程, 生产 10 个物品.
    for (int i = 0; i < 10; ++i) {
        while (shipment_available())
            std::this_thread::yield();
        std::unique_lock <std::mutex> lck(mtx);
        cargo = i + 1;
        cv.notify_one();
    }
 
    consumer_thread.join();
 
    return 0;
}
```
结果：
```
1
2
3
4
5
6
7
8
9
10
```
## 3 std::condition_variable::wait_for() 介绍
```c++
cv_status wait_for (unique_lock<mutex>& lck,
                      const chrono::duration<rep,period>& rel_time);
bool wait_for (unique_lock<mutex>& lck,
                      const chrono::duration<rep,period>& rel_time, Predicate pred);
```
与std::condition_variable::wait() 类似，不过 wait_for可以指定一个时间段，在当前线程收到通知或者指定的时间 rel_time 超时之前，该线程都会处于阻塞状态。而一旦超时或者收到了其他线程的通知，wait_for返回，剩下的处理步骤和 wait()类似。

另外，wait_for 的重载版本的最后一个参数pred表示 wait_for的预测条件，只有当 pred条件为false时调用 wait()才会阻塞当前线程，并且在收到其他线程的通知后只有当 pred为 true时才会被解除阻塞，因此相当于如下代码：
```c++
return wait_until (lck, chrono::steady_clock::now() + rel_time, std::move(pred));
```
请看下面的例子（参考），下面的例子中，主线程等待th线程输入一个值，然后将th线程从终端接收的值打印出来，在th线程接受到值之前，主线程一直等待，每个一秒超时一次，并打印一个 "."：
```c++
#include <iostream>           // std::cout
#include <thread>             // std::thread
#include <chrono>             // std::chrono::seconds
#include <mutex>              // std::mutex, std::unique_lock
#include <condition_variable> // std::condition_variable, std::cv_status
 
std::condition_variable cv;
 
int value;
 
void do_read_value()
{
    std::cin >> value;
    cv.notify_one();
}
 
int main ()
{
    std::cout << "Please, enter an integer (I'll be printing dots): \n";
    std::thread th(do_read_value);
 
    std::mutex mtx;
    std::unique_lock<std::mutex> lck(mtx);
    while (cv.wait_for(lck,std::chrono::seconds(1)) == std::cv_status::timeout) {
        std::cout << '.';
        std::cout.flush();
    }
 
    std::cout << "You entered: " << value << '\n';
 
    th.join();
    return 0;
}
```
## 4 std::condition_variable::wait_until 介绍
```c++
cv_status wait_until (unique_lock<mutex>& lck,
                        const chrono::time_point<clock,duration>& abs_time);

bool wait_until (unique_lock<mutex>& lck,
                        const chrono::time_point<clock,duration>& abs_time,
                        Predicate pred);
```
与 std::condition_variable::wait_for 类似，但是wait_until可以指定一个时间点，在当前线程收到通知或者指定的时间点 abs_time超时之前，该线程都会处于阻塞状态。而一旦超时或者收到了其他线程的通知，wait_until返回，剩下的处理步骤和 wait_until() 类似。

另外，wait_until的重载版本的最后一个参数 pred表示 wait_until 的预测条件，只有当 pred 条件为 false时调用 wait()才会阻塞当前线程，并且在收到其他线程的通知后只有当pred为 true时才会被解除阻塞，因此相当于如下代码：

```c++
while (!pred())
  if ( wait_until(lck,abs_time) == cv_status::timeout)
    return pred();
return true;
```
## 5 std::condition_variable::notify_one() 介绍
唤醒某个等待(wait)线程。如果当前没有等待线程，则该函数什么也不做，如果同时存在多个等待线程，则唤醒某个线程是不确定的(unspecified)。

请看下例（参考）：
```c++
#include <iostream>                // std::cout
#include <thread>                // std::thread
#include <mutex>                // std::mutex, std::unique_lock
#include <condition_variable>    // std::condition_variable
 
std::mutex mtx;
std::condition_variable cv;
 
int cargo = 0; // shared value by producers and consumers
 
void consumer()
{
    std::unique_lock < std::mutex > lck(mtx);
    while (cargo == 0)
        cv.wait(lck);
    std::cout << cargo << '\n';
    cargo = 0;
}
 
void producer(int id)
{
    std::unique_lock < std::mutex > lck(mtx);
    cargo = id;
    cv.notify_one();
}
 
int main()
{
    std::thread consumers[10], producers[10];
 
    // spawn 10 consumers and 10 producers:
    for (int i = 0; i < 10; ++i) {
        consumers[i] = std::thread(consumer);
        producers[i] = std::thread(producer, i + 1);
    }
 
    // join them back:
    for (int i = 0; i < 10; ++i) {
        producers[i].join();
        consumers[i].join();
    }
 
    return 0;
}
```

## 6 std::condition_variable::notify_all() 介绍
唤醒所有的等待(wait)线程。如果当前没有等待线程，则该函数什么也不做。请看下面的例子：
```c++
#include <iostream>                // std::cout
#include <thread>                // std::thread
#include <mutex>                // std::mutex, std::unique_lock
#include <condition_variable>    // std::condition_variable
 
std::mutex mtx; // 全局互斥锁.
std::condition_variable cv; // 全局条件变量.
bool ready = false; // 全局标志位.
 
void do_print_id(int id)
{
    std::unique_lock <std::mutex> lck(mtx);
    while (!ready) // 如果标志位不为 true, 则等待...
        cv.wait(lck); // 当前线程被阻塞, 当全局标志位变为 true 之后,
    // 线程被唤醒, 继续往下执行打印线程编号id.
    std::cout << "thread " << id << '\n';
}
 
void go()
{
    std::unique_lock <std::mutex> lck(mtx);
    ready = true; // 设置全局标志位为 true.
    cv.notify_all(); // 唤醒所有线程.
}
 
int main()
{
    std::thread threads[10];
    // spawn 10 threads:
    for (int i = 0; i < 10; ++i)
        threads[i] = std::thread(do_print_id, i);
 
    std::cout << "10 threads ready to race...\n";
    go(); // go!
 
  for (auto & th:threads)
        th.join();
 
    return 0;
}
```
## 7 std::condition_variable_any 介绍
与 std::condition_variable类似，只不过std::condition_variable_any的 wait 函数可以接受任何 lockable参数，而 std::condition_variable只能接受 std::unique_lock类型的参数，除此以外，和std::condition_variable几乎完全一样。

## 8 std::cv_status枚举类型介绍

cv_status::no_timeout wait_for 或者wait_until没有超时，即在规定的时间段内线程收到了通知。

``` c++
cv_status::timeout  wait_for 或者 wait_until 超时。
```
## 9 std::notify_all_at_thread_exit
函数原型为：
```c++
void notify_all_at_thread_exit (condition_variable& cond, unique_lock<mutex> lck);
```
当调用该函数的线程退出时，所有在 cond 条件变量上等待的线程都会收到通知。请看下例（参考）：
```c++
#include <iostream>           // std::cout
#include <thread>             // std::thread
#include <mutex>              // std::mutex, std::unique_lock
#include <condition_variable> // std::condition_variable
 
std::mutex mtx;
std::condition_variable cv;
bool ready = false;
 
void print_id (int id) {
  std::unique_lock<std::mutex> lck(mtx);
  while (!ready) cv.wait(lck);
  // ...
  std::cout << "thread " << id << '\n';
}
 
void go() {
  std::unique_lock<std::mutex> lck(mtx);
  std::notify_all_at_thread_exit(cv, std::move(lck));
  ready = true;
}
 
int main ()
{
  std::thread threads[10];
  // spawn 10 threads:
  for (int i=0; i<10; ++i)
    threads[i] = std::thread(print_id,i);
  std::cout << "10 threads ready to race...\n";
 
  std::thread(go).detach();   // go!
 
  for (auto& th : threads) th.join();
 
  return 0;
}
```

好了，到此为止， 头文件中的两个条件变量类（std::condition_variable和std::condition_variable_any）、枚举类型（std::cv_status）、以及辅助函数（std::notify_all_at_thread_exit()）都已经介绍完了。







