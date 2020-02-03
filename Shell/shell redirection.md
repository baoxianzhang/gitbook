# shell redirection

https://unix.stackexchange.com/questions/42728/what-does-31-12-23-do-in-a-script

The numbers are file descriptors and only the first three (starting with zero) have a standardized meaning:

0 - stdin 1 - stdout 2 - stderr

So each of these numbers in your command refer to a file descriptor. You can either redirect a file descriptor to a file with > or redirect it to another file descriptor with >&

The 3>&1 in your command line will create a new file descriptor and redirect it to 1 which is STDOUT. Now 1>&2 will redirect the file descriptor 1 to STDERR and 2>&3 will redirect file descriptor 2 to 3 which is STDOUT.

So basically you switched STDOUT and STDERR, these are the steps:

1. Create a new fd 3 and point it to the fd 1
2. Redirect file descriptor 1 to file descriptor 2. If we wouldn't have saved the file descriptor in 3 we would lose the target.
3. Redirect file descriptor 2 to file descriptor 3. Now file descriptors one and two are switched.

Now if the program prints something to the file descriptor 1, it will be printed to the file descriptor 2 and vice versa.

http://www.jb51.net/article/64183.htm