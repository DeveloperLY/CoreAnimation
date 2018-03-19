# Core Animation

* `Core Animation`，中文翻译为核心动画，它是一组非常强大的动画处理`API`，使用它能做出非常炫丽的动画效果，而且往往是事半功倍。也就是说，使用少量的代码就可以实现非常强大的功能。
* `Core Animation`可以用在`MacOS`和`iOS`平台。
* `Core Animation`的动画执行过程都是在后台操作的，不会阻塞主线程。
* 要注意的是，`Core Animation`是直接作用在`CALayer`上的，并非`UIView`。
* 乔帮主在`2007`年的`WWDC`大会上亲自为你演示`Core Animation`的强大：[点击查看视频](http://v.youku.com/v_show/id_XMzQ2MTcwNDQ0.html)


## 一、CALayer
* 在iOS中，你能看得见摸得着的东西基本上都是`UIView`，比如一个按钮、一个文本标签、一个文本输入框、一个图标等等，这些都是`UIView`

* 其实`UIView`之所以能显示在屏幕上，完全是因为它内部的一个图层

* 在创建`UIView`对象时，`UIView`内部会自动创建一个图层(即`CALayer`对象)，通过`UIView`的`layer`属性可以访问这个层
```Objective-C
@property(nonatomic,readonly,retain) CALayer *layer; 
```

* 当`UIView`需要显示到屏幕上时，会调用`drawRect:`方法进行绘图，并且会将所有内容绘制在自己的图层上，绘图完毕后，系统会将图层拷贝到屏幕上，于是就完成了`UIView`的显示

* 换句话说，`UIView`本身不具备显示的功能，是它内部的层才有显示功能

### 关于CALayer的疑惑
* 首先
 * `CALayer`是定义在`QuartzCore`框架中的
 * `CGImageRef`、`CGColorRef`两种数据类型是定义在`CoreGraphics`框架中的
 * `UIColor`、`UIImage`是定义在`UIKit`框架中的

* 其次
 * `QuartzCore`框架和`CoreGraphics`框架是可以跨平台使用的，在`iOS`和`MacOS`上都能使用
 * 但是`UIKit`只能在`iOS`中使用

 * 为了保证可移植性，`QuartzCore`不能使用`UIImage`、`UIColor`，只能使用`CGImageRef`、`CGColorRef`
 * `CALayer`的性能比`UIView`高一些，它少了事件处理功能，所以更轻量级，但不处理用户的触摸事件。使用时根据需要选择使用。
 
### 隐式动画
* 每一`UIView`内部都默认关联着一个`CALayer`，我们可用称这个`Layer`为`Root Layer`（根层）

* 所有的非`Root Layer`，也就是手动创建的`CALayer`对象，都存在着隐式动画

* 什么是隐式动画？
 * 当对非`Root Layer`的部分属性进行修改时，默认会自动产生一些动画效果
 * 而这些属性称为`Animatable Properties`(可动画属性)

* 可以通过动画事务(`CATransaction`)关闭默认的隐式动画效果

```Objective-C
[CATransaction begin];
[CATransaction setDisableActions:YES];
self.myview.layer.position = CGPointMake(10, 10);
[CATransaction commit];
```