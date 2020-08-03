# How to handle big repositories with Git

主要参考：

<https://www.atlassian.com/git/tutorials/big-repositories>



## 方法一 --depth

```sh
git clone --depth [depth] [remote-url] 
```



## 方法二 git gc

```sh
git gc # git gabage collection
```



## 方法三 LFS

<https://zhuanlan.zhihu.com/p/146683392>

```sh
git lfs track "*.ogg"
git lfs untrack "*.ogg"
git lfs clone xxxxx

```



## 方法四 --brancch

```sh
git clone [remote url] --branch [branch_name] --single-branch [folder]
```



## 方法五sparse-checkout

```sh
git sparse-checkout
```



## 方法六 filter-branch

```sh
git filter-branch --tree-filter 'rm -rf [/path/to/spurious/asset/folder]'
```

```sh
# 列出前5个大文件
git rev-list --objects --all | grep "$(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -5 | awk '{print$1}')" >> large-files.txt
# 提取大文件的路径
cat large-files.txt| awk '{print $2}' | tr '\n' ' ' >> large-files-inline.txt
# 从git历史中删除大文件
git filter-branch -f --prune-empty --index-filter "git rm -rf --cached --ignore-unmatch `cat large-files-inline.txt`" --tag-name-filter cat -- --all
rm large-files.txt
rm large-files-inline.txt
# 推送到远端服务器
git push origin --force --all
git push origin --force --tags
```



