# python 元素倒序排列

**求问：a=python a[::-1]=?**

将列表a倒序处理，如果a＝［1，2，3］，则a［：：－1］＝［3，2，1］。前两个冒号表示处理整个列表，也可以写上参数表示处理列表的一部分，例如a［2:0:－1］=［3,2］，第一个参数表示起始点包括起始点，第二个参数表示结束点但不包括结束点。最后一个参数如果为负的话，需要保证第一个参数大于第二个参数，表示依次递减逆序，否则会输出空列表。最后一个参数为正同理。

就酱～◝(・▿・)◜

作者：任育成

链接：https://www.zhihu.com/question/28600108/answer/41420669

来源：知乎

著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

​    def load_image(self, idx):

​        """

​        Load input image and preprocess for Caffe:

​        \- cast to float

​        **- switch channels RGB -> BGR**

​        \- subtract mean

​        \- transpose to channel x height x width order

​        """

​        im = Image.open('{}/JPEGImages/{}.jpg'.format(self.voc_dir, idx))

​        in_ = np.array(im, dtype=np.float32)

​        **in_ = in_[:,:,::-1]**

​        in_ -= self.mean

​        in_ = in_.transpose((2,0,1))

​        return in_