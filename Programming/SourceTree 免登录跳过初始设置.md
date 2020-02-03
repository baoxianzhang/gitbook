# SourceTree 免登录跳过初始设置

http://www.cnblogs.com/xiofee/p/sourcetree_pass_initialization_setup.html

[**SourceTree 免登录跳过初始设置**](http://www.cnblogs.com/xiofee/p/sourcetree_pass_initialization_setup.html)



SourceTree 安装之后需要使用账号登陆以授权，以前是可以不登陆的，但是现在是强制登陆。

虽然是免费授权，但是碰上不可抗力因素，登陆不是很方便，这里记录一下跳过这个初始化的步骤。

 

安装之后，转到用户本地文件夹下的 SourceTree 目录，没有则新建

%LocalAppData%\Atlassian\SourceTree\

(%LocalAppData%--->C:\Users\Administrator\AppData\Local)

新建 accounts.json 文件

%LocalAppData%\Atlassian\SourceTree\accounts.json

输入以下内容保存即可

```c++
[
  {
    "$id": "1",
    "$type": "SourceTree.Api.Host.Identity.Model.IdentityAccount, SourceTree.Api.Host.Identity",
    "Authenticate": true,
    "HostInstance": {
      "$id": "2",
      "$type": "SourceTree.Host.Atlassianaccount.AtlassianAccountInstance, SourceTree.Host.AtlassianAccount",
      "Host": {
        "$id": "3",
        "$type": "SourceTree.Host.Atlassianaccount.AtlassianAccountHost, SourceTree.Host.AtlassianAccount",
        "Id": "atlassian account"
      },
      "BaseUrl": "https://id.atlassian.com/"
    },
    "Credentials": {
      "$id": "4",
      "$type": "SourceTree.Model.BasicAuthCredentials, SourceTree.Api.Account",
      "Username": "",
      "Email": null
    },
    "IsDefault": false
  }
]
```





现在再打开 SourceTree，直接显示主窗口了