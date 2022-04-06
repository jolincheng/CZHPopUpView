# CZHPopUpView


ios弹窗视图,使用block处理点击事件

![QQ20180425-213551-HD---.gif](https://upload-images.jianshu.io/upload_images/6709174-68ddc264494fa008.gif?imageMogr2/auto-orient/strip)

很简单的弹窗视图控件，可以设置箭头方向在视图的上下左右，可以自定义视图背景颜色，判断视图超出屏幕自动改变位置


```
使用很简单，默认白色背景箭头在上面

- (IBAction)leftTop:(UIButton *)sender {
    
    CGPoint point = CGPointMake(sender.czh_centerX, sender.czh_centerY + CZH_ScaleWidth(20));
    
    CZHPopUpView *view = [CZHPopUpView czh_popUpWithPoint:point arrowOffset:CZH_ScaleWidth(150)];
    
    [view czh_addItemWithImageName:@"" title:@"点击左上" clickHandler:^(CZHPopUpItem *item) {
        NSLog(@"点击左上");
    }];
    
    [view czh_addItemWithImageName:@"person_data_add_black" title:@"拉黑" clickHandler:^(CZHPopUpItem *item) {
        NSLog(@"点击拉黑");
    }];
    
    
    [view czh_addItemWithImageName:@"person_data_report" title:@"投诉" clickHandler:^(CZHPopUpItem *item) {
        NSLog(@"点击投诉");
    }];
    
    [view czh_showView];
}

```

```
自定义颜色和箭头方向
- (IBAction)left:(UIButton *)sender {
    
    CGPoint point = CGPointMake(sender.czh_centerX - CZH_ScaleWidth(20), sender.czh_centerY);
    
    CZHPopUpView *view = [CZHPopUpView czh_popUpWithPoint:point arrowOffset:CZH_ScaleWidth(0) directionType:CZHPopUpViewDirectionTypeRight];
    
    [view czh_addItemWithImageName:@"" title:@"点击左上" clickHandler:^(CZHPopUpItem *item) {
        NSLog(@"点击左上");
    }];
    
    [view czh_addItemWithImageName:@"person_data_add_black" title:@"拉黑" clickHandler:^(CZHPopUpItem *item) {
        NSLog(@"点击拉黑");
    }];
    [view czh_addItemWithImageName:@"person_data_report" title:@"投诉" clickHandler:^(CZHPopUpItem *item) {
        NSLog(@"点击投诉");
    }];
    [view czh_addItemWithImageName:@"person_data_report" title:@"投诉" clickHandler:^(CZHPopUpItem *item) {
        NSLog(@"点击投诉");
    }];
    [view czh_addItemWithImageName:@"person_data_report" title:@"投诉" clickHandler:^(CZHPopUpItem *item) {
        NSLog(@"点击投诉");
    }];
    [view czh_addItemWithImageName:@"person_data_report" title:@"投诉" clickHandler:^(CZHPopUpItem *item) {
        NSLog(@"点击投诉");
    }];
    [view czh_addItemWithImageName:@"person_data_report" title:@"投诉" clickHandler:^(CZHPopUpItem *item) {
        NSLog(@"点击投诉");
    }];
    [view czh_showView];
}

```

[查看博客](https://blog.csdn.net/hurryupcheng)
[查看简书](https://www.jianshu.com/u/2add458bf239)

