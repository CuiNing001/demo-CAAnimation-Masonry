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
