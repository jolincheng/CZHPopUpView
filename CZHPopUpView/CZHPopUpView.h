//
//  CZHPopUpView.h
//  SexChat
//
//  Created by 程召华 on 2018/4/18.
//  Copyright © 2018年 程召华. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CZHPopUpViewDirectionType) {
    ///三角形在上面
    CZHPopUpViewDirectionTypeUp,
    ///三角形在下面
    CZHPopUpViewDirectionTypeDown,
    ///三角形在右边
    CZHPopUpViewDirectionTypeRight,
    ///三角在左边
    CZHPopUpViewDirectionTypeLeft
};

@interface CZHPopUpItem : NSObject
///图片
@property (nonatomic, copy) NSString *imageName;
///标题
@property (nonatomic, copy) NSString *title;
///点击事件
@property (nonatomic, copy) void (^clickHandler)(CZHPopUpItem *item);

+ (instancetype)czh_itemWithImageName:(NSString *)imageName title:(NSString *)title clickHandler:(void (^)(CZHPopUpItem *item))clickHandler;

@end


@interface CZHPopUpView : UIView

/** 背景颜色 */
@property (nonatomic, strong) UIColor *containerBackgroundColor;

/**
 *  point :  三角弹出的点坐标
 *  arrowOffset ： view左边距离三角的距离
 *  directionType ：默认朝向箭头在上
 */
+ (instancetype)czh_popUpWithPoint:(CGPoint)point arrowOffset:(CGFloat)arrowOffset;

/**
 *  point :  三角弹出的点坐标
 *  arrowOffset ： view左边距离三角的距离
 *  directionType : 箭头方向
 */
+ (instancetype)czh_popUpWithPoint:(CGPoint)point arrowOffset:(CGFloat)arrowOffset directionType:(CZHPopUpViewDirectionType)directionType;

/**
 *  point :  三角弹出的点坐标
 *  arrowOffset ： view左边距离三角的距离
 *  backgroundColor ： 背景颜色， 默认白色
 *  directionType : 箭头方向
 */
+ (instancetype)czh_popUpWithPoint:(CGPoint)point arrowOffset:(CGFloat)arrowOffset containerBackgroundColor:(UIColor *)containerBackgroundColor directionType:(CZHPopUpViewDirectionType)directionType;


- (void)czh_addItemWithImageName:(NSString *)imageName title:(NSString *)title clickHandler:(void (^)(CZHPopUpItem *item))clickHandler;


- (void)czh_showView;
@end
