# split and merge tar file

https://askubuntu.com/questions/54579/how-to-split-larger-files-into-smaller-parts

split -b 3072m loc.bag.tar.gz  loc_bag.tar.gz.

merge example: 

cat loc_bag.tar.gz.* > loc_bag.bag.tar.gz

https://askubuntu.com/questions/54579/how-to-split-larger-files-into-smaller-parts

down voteaccepted

There are several ways to accomplish this. Let's start with the basic ones.

Using the **split** and **cat** commands:

Lets says I have an image and its too big (10MB). All I do is:

split --bytes=1M /path/to/image/image.jpg /path/to/image/prefixForNewImagePieces

and then to put it together I use cat:

cat prefixFiles* > newimage.jpg

For example:

Assuming am inside the folder where the image is:

split --bytes=1M myimage.jpg new

if the image is inside a directory called images you can also do this:

split --bytes=1M images/myimage.jpg new

If the image is inside the directory /home/cyrex/images you can do this:

split --bytes=1M /home/cyrex/images/myimage.jpg new

(In all the cases above it will split myimage.jpg in 1MB pieces and prefix the name of the pieces with the word new. So they would look like newaa, newab, newac, newad...)

If you are splitting a **Text file** and want to split it by lines you can do this:

split -l 1000 book.txt new

Which will split the text file in output files of 1000 lines each. This is another way to split a file and is mostly used for text files like logs, sql dumps, csv files, etc..

Then I merge them

cat new* > newimage.jpg

This is one way. You can even change the size of the splitted pieces. Just change the part that says --bytes=1M to --bytes=1K for 1 kilobyte or 1G for giga, or another number like --bytes=4K for 4KB pieces.

Using **Nautilus**

Another way is the compress option in the gui of Nautilus. It gives you an option to split the file or files you want to compress into smaller megabyte sizes. Its simple and easy.

Yet another way is using **7z**

Assuming you have an ISO image called ubuntu.iso you could do this:

7z a -v5m -mx0 ubuntu.7z ubuntu.iso

This will create 5MB size files from the ubuntu.iso. The -v5m is the volume size so you can change it to 10, 12, 1, 3 and also the m can be changed to k for kilobytes, etc; the -mx0 switch tells 7-Zip to use no compression, that is, just to split data into parts.

To extract just do

7z x ubuntu.7z.001

this way you extract the first file and 7z starts extracting from the following files in order. You can also do

7z e ubuntu.7z.001

which has the same effect here.