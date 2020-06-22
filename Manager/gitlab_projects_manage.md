# gitlab管理项目需求，方案，开发，测试，发布

## 通过issue, milestone管理需求方案开发测试发布的过程

+ 通过定义issue board，管理开发流程

  + Backlog 提需求，未被确认
  + ToDo 需求认可，并在方案确认阶段
  + Doing 开发过程
  + Review&Test&Release 审查，测试，发布
  + Close  项目总结，关闭

+ 以上都是记录开发的过程，而不是在issue上详细记录。相关的文档应该放在项目的gitlab仓库中，并保留原始可编辑的文档。

+ 通过gitlab的TimeTracking(/spend, /estimate)， Due Date来管理每件项目的时间点

+ 通过gitlab的milestone来管理需求项目的分类，制定开始和结束时间，规划一定时间段的事情。

+ 项目的甘特图可以通过安装ganttlab(  https://hub.docker.com/r/ganttlab/ganttlab ) 来实现（gitlab的免费版本没有Epics，不然gitlab就已经集成了)

  ```
  
  docker pull ganttlab/ganttlab
  
  GanttLab
  You can run GanttLab right now with this one liner in your console:
  
  docker run -p 8282:80 ganttlab/ganttlab
  Enjoy it on http://localhost:8282.
  
  Help and links
  Get help on Twitter or the GanttLab issues tracker. For more information, see:
  
  GanttLab.org website on https://www.ganttlab.com
  open source code here https://gitlab.com/ganttlab/ganttlab
  which includes the actual Dockerfile that builds this image https://gitlab.com/ganttlab/ganttlab/-/blob/master/devops/deploy/DockerHub/Dockerfile
  Configuration
  This official GanttLab Docker image comes with the default configuration, as you can experience on https://app.ganttlab.com.
  
  To customize the configuration, you'll need to build your own version of GanttLab, and then create your Docker image with that version you built: have a look at the Download and Install guide to get insights into this process.
  
  
  ```

+ 通过gitlab-time-report（https://github.com/insolite/gitlab-time-report）来记录工时

  GITLAB_URL="http://192.168.1.20"

  

  另外： https://github.com/zubroide/gitpab也是一个选项，没有测试成功，界面上开没有 gitlab-time-report好。

  

  

