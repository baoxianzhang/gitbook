# git rebase “deleted by us” and “deleted by them”

http://stackoverflow.com/questions/27420165/git-rebase-deleted-by-us-and-deleted-by-them

Suppose I am rebasing "experiment" branch on "master" and there are conflicts in files. And offcourse there are files deleted in both branches. So when I am resolving the conflicts, in "git status" I see "deleted by us" and "deleted by them". Its very confusing. Is there any way of understanding what they mean? Who is "them" and who is "us"

Or while rebasing is there any other way to know which file was deleted by which branch? Like printing the branch name?

Note that a rebase merge works by replaying each commit from the working branch on top of the <upstream> branch. Because of this, when a merge conflict happens**, the side reported as ours is the so-far rebased series, starting with** ******, and theirs is the working branch**. In other words, the sides are swapped.

https://git-scm.com/docs/git-rebase

Hence, files "deleted by us" are those that were deleted on the branch you are rebasing *onto* (the final branch), and files "deleted by them" are files that were deleted in the branch you are rebasing (the one that will be dropped).

AFAIK there is no switch to display the specific names of the branches explicitly on the official tools. Unless I'm wrong this is just one of those things you need to learn to get through the initial confusion.

To their credit, it does make a lot of sense if you think about it.

http://stackoverflow.com/questions/21025314/who-is-us-according-to-git

After a git rebase, you can find some files marked as *deleted by us* in the git status report. Who is *us* according to git and why? Is it referring to me sitting on this branch and it working for me? Or is it referring to itself and the guys on the branch i am rebasing against?

**When you** **merge****,**us** **refers to the branch you're merging into, as opposed to** **them****, the branch to be merged.**

**When you** **rebase****,** **us** **refers the upstream branch, and** **them** **is the branch you're moving about. It's a bit counter-intuitive in case of a rebase.**

**The reason is that git uses the same merge-engine for rebase, and it's actually cherry-picking your stuff into the upstream branch.** **us** **= into,** **them** **= from.**