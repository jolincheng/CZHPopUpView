//
//  ViewController.m
//  CZHPopUpView
//
//  Created by 程召华 on 2018/4/25.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import "ViewController.h"
#import "CZHPopUpView.h"
#import "CZHHeader.h"
@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

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


- (IBAction)rightTop:(UIButton *)sender {
    
    CGPoint point = CGPointMake(sender.czh_centerX, sender.czh_centerY + CZH_ScaleWidth(20));
    
    CZHPopUpView *view = [CZHPopUpView czh_popUpWithPoint:point arrowOffset:CZH_ScaleWidth(150) containerBackgroundColor:CZHColor(0xff0000) directionType:CZHPopUpViewDirectionTypeUp];
    
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



- (IBAction)up:(UIButton *)sender {
    CGPoint point = CGPointMake(sender.czh_centerX, sender.czh_centerY - CZH_ScaleWidth(20));
    
    CZHPopUpView *view = [CZHPopUpView czh_popUpWithPoint:point arrowOffset:CZH_ScaleWidth(150) containerBackgroundColor:CZHRGBColor(0xffff00, 0.5) directionType:CZHPopUpViewDirectionTypeDown];
    
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

- (IBAction)right:(UIButton *)sender {
    
    CGPoint point = CGPointMake(sender.czh_centerX + CZH_ScaleWidth(20), sender.czh_centerY);
    
    CZHPopUpView *view = [CZHPopUpView czh_popUpWithPoint:point arrowOffset:CZH_ScaleWidth(0) directionType:CZHPopUpViewDirectionTypeLeft];
    
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

- (IBAction)down:(UIButton *)sender {
    
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



- (IBAction)leftBottom:(UIButton *)sender {
    
    CGPoint point = CGPointMake(sender.czh_centerX, sender.czh_centerY - CZH_ScaleWidth(20));
    
    CZHPopUpView *view = [CZHPopUpView czh_popUpWithPoint:point arrowOffset:CZH_ScaleWidth(150) containerBackgroundColor:CZHRGBColor(0x00ff00, 0.5) directionType:CZHPopUpViewDirectionTypeDown];
    
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

- (IBAction)rightBotttom:(UIButton *)sender {
    
    CGPoint point = CGPointMake(sender.czh_centerX, sender.czh_centerY - CZH_ScaleWidth(20));
    
    CZHPopUpView *view = [CZHPopUpView czh_popUpWithPoint:point arrowOffset:CZH_ScaleWidth(0) containerBackgroundColor:CZHRGBColor(0x0000ff, 0.5) directionType:CZHPopUpViewDirectionTypeDown];
    
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
@end
