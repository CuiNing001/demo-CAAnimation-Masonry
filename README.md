#### demo-CAAnimation-Masonry

#####Masonry
---

>> 设置约束 mas_makeConstraints

>  *  距父视图上下左右边距的偏移量

```
[view mas_makeConstraints:^(MASConstraintMaker *make){
	make.top.equalTo(weakSelf.view.mas_top).offset(0);
	make.left.equalTo(weakSelf.view.mas_left).offset(0);
	make.right.equalTo(weakSelf.view.mas_right).offset(-10);
	make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-10);
}];
```

```
[view mas_makeContraints:(MASContraintMake *make){
	make.edges.mas_offset(UIEdgeInsetsMake(10,10,10,10));
}]
```

> * 设置宽高

```
[view mas_makeContraints:(MASContraintMaker *make){
	make.heiht.mas_equalTo(40);
	make.width.mas_equalTo(40);
}];
```
```
[view mas_makeContraints:(MASContraintMaker *make){
	make.size.mas_equalTo(CGSizeMake(40,40));
}]
```

> *  设置垂直水平居中

```
[view mas_makeContraints:(MASContraintMaker *make){
	make.center.equalTo(weakSelf.view);
}]
```

>  * 设置水平居中

```
[view mas_makeContraints:(MASContraintMaker *make){
	make.centerY.mas_equalTo(weakSelf.view.mas_centerY);
}]
```

>  * 设置垂直居中

```
[view mas_makeContraints:(MSAContraintMaker *make){
	make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
}]
```

> *  设置距某个view中心点偏移量

```
[view mas_makeContraints:(MSAContraintMaker *make){
	make.centerX.mas_equalTo(weakSelf.view_1.mas_centerX).centerOffset(CGPointMake(x,y));
}]
```


>  * 设置宽高与某个view宽高相同

```
[view mas_makeContraints:(MASContraintMaker *make){
	make.width.equalTo(weakSelf.view.mas_height);
	make.height.equalTo(weakSelf.view.mas_width);
}]
```

>  * 设置宽高是某个view的宽高的倍数

```
[view mas_makeContraints:(MASContraintMaker *make){
	make.height.equalTo(weakSelf.view).multipliedBy(0.2);
	make.width.equalTo(weakSelf.view).multiplieBy(0.5);
}]
```


>> 更新约束 mas_updateConstraints

>  * 需主动触发系统修改约束方法

```
- (void)updateConstraints {
    [self.growingButton updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(self.buttonSize.width)).priorityLow();
        make.height.equalTo(@(self.buttonSize.height)).priorityLow();
        make.width.lessThanOrEqualTo(self);
        make.height.lessThanOrEqualTo(self);
    }];
    //最后记得回调super方法
    [super updateConstraints];
}

- (void)changeContraintsButton:(UIButton *)sender{
	[self setNeedsUpdateConstraints];
}

```

>  * 如果想要约束变换之后实现动画效果，则需要执行如下操作

```
// 通知需要更新约束，但是不立即执行
[self setNeedsUpdateConstraints];
// 立即更新约束，以执行动态变换
// update constraints now so we can animate the change
[self updateConstraintsIfNeeded];
// 执行动画效果, 设置动画时间
[UIView animateWithDuration:0.4 animations:^{
     [self layoutIfNeeded];
}];
```


>> tips

> * 重构方法:mas_remakeConstraints会移除之前view的所有约束,然后在添加约束
* 给view添加约束时,必须已经添加到其superview上
* 不需要设置view.translatesAutoresizingMaskIntoConstraints=NO,Masonry内部已经设置过了
* 使用offset时right和bottom使用负数
* AutoLayout关于更新的几个方法的区别: 
>  * setNeedsLayout:告知页面需要更新,但不会立刻开始更新.执行后会立即调用layoutSubView.
>  * layoutIfNeeded:告知页面布局立刻更新.所以一般都会和setNeedsLayout一起使用,如果希望立刻生成新的frame需要调用此方法,利用这点一般布局动画可以在更新布局后直接使用这个方法让动画生效
>  * layoutSubviews:系统重写布局
>  * setNeedsUpdateConstraints:告知需要更新约束,但不会立刻开始


####CAAnimation
---

> ####CABasicAnimation:基本动画

*  <font color=#FF8C00>创建animation</font>

```
/*
* @param: toValue 动画线路
* @param: duration 动画时长
* @param: repeatCount 重复次数
* @param: autoreverses 是否重复动画
* @param: timingFunction 动画时间的节奏控制
* @param: removeOnCompletion 动画结束后是否删除动画
* @param: fillMode 视图在非活动期间的行为
* @param: beginTime 动画延时执行时间
* HUGE_VALF : 表示无穷大
* M_PI : 180°
*/
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:"transform.rotation.z"];
	animation.toValue = [NSNumber numberWithFloat:4*M_PI];
	animation.duration = 2;
	animation.repeatCount = HUGE_VALF;
	animation.autoreverses = YES;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeBackwards;
	animation.beginTime = CACurrentMediaTime()+2;
	[view.layer addAnimation:animation forKey:"rotationAnimation"];
```


| keyPath | example | 动作 |
|:--|:--| :--|
| <font color=#2E8B57>CATransform3D Key Paths:</font> | <font color=#2E8B57>(example:)transform.rotation.z</font> | 
| transform.rotation |  transform.rotation | 旋转动画|
| transform.rotation.x | transform.rotation.x | 延x轴旋转|
| transform.rotation.y | transform.rotation.y | 延y轴旋转|
| transform.rotation.z | transform.rotation.z | 延中心点旋转|
| transform.scale | transform.scale | 缩放动画|
| transform.scale.x | transform.scale.x | 延x轴缩放|
| transform.scale.y | transform.scale.y | 延y轴缩放|
| translation.x | transform.translation.x | 移动 X轴 |
| translation.y | transform.translation.y | 移动 Y轴 |
| translation.z | transform.translation.z | 移动 Z轴 |
| translation | transform.translation | 移动 XY轴 |
| <font color=#2E8B57>CGPoint Key Paths:</font> | <font color=#2E8B57>(example:)position.x</font> |
| position | position | 修改位置 |
| position.x | position.x | 修改位置 X轴 |
| position.y | position.y | 修改位置 Y轴 |
|<font color=#2E8B57>CGRect Key Paths:</font>|<font color=#2E8B57>(example:)bounds.size.width</font>|
| bounds | bounds | 大小变化 |
| size.width | bounds.size.width | 宽度变化 |
| size.height | bound.size.height | 高度变化 |
| size | bounds.size | 大小变化 |
| opacity | opacity | 透明度 |
| backgroundColor | backgroundColor | 背景色 |
| cornerRadius | cornerRadius | 圆角 |
| borderWidth | borderWidth | 边框宽度 |
| borderColor | borderColor | 边框颜色 |
| contents | contents | 内容? |
|<font color=#2E8B57>Shadow Key Path:</font>|<font color=#2E8B57></font>|
| shadowColor | shadowColor | 阴影颜色 |
| shadowOffset | shadowOffset | 阴影偏移量 |
| shadowOpacity | shadowOpacity | 阴影透明度 |
| shadowRadius | shadowRadius | 阴影圆角 |

| timingFunction | 名称 | 动作 |
| :-- | :-- | :-- |
|| kCAMediaTimingFunctionLinear | 匀速 |
|| kCAMediaTimingFunctionEaseIn | 慢进 |
|| kCAMediaTimingFunctionEaseOut | 慢出 |
|| kCAMediaTimingFunctionEaseInEaseOut | 慢进慢出 |
|| kCAMediaTimingFunctionDefault | 慢进慢出 |

* <font color=#FF8C00>平移动画 transform.translation</font>

```
/*
* toValue: 从当前控件的(0,0)点开始移动到CGPointMake(0,100);
*/
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 100)];
    animation.duration = 3;
    animation.repeatCount =1;
    animation.autoreverses = NO;
    animation.removedOnCompletion = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view.layer addAnimation:animation forKey:@"translation"];
```

* <font color=#FF8C00>旋转动画 transform.rotation.z<font>

```
/*
* toValue: [NSNumber numberWithFloat:M_PI];
*/
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotation.toValue = [NSNumber numberWithFloat:4 * M_PI];
    rotation.duration = 2;
    rotation.repeatCount = HUGE_VALF;
    rotation.autoreverses = YES;
    rotation.removedOnCompletion = YES;
    rotation.fillMode = kCAFillModeForwards;
    [_imageView.layer addAnimation:rotation forKey:@"rotation"];
```

* <font color=#FF8C00>缩放动画 transform.scale</font>

```
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
//    scale.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2, 2, 2)];
    scale.toValue = [NSNumber numberWithFloat:0.5];
    scale.removedOnCompletion = YES;
    scale.duration = 2;
    scale.fillMode = kCAFillModeBackwards;
//    scale.beginTime = CACurrentMediaTime()+2;
    [_view_3.layer addAnimation:scale forKey:@"scaleAnimation"];
```

* <font color=#FF8C00>透明度动画 opacity</font>

```
    CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    opacity.fromValue = [NSNumber numberWithFloat:1.0f];
    opacity.toValue = [NSNumber numberWithFloat:0.3];
    opacity.removedOnCompletion = YES;
    opacity.duration = 3;
    opacity.fillMode = kCAFillModeForwards;
    [_view_4 .layer addAnimation:opacity forKey:@"optionAnimation"];
```

* <font color=#FF8C00>尺寸变化动画 bounds </font>

```
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 20)];
    animation.duration = 2;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    [_view_5.layer addAnimation:animation forKey:@"boundsAnimationr"];

```
```
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
    ani.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 50)];
    ani.removedOnCompletion = NO;
    ani.duration = 1.0f;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.View.layer addAnimation:ani forKey:@"SizeAni"];
```

* <font color=#FF8C00>位置变化动画 position</font>

```
    CABasicAnimation *position = [CABasicAnimation animationWithKeyPath:@"position"];
    position.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    position.toValue = [NSValue valueWithCGPoint:_view_1.center];
    position.removedOnCompletion = YES;
    position.duration = 1;
    position.fillMode = kCAFillModeBackwards;
    [_view_2.layer addAnimation:position forKey:@"positionAnimation"];
```

* <font color=#FF8C00>背景色修改动画 backgroundColor</font>

```
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    ani.toValue = (id)[UIColor greenColor].CGColor;
    ani.removedOnCompletion = NO;
    ani.duration = 3.0f;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.view.layer addAnimation:ani forKey:@"BackgroundColorAni"];
```

* <font color=#FF8C00>修改圆角动画 </font>

```
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    ani.toValue = [NSNumber numberWithFloat:30];
    ani.removedOnCompletion = NO;
    ani.duration = 1.0f;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.view.layer addAnimation:ani forKey:@"CornerRadiusAni"];
```

* <font color=#FF8C00>修改内容动画 contents</font>

```
/*
* 可以通过设置contents属性给UIView设置背景图片,注意必须是CGImage才能显示，我们可以在UIImage对象后面加上.CGImage直接转换，转换之后还需要在前面加上(id)进行强转
*/
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"contents"];
    ani.toValue = (id)[UIImage imageNamed:@"serviceActivity.png"].CGImage;
    ani.removedOnCompletion = NO;
    ani.duration = 1.0f;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.view.imageView.layer addAnimation:ani forKey:@"ContentsAni"];
```

* <font color=#FF8C00>组动画 CAAnimationGroup</font>

```
CABasicAnimation *animation_1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation_1.toValue = [NSNumber numberWithFloat:4*M_PI];
    CABasicAnimation *animation_2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation_2.toValue = [NSNumber numberWithFloat:0.2];
    CABasicAnimation *animation_3 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation_3.toValue = [NSValue valueWithCGPoint:CGPointMake(1125, 1000)];
    CABasicAnimation *animation_4 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation_4.toValue = [NSNumber numberWithFloat:30.0];
    CABasicAnimation *animation_5 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation_5.toValue = [NSNumber numberWithFloat:0.5];
    CABasicAnimation *animation_6 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation_6.toValue = [NSValue valueWithCGPoint:CGPointMake(50.0, 100.0)];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = [NSArray arrayWithObjects:animation_1,animation_2,animation_3,animation_4,animation_5,animation_6, nil];
    animationGroup.duration = 5;
    [_view_9.layer addAnimation:animationGroup forKey:@"animationGroup"];
```

> <font color=#006400>tips:</font>
> 
> 
<font color=#006400>1.如果动画不放在按钮事件中，直接放到viewDidLoad里，程序首先执行这个controller，这时动画是不会显示的,出现这个问题是因为开机时候系统有个动画，系统动画和这个动画重复了</font>
>
<font color=#006400>2.要想fillMode有效，最好设置removedOnCompletion = NO</font>
>
<font color=#006400>3.保持动画最后的状态不变需同时设置fillMode=kCAFillModeForwards和removedOnCompletion = NO</font>
>
<font color=#006400>4.</font>


> ###CAKeyframeAnimation:关键帧动画
> >设置keypath起点/关键点/终点的值,每一帧对应的时间,动画延着设定的点进行移动.

* <font color=#FF8C00>@param:[values]关键帧数组对象,动画会在对应的时间内一次执行每一帧动画</font>
* <font color=#FF8C00>@param:[path]动画路径对象,可以指定一个路径,在执行动画是延着路径移动</font>
* <font color=#FF8C00>@param:[keyTimes]设置关键帧对应的时间点,范围(0-1),如果没有设置此属性,则每一帧的动画时间平分</font>
* <font color=#FF8C00></font>

> position动画

```
CAkeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:"position"];
keyAnimation.duration = 4;
keyAnimation.fillMode = kCAFillModeBackwards;
keyAnimation.removedOnCompletion = NO;
keyAnimation.repeatCount = 1;
keyAnimation.autoreverses = NO;
keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
CGPoint myPoint = _animationView.center;
NSValue *value_0 = [NSValue valueWithCGPoint:myPoint];
NSValue *value_1 = [NSValue valueWithCGPoint:CGPointMake(myPoint.x+100, myPoint.y)];
NSValue *value_2 = [NSValue valueWithCGPoint:CGPointMake(myPoint.x+100, myPoint.y+100)];
NSValue *value_3 = [NSValue valueWithCGPoint:CGPointMake(myPoint.x, myPoint.y+100)];
NSValue *value_4 = [NSValue valueWithCGPoint:CGPointMake(myPoint.x, myPoint.y)];
keyAnimation.values = [NSArray arrayWithObjects:value_0,value_1,value_2,value_3,value_4, nil];
NSNumber *number_0 = [NSNumber numberWithFloat:0.0];
NSNumber *number_1 = [NSNumber numberWithFloat:0.1];
NSNumber *number_2 = [NSNumber numberWithFloat:0.2];
NSNumber *number_3 = [NSNumber numberWithFloat:0.8];
NSNumber *number_4 = [NSNumber numberWithFloat:1.0];
keyAnimation.keyTimes = [NSArray arrayWithObjects:number_0,number_1,number_2,number_3,number_4, nil];
[_animationView.layer addAnimation:keyAnimation forKey:@"positionAni"];
```

> cornerRadius动画

```
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"cornerRadius"];
    keyAnimation.duration =4;
    keyAnimation.repeatCount = 2;
    keyAnimation.autoreverses = NO;
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    NSNumber *number_0 = [NSNumber numberWithFloat:0];
    NSNumber *number_1 = [NSNumber numberWithFloat:50];
    NSNumber *number_2 = [NSNumber numberWithBool:20];
    NSNumber *number_3 = [NSNumber numberWithFloat:50];
    NSNumber *number_4 = [NSNumber numberWithFloat:0];
    keyAnimation.values = @[number_0,number_1,number_2,number_3,number_4];
    [_animationView.layer addAnimation:keyAnimation forKey:@"radiusAnimation"];
```

> path

```
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    // 创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat x = _animationView.frame.origin.x;
    CGFloat y = _animationView.frame.origin.y;
    // 路径范围
    CGPathAddEllipseInRect(path, NULL, CGRectMake(x-100, y, 200, 200));
    keyAnimation.path = path;
    // 释放路径(带Create的函数创建的对象都需要手动释放,否则会内存泄露)
    CFRelease(path);
    keyAnimation.duration = 10;
    [_animationView.layer addAnimation:keyAnimation forKey:@"pathAnimation"];
```

### CATransition
---
>转场动画

| type | example | 动作 |
|:-- |:-- |:-- |
| <font color=#FF8C00>公用API</font>  |
|  | kCATransitionMoveIn | 覆盖 |
|  | kCATransitionMoveIn | 覆盖 |
|  | kCATransitionPush | 推出 |
|  | kCATransitionReveal | 揭开 |
| <font color=#FF8C00>私有API</font> | |
|  | @"cube" | 翻转 |
|  | @"suckEffect" | 移动到左上角消失 |
|  | @"oglFlip" | 绕中心点翻转 |
|  | @"rippleEffect" | 文本抖动 |
|  | @"p7ageCurl" | 渐变 |
|  | @"pageUnCurl" | 翻书 |
|  | @"cameraIrisHollowClose" | 镜头打开 |
|  | @"cameraIrisHollowOpen" | 镜头关闭 |


| subtype | example | 动作 |
|:-- |:--|:--|
|  | kCATransitionFromLeft |  |
|  | kCATransitionFromRight |  |
|  | kCATransitionFromTop |  |
|  | kCATransitionFromBottom |  |

```
/*
 * @param:type  动画效果
 * @parma:subtype  动画展现方式
*/
- (void)addTransitionWithType:(NSString *)type subType:(NSString *)subType{
    CATransition *animation = [CATransition animation];
    animation.type = type;
    animation.subtype = subType;
    animation.duration = 3.0f;
    _view_2.hidden = YES;
    [_view_2.layer addAnimation:animation forKey:@"animation"];
}

//调用
[self addTransitionWithType:kCATransitionPush subType:kCATransitionFromTop];
[self addTransitionWithType:@"rippleEffect" subType:kCATransitionFromBottom];
```

> tip:调用私有API会影响上架


#### UIImage gif动画图片
---
> ##### gif动画图片

```
    /*
     * [UIImage animationImageNamed:@"" duration:1]
     */
    self.gifImageView = [[UIImageView alloc]init];
    [self.view addSubview:_gifImageView];
    __weak typeof(self)weakSelf = self;
    [_gifImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(100);
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    self.gifImageView.image = [UIImage animatedImageNamed:@"ani_" duration:0.4];
    
    // 设置五秒后停止动画
   // [self performSelector:@selector(stopImageAnimation) withObject:nil afterDelay:5];
    
    - (void)stopImageAnimation{
    _gifImageView.image = [UIImage imageNamed:@"ani_0"];
}
```

```
    /*
     * [UIImage animtaionWithImages:imageArr duration:1];
     */
    self.rabbitImageView = [[UIImageView alloc]init];
    [self.view addSubview:_rabbitImageView];
    [_rabbitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakSelf.gifImageView);
        make.centerY.mas_equalTo(weakSelf.gifImageView);
        make.left.mas_equalTo(weakSelf.gifImageView.mas_right).offset(10);
    }];
    UIImage *image = [UIImage animatedImageNamed:@"rabbit_" duration:1];
    NSArray *imageArr = [NSArray arrayWithArray:image.images];
//    NSArray *imageArr = [NSArray arrayWithObjects:[UIImage imageNamed:@"rabbit_"],
//                                                  [UIImage imageNamed:@"rabbit_1"],
//                                                  [UIImage imageNamed:@"rabbit_2"],nil];
    _rabbitImageView.animationImages = imageArr;
    _rabbitImageView.animationDuration = 2;
    _rabbitImageView.animationRepeatCount = 0;
    [_rabbitImageView startAnimating];
    
    // 设置五秒后停止动画
//    [self performSelector:@selector(stopRabbitAnimation) withObject:nil afterDelay:5];

- (void)stopRabbitAnimation{
    [_rabbitImageView stopAnimating];
}
```

>  <font color=red>tips:</font>
> > * 图片名称对应:初始化名称self.gifImageView.image = [UIImage animatedImageNamed:@"ani_" duration:0.4]后系统会自动添加相同的图片(0~1024)
> > * 动画关闭后需要重新将imageview赋值
> > * 可以通过[UIImage animationImageNamed:@"" duration:1]的images属性获取图片数组,不用单独添加,
> > * 重复次数animationRepeatCount=0时无限重复


### Tabbar添加点击和切换动画
---

> <font color=cplor>点击动画</font>

 * 在Appdelegate中添加tabbar代理<UITabBarControllerDelegate>
 
 ```
 self.tabBarController.delegate = self
 ```
 
 * 在代理方法中添加动画

 ```
 - (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    // 获取当前页面tabbar的index,添加点击动画
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    [self animationWithIndex:index];
    
    // 点击的tabbar button不是当前页面的button运行点击动画
//    if (self.selectIndex!=index) {
//        [self animationWithIndex:index];
//    }
}
 ```
 
 * 动画方法

 ```
 - (void)animationWithIndex:(NSInteger )index{
    NSMutableArray *itemArr = [NSMutableArray array];
    for (UIView *itemView in self.tabBarController.tabBar.subviews) {
        if ([itemView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [itemArr addObject:itemView];
        }
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.5;
    animation.repeatCount = 1;
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1)];
    [[itemArr[index] layer]addAnimation:animation forKey:nil];
    
    // 存储当前tabbar的index
//    self.selectIndex = index;
}
 ```
 
 
 > <font color=red>切换动画</font>
 
  * 在ViewController的viewWillDisappear中添加动画
  * 动画时间不能太长,不然会覆盖掉系统跳转动画

  ```
  - (void)viewWillDisappear:(BOOL)animated{
    	CATransition *animation = [CATransition animation];
    	animation.type = kCATransitionFade;
    	animation.duration = 0.25;
    	[self.tabBarController.view.layer addAnimation:animation forKey:@"animation"];
}
  ```


###UIView动画
---
##### <font color=red>一:类方法动画</font>
* <font color=orange>开始动画: </font>

```
/*
 * 参数一: 动画标识
 * 参数二: 附加参数,在设置代理的情况下,将此参数发送到setAnimationWillStartSelector和setAnimationDidStopSelector方法,通常情况设置为nil
*/
[UIView beginAnimations:(nullable NSString *) context:(nullable void *)];
```


* <font color=orange>参数设置: </font>

```
   //动画持续时间
    [UIView setAnimationDuration:(NSTimeInterval)];
```

```
    //动画的代理对象
    [UIView setAnimationDelegate:(nullable id)];
```

```
    //设置动画将开始时代理对象执行的SEL
    [UIView setAnimationWillStartSelector:(nullable SEL)];
```

```
    //设置动画结束时代理对象执行的SEL
    [UIView setAnimationDidStopSelector:(nullable SEL)];
```

```
    //设置动画延迟执行的时间
    [UIView setAnimationDelay:(NSTimeInterval)];
```

```
    //设置动画的重复次数
    [UIView setAnimationRepeatCount:(float)];
```

```
/*
 * 设置动画的曲线
 * UIViewAnimationCurve的枚举值如下：
    UIViewAnimationCurveEaseInOut,         // 慢进慢出（默认值）
    UIViewAnimationCurveEaseIn,            // 慢进
    UIViewAnimationCurveEaseOut,           // 慢出
    UIViewAnimationCurveLinear             // 匀速
 */
    [UIView setAnimationCurve:(UIViewAnimationCurve)];

```

```
   /*
    * 设置是否从当前状态开始播放动画
    * 假设上一个动画正在播放，且尚未播放完毕，我们将要进行一个新的动画：
    * 当为YES时：动画将从上一个动画所在的状态开始播放
    * 当为NO时：动画将从上一个动画所指定的最终状态开始播放（此时上一个动画马上结束）
    */
    [UIView setAnimationBeginsFromCurrentState:YES];

```

```
    //设置动画是否继续执行相反的动画
    [UIView setAnimationRepeatAutoreverses:(BOOL)];
```

```
    //是否禁用动画效果（对象属性依然会被改变，只是没有动画效果）
    [UIView setAnimationsEnabled:(BOOL)];
```

```
/* 设置视图的过渡效果
 *  第一个参数：UIViewAnimationTransition的枚举值如下
     UIViewAnimationTransitionNone,              //不使用动画
     UIViewAnimationTransitionFlipFromLeft,      //从左向右旋转翻页
     UIViewAnimationTransitionFlipFromRight,     //从右向左旋转翻页
     UIViewAnimationTransitionCurlUp,            //从下往上卷曲翻页
     UIViewAnimationTransitionCurlDown,          //从上往下卷曲翻页
  *第二个参数：需要过渡效果的View
  *第三个参数：是否使用视图缓存，YES：视图在开始和结束时渲染一次；NO：视图在每一帧都渲染
 */
    [UIView setAnimationTransition:(UIViewAnimationTransition) forView:(nonnull UIView *) cache:(BOOL)];

```


* <font color=orange>结束动画: </font>

```
[UIView commitAnimation];
```

* <font color=orange>ExampleCode: </font>
* 可以设置的动画属性:
* 大&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小: frame
* 拉&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;伸: bounds
* 中&nbsp;&nbsp;心&nbsp;&nbsp;点: center
* 旋&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;转: transform
* 透&nbsp;&nbsp;明&nbsp;&nbsp;度: alpha
* 背&nbsp;&nbsp;景&nbsp;&nbsp;色: backgroundColor
* 拉伸内容: contentStretch

```
/*
 * 修改view_2的frame
 */
    [UIView beginAnimations:@"frameAnimation" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationRepeatCount:1.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    _view_2.frame = _view_1.frame;
    [UIView commitAnimations];
```

```
/*
 * 转场动画
 */
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:view cache:YES];
    [UIView commitAnimations];
```



###UIView动画
---

#####<font color=red>二:View类方法block动画</font>

* <font color= orange>参数:时间和动画,无结束回调事件</font>
 * @param_1:duration--动画时间
 * @param_2:animationBlock--执行动画

```
    [UIView animateWithDuration:2 animation:^{
        view_1.center = view_2.center;
    }];
```


* <font color= orange>参数:时间和动画,有结束回调事件</font>
 * @param_1: duration--动画时间
 * @param_2: animations--执行动画内容
 * @param_3: completion--动画结束回调

```
    [UIView animateWithDuration:2 animations:^{
        view_1.layer.cornerRadius = 50;
    } completion:^(BOOL finished){
        NSLog(@"end of the animation");
    }];
```


* <font color= orange>参数:时间/延时时间/过渡效果,有结束回调事件</font>
 * @param_1:duration--动画持续时间
 * @param_2:delay--动画延时执行时间
 * @param_3:options--动画过渡效果
 * @param_4:animations--执行动画
 * @param_5:completion--动画结束回调

```
    [UIView animateWithDuration:2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view_1.layer.cornerRadius = 5;
        view_2.frame = view_1.frame;
    } completion:^(BOOL finished){
        NSLog(@"end of the animation");
    }];
```

* <font color= orange>Spring动画参数:动画时间,延时时间/震动效果/初始速度/过渡效果,有结束回调事件</font>
 * @param_1:duration--动画持续时间
 * @param_2:delay--动画延时时间
 * @param_3:usingSpringWithDamping--震动效果,范围0~1,数值越小震动效果越明显
 * @param_4:initialSpringVelocity--初始速度,数值越大速度越快
 * @param_5:options--动画过渡效果
 * @param_6:animations--实现动画
 * @param_7completion--动画结束回调

```
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view_2.frame = view_1.frame;
    } completion:^(BOOL finished){
    NSLog(@"end of the animation");
    }];
```

* <font color= orange>keyframes动画参数:动画时间/延时时间/过渡效果,需要在动画回调内添加关键帧,有结束回调事件</font>
 * @param_1:duration--动画持续时间
 * @param_2:delay--动画延时开始时间
 * @param_3:options--动画过渡效果
 * @param_4:animations--动画过程
 * @param_4\_1:startTime--动画开始时间
 * @param_4\_2:relativeDuration--动画持续时间
 * @param_4\_3:animations:--当前关键帧动画过程
 * @param_5:completion--动画结束回调

```
    [UIView animateKeyframesWithDuration:8.0f delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        [UIView addKeyframeWithRelativeStartTime:.0f relativeDuration:1.0/4 animations:^{
                  view_1.backgroundColor = COLOR_RANDOM;
                }];
                [UIView addKeyframeWithRelativeStartTime:1.0/4 relativeDuration:1.0/4 animations:^{
                    view_2.frame = CGRectMake(50, view_1.frame.origin.y-10-view_1.frame.size.height*0.7, 100, 100);
                view_2.layer.cornerRadius = 50;
             }];
             [UIView addKeyframeWithRelativeStartTime:1.0/4 relativeDuration:1.0/4 animations:^{
                view_1.backgroundColor = COLOR_RANDOM;
                    view_2.center = view_1.center;
             }];
                [UIView addKeyframeWithRelativeStartTime:1.0/4 relativeDuration:1.0/4 animations:^{
                    view_1.backgroundColor = COLOR_RANDOM;
                 view_2.frame = CGRectMake(50, view_1.frame.origin.y-10-view_1.frame.size.height*0.7, view_1.frame.size.width*0.7, view_1.frame.size.height*0.7);
                view_2.layer.cornerRadius = 5;
                  }];
    } completion:^(BOOL finished){
        NSLog(@"end of the animation");
    }];
```


* <font color= orange>transition动画参数:[单个视图转场:转场动画view,动画时间,有结束回调事件]/[两个视图转场:fromView/toView/动画时间,会将fromView从视图中删除,将toView添加到视图]</font>

 > 单个视图转场动画
  * @param_1:view--需要动画的view
  * @param_2:duration--动画时间
  * @param_3:options--动画过渡效果
  * @param_4:animations--动画过程
  * @param_5:completion--动画结束回调

 ```
    [UIView  transitionWithView:view_1 duration options:UIViewAnimationOptionTransitionFilpFromBotton animations:^{
        label_3.text = @"label_3";
    } completion:^(BOOL finished){
        NSLolg(@"end of the animation");
    }];
 ```

   > 两个视图转场动画
   
    * @param_1:fromView--转场动画view
    * @param_2:toView--转场后显示的view
    * @param_3:duration--动画持续时间
    * @param_4:options--动画效果
    * @param_5:complet--动画结束后回调
    * tip:此动画会将fromView从父视图删除,然后将toView添加到父视图
    
    ```
        UIView *view_4 = [[UIView alloc]initWithFrame:view_3.frame];
        [self.view addSubView:view_4];
        view_4.backgroundColor = COLOR_RANDOM;
        [UIView transitionFromView:view_3 toView view_4 duration:2 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished){
            NSLog(@"end of the animation");
        }];
    ```
    
* <font color=#006400> UIViewAnimationOptions类型,可组合使用</font>

 | 类型 | 效果 |
|:--|:--|
| <font color=#1E90FF>UIViewAnimationOptionLayoutSubviews</font> | 进行动画时布局子控件 |
| <font color=#1E90FF>UIViewAnimationOptionAllowUserInteraction</font> | 进行动画时允许用户交互 |
| <font color=#1E90FF>UIViewAnimationBeginFromCurrentState</font> | 从当前状态开始动画  |
| <font color=#1E90FF> UIViewAnimationOptionRepeat </font> | 无线重复执行动画  |
| <font color=#1E90FF> UIViewAnimationOptionAutoreverse </font> | 执行动画回路  |
| <font color=#1E90FF> UIViewAnimationOptionOverrideInheritedDuration </font> | 忽略嵌套动画执行的时间设置  |
| <font color=#1E90FF> UIViewAnimationOptionOverrideInheritedCurve </font> | 忽略嵌套动画的曲线设置  |
| <font color=#1E90FF> UIViewAnimationOptionAllowAnimatedContent </font> | 转场动画:进行动画时重绘视图  |
| <font color=#1E90FF> UIViewAnimationOptionShowHideTransitionViews </font> | 转场动画:添加和移除土城的动画效果  |
| <font color=#1E90FF> UIViewAnimationOptionOverrideInheritedOptions </font> | 不继承父动画设置 |
| <font color=#1E90FF> UIViewAnimationOptionCurveEaseInOut </font> |  时间曲线:慢进慢出 |
| <font color=#1E90FF> UIViewAnimationOptionCurveEaseIn </font> | 时间曲线:慢进  |
| <font color=#1E90FF> UIViewAnimationOptionCurveEaseOut </font> | 时间曲线:慢出  |
| <font color=#1E90FF> UIViewAnimationOptionCurveLinear </font> | 时间曲线:匀速  |
| <font color=#1E90FF> UIViewAnimationOptionTransitionNone </font> | 转场:不使用动画  |
| <font color=#1E90FF> UIViewAnimationOptionTransitionFlipFromLeft </font> | 转场:从左向右旋转翻页  |
| <font color=#1E90FF> UIViewAnimationOptionTransitionFlipFromRight </font> | 转场:从右向左旋转翻页  |
| <font color=#1E90FF> UIViewAnimationOptionTransitionCurlUp </font> | 转场:从下往上卷曲翻页  |
| <font color=#1E90FF> UIViewAnimationOptionTransitionCurlDown </font> | 转场:从上往下卷曲翻页 |
| <font color=#1E90FF> UIViewAnimationOptionTransitionCrossDissolve </font> | 转场:交叉消失和出现  |
| <font color=#1E90FF> UIViewAnimationOptionTransitionFlipFromTop </font> | 转场:从上向下旋转翻页  |
| <font color=#1E90FF> UIViewAnimationOptionTransitionFlipFromBottom </font> | 转场:从下向上旋转翻页  |

* <font color=#006400> UIViewKeyframeAnimationOptions类型,可组合使用</font>

 | 类型 | 效果 |
|:--|:--|
| <font color=#1E90FF> UIViewAnimationOptionLayoutSubviews </font> | 进行动画时布局子控件 |
| <font color=#1E90FF> UIViewAnimationOptionAllowUserInteraction </font> | 进行动画时允许用户交互 |
| <font color=#1E90FF> UIViewAnimationOptionBeginFromCurrentState </font> | 从当前状态开始执行动画 |
| <font color=#1E90FF> UIViewAnimationOptionRepeat </font> | 无限重复执行动画 |
| <font color=#1E90FF> UIViewAnimationOptionAutoreverse </font> | 执行动画回路 |
| <font color=#1E90FF> UIViewAnimationOptionOverrideInheritedDuration </font> | 忽略嵌套动画的执行时间设置 |
| <font color=#1E90FF> UIViewAnimationOptionOverrideInheritedOptions </font> | 不继承父动画设置 |
| <font color=#1E90FF> UIViewKeyframeAnimationOptionCalculationModeLinear </font> | 动画模式:连续执行 |
| <font color=#1E90FF> UIViewKeyframeAnimationOptionCalculationModeDiscrete </font> | 动画模式:离散运行 |
| <font color=#1E90FF> UIViewKeyframeAnimationOptionCalculationModePaced </font> | 动画模式:均匀执行 |
| <font color=#1E90FF> UIViewKeyframeAnimationOptionCalculationModeCubic </font> | 动画模式:平滑执行 |
| <font color=#1E90FF> UIViewKeyframeAnimationOptionCalculationModeCubicPaced </font> | 动画模式:平滑均匀执行 |






