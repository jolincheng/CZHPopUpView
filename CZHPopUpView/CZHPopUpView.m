//
//  CZHPopUpView.m
//  SexChat
//
//  Created by 程召华 on 2018/4/18.
//  Copyright © 2018年 程召华. All rights reserved.
//
#define MARGIN_WIDTH       CZH_ScaleWidth(10)
#define ARROW_HEIGHT       CZH_ScaleWidth(10)
#define ARROW_HALF_WIDTH   sqrt(pow(ARROW_HEIGHT, 2)/3)
#define CONTAINER_WIDTH    CZH_ScaleWidth(123)
#define BUTTON_WIDTH       CZH_ScaleWidth(50)

#import "CZHPopUpView.h"
#import "CZHHeader.h"


@interface CZHPopUpButton : UIButton
///
@property (nonatomic, weak) UIImageView *buttonImageView;
///
@property (nonatomic, weak) UILabel *buttonLabel;
///
@property (nonatomic, copy) NSString *imageName;
///
@property (nonatomic, copy) NSString *title;
///
@property (nonatomic, copy) void (^buttonHandler)(CZHPopUpButton *button);

+ (instancetype)czh_setButtonWithImageName:(NSString *)imageName title:(NSString *)title buttonHandler:(void (^)(CZHPopUpButton *button))buttonHandler;


@end



@implementation CZHPopUpButton

+ (instancetype)czh_setButtonWithImageName:(NSString *)imageName title:(NSString *)title buttonHandler:(void (^)(CZHPopUpButton *))buttonHandler {
    
    CZHPopUpButton *button = [[CZHPopUpButton alloc] initWithImageName:imageName title:title buttonHandler:buttonHandler];

    return button;
}

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title buttonHandler:(void (^)(CZHPopUpButton *))buttonHandler {
    
    if (self = [super init]) {
        
        self.imageName = imageName;
        self.title = title;
        self.buttonHandler = buttonHandler;
        
        if (imageName.length > 0) {
            UIImageView *buttonImageView = [[UIImageView alloc] init];
            buttonImageView.image = [UIImage imageNamed:imageName];
            buttonImageView.contentMode = UIViewContentModeCenter;
//            buttonImageView.backgroundColor = CZHColor(0x00ff00);
            [self addSubview:buttonImageView];
            self.buttonImageView = buttonImageView;
        }
        

        UILabel *buttonLabel = [[UILabel alloc] init];
        buttonLabel.textColor = CZHColor(0x323232);
        buttonLabel.font = CZHGlobelNormalFont(15);
        buttonLabel.text = self.title;
//        buttonLabel.backgroundColor = CZHColor(0xff0000);
        [self addSubview:buttonLabel];
        self.buttonLabel = buttonLabel;
        
        [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)buttonClick {
    
    if (self.buttonHandler) {
        self.buttonHandler(self);
    }
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    CGFloat max = 0;
    
    self.buttonLabel.textAlignment = NSTextAlignmentCenter;
    
    if (self.imageName.length) {
        
        CGFloat buttonImageViewX = CZH_ScaleWidth(16);
        CGFloat buttonImageViewY = 0;
        CGFloat buttonImageViewW = CZH_ScaleWidth(16);
        CGFloat buttonImageViewH = self.czh_height;
        self.buttonImageView.frame = CGRectMake(buttonImageViewX, buttonImageViewY, buttonImageViewW, buttonImageViewH);
        
        max = self.buttonImageView.czh_right + CZH_ScaleWidth(10);
        
        self.buttonLabel.textAlignment = NSTextAlignmentLeft;
    }
    
    CGFloat buttonLabelX = max;
    CGFloat buttonLabelY = 0;
    CGFloat buttonLabelW = self.czh_width - buttonLabelX;
    CGFloat buttonLabelH = self.czh_height;
    self.buttonLabel.frame = CGRectMake(buttonLabelX, buttonLabelY, buttonLabelW, buttonLabelH);
    
}

@end




@implementation CZHPopUpItem

+ (instancetype)czh_itemWithImageName:(NSString *)imageName title:(NSString *)title clickHandler:(void (^)(CZHPopUpItem *item))clickHandler {
    
    return [[CZHPopUpItem alloc] initWithImageName:imageName title:title clickHandler:clickHandler];
    
}

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title clickHandler:(void (^)(CZHPopUpItem *item))clickHandler {
    
    if (self = [super init]) {
        self.imageName = imageName;
        self.title = title;
        self.clickHandler = clickHandler;
    }
    return self;
}

@end


@interface CZHPopUpView ()
///
@property (nonatomic, assign) CGPoint point;
/** 箭头x偏移值 */
@property (nonatomic, assign) CGFloat arrowOffset;
/** 箭头朝向 */
@property (nonatomic, assign) CZHPopUpViewDirectionType directionType;
/** rgb的可变数组 */
@property (nonatomic, strong) NSMutableArray *rgbStrValueArr;
///
@property (nonatomic, strong) NSMutableArray *itemArrays;
///
@property (nonatomic, weak) UIView *containerView;
@end

@implementation CZHPopUpView

- (NSMutableArray *)itemArrays {
    if (!_itemArrays) {
        _itemArrays = [NSMutableArray array];
    }
    return _itemArrays;
}

-(NSMutableArray *)rgbStrValueArr{
    if (!_rgbStrValueArr) {
        _rgbStrValueArr = [NSMutableArray array];
    }
    return _rgbStrValueArr;
}

#pragma mark - UIColor转RGB
-(NSMutableArray *)rgbWithUIColor:(UIColor *)color{
    NSMutableArray *RGBStrValueArr = [[NSMutableArray alloc] init];
    //获得RGB值描述
    NSString *RGBValue = [NSString stringWithFormat:@"%@",color];
    //将RGB值描述分隔成字符串
    NSArray *RGBArr = [RGBValue componentsSeparatedByString:@" "];
    //获取红色值
    NSNumber *r = @([[RGBArr objectAtIndex:1] floatValue]);
    [RGBStrValueArr addObject:r];
    //获取绿色值
    NSNumber *g = @([[RGBArr objectAtIndex:2] floatValue]);
    [RGBStrValueArr addObject:g];
    //获取蓝色值
    NSNumber *b = @([[RGBArr objectAtIndex:3] floatValue]);
    [RGBStrValueArr addObject:b];
    //获取透明度
    NSNumber *a = @([[RGBArr objectAtIndex:4] floatValue]);
    [RGBStrValueArr addObject:a];
    //返回保存RGB值的数组
    return RGBStrValueArr;
}

+ (instancetype)czh_popUpWithPoint:(CGPoint)point arrowOffset:(CGFloat)arrowOffset {
    
    return [self czh_popUpWithPoint:point arrowOffset:arrowOffset containerBackgroundColor:CZHColor(0xffffff) directionType:CZHPopUpViewDirectionTypeUp];
    
}

+ (instancetype)czh_popUpWithPoint:(CGPoint)point arrowOffset:(CGFloat)arrowOffset directionType:(CZHPopUpViewDirectionType)directionType {
    return [self czh_popUpWithPoint:point arrowOffset:arrowOffset containerBackgroundColor:CZHColor(0xffffff) directionType:directionType];
}

+ (instancetype)czh_popUpWithPoint:(CGPoint)point arrowOffset:(CGFloat)arrowOffset containerBackgroundColor:(UIColor *)containerBackgroundColor directionType:(CZHPopUpViewDirectionType)directionType {
    
    CZHPopUpView *view = [[CZHPopUpView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) point:point arrowOffset:arrowOffset containerBackgroundColor:containerBackgroundColor directionType:directionType];
    
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame point:(CGPoint)point arrowOffset:(CGFloat)arrowOffset containerBackgroundColor:(UIColor *)containerBackgroundColor directionType:(CZHPopUpViewDirectionType)directionType {
    
    if (self = [super initWithFrame:frame]) {
        
        self.point = point;
        
        self.arrowOffset = arrowOffset;
        
        self.containerBackgroundColor = containerBackgroundColor;
        
        self.directionType = directionType;
        
        [self czh_setView];
        
    }
    return self;
}

- (void)czh_setView {
    
    UIView *containerView = [[UIView alloc] init];
    containerView.backgroundColor = self.containerBackgroundColor;
    containerView.layer.cornerRadius = CZH_ScaleWidth(5);
    containerView.layer.shadowColor = CZHRGBColor(0x4F4F4F, 0.5).CGColor;
    containerView.layer.shadowOffset = CGSizeMake(0, 0);
    containerView.layer.shadowOpacity = 1;
    containerView.clipsToBounds = NO;
    [self addSubview:containerView];
    self.containerView = containerView;

}


- (void)czh_showView {
    
    [self czh_caculateFrame];

    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.backgroundColor = [UIColor clearColor];
    self.containerView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        
//        self.backgroundColor = CZHRGBColor(0x000000, 0.3);
        self.containerView.alpha = 1;
        
    }];
    
}

- (void)czh_caculateFrame {
    
    CGFloat maxHeight = 0;
    CGFloat maxWidth = CONTAINER_WIDTH;
    CZHWeakSelf(self);
    
    NSInteger count = self.itemArrays.count;
    
    for (NSInteger i = 0; i < count ; i++) {
        
        CZHPopUpItem *item = self.itemArrays[i];
        
        CZHPopUpButton *button = [CZHPopUpButton czh_setButtonWithImageName:item.imageName title:item.title buttonHandler:^(CZHPopUpButton *button) {
            CZHStrongSelf(self);
            if (item.clickHandler) {
                item.clickHandler(item);
            }
            
            [self czh_hideView];
        }];
        
        CGFloat buttonX = 0;
        CGFloat buttonH = BUTTON_WIDTH;
        CGFloat buttonY = maxHeight;
        CGFloat buttonW = maxWidth;
        CGRect buttonF = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.frame = buttonF;
        [self.containerView addSubview:button];
        
        maxHeight += buttonH;
        
        if (i != count - 1) {
            
            CALayer *line = [CALayer layer];
            line.backgroundColor = CZHColor(0xdfdfdf).CGColor;
            [self.containerView.layer addSublayer:line];
            
            CGFloat lineY = button.czh_bottom;
            CGFloat lineW = CZH_ScaleWidth(85);
            CGFloat lineH = 0.5;
            CGFloat lineX = (maxWidth - lineW) * 0.5;
            CGRect lineF  = CGRectMake(lineX, lineY, lineW, lineH);
            
            line.frame = lineF;
            maxHeight += lineH;
        }
        
    }
    
    //重新计算偏移量
    if (self.directionType == CZHPopUpViewDirectionTypeUp || self.directionType == CZHPopUpViewDirectionTypeDown) {
        
        if (_arrowOffset > maxWidth - ARROW_HALF_WIDTH - MARGIN_WIDTH) {
            _arrowOffset = maxWidth - ARROW_HALF_WIDTH - MARGIN_WIDTH;
        } else if (_arrowOffset == 0) {
            _arrowOffset = MARGIN_WIDTH;
        }
        
    } else if (self.directionType == CZHPopUpViewDirectionTypeRight || self.directionType == CZHPopUpViewDirectionTypeLeft) {
        
        if (_arrowOffset > maxHeight - ARROW_HALF_WIDTH - MARGIN_WIDTH) {
            _arrowOffset = maxHeight - ARROW_HALF_WIDTH - MARGIN_WIDTH;
        } else if (_arrowOffset == 0) {
            _arrowOffset = MARGIN_WIDTH;
        }
        
    }

    CGFloat containerViewX = 0;
    CGFloat containerViewY = 0;
    CGFloat containerViewW = maxWidth;
    CGFloat containerViewH = maxHeight;
    
    
    
    if (self.directionType == CZHPopUpViewDirectionTypeUp || self.directionType == CZHPopUpViewDirectionTypeDown) {
        
        containerViewX = self.point.x - _arrowOffset;
        
        if (containerViewX + containerViewW > ScreenWidth) {//超出了屏幕宽度，重新计算
            containerViewX = ScreenWidth - containerViewW - MARGIN_WIDTH;
        } else if (containerViewX < 0) {
            containerViewX = MARGIN_WIDTH;
        }
    } else if (self.directionType == CZHPopUpViewDirectionTypeLeft || self.directionType == CZHPopUpViewDirectionTypeRight) {
        
        containerViewY = self.point.y - _arrowOffset;
        
        if (containerViewY + containerViewH > ScreenHeight) {//超出了屏幕宽度，重新计算
            containerViewY = ScreenHeight - containerViewH - MARGIN_WIDTH;
        } else if (containerViewY < 0) {
            containerViewY = MARGIN_WIDTH;
        }
    }
    
    if (self.directionType == CZHPopUpViewDirectionTypeUp) {
        
        containerViewY = self.point.y + ARROW_HEIGHT;
        
    } else if (self.directionType == CZHPopUpViewDirectionTypeDown) {
        
        containerViewY = self.point.y - ARROW_HEIGHT - containerViewH;
        
    } else if (self.directionType == CZHPopUpViewDirectionTypeLeft) {
        
        containerViewX = self.point.x + ARROW_HEIGHT;
        
    }  else if (self.directionType == CZHPopUpViewDirectionTypeRight) {
        
        containerViewX = self.point.x - ARROW_HEIGHT - maxWidth;
    }
    
    
    self.containerView.frame = CGRectMake(containerViewX, containerViewY, containerViewW, containerViewH);
    [self.containerView cornerAllCornersWithCornerRadius:CZH_ScaleWidth(5)];
    
}

- (void)czh_hideView {
    
    [UIView animateWithDuration:0.3 animations:^{
        
//        self.backgroundColor = [UIColor clearColor];
        self.containerView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self czh_hideView];
    
}


- (void)czh_addItemWithImageName:(NSString *)imageName title:(NSString *)title clickHandler:(void (^)(CZHPopUpItem *))clickHandler {
    
    CZHPopUpItem *item = [CZHPopUpItem czh_itemWithImageName:imageName title:title clickHandler:clickHandler];
    
    [self.itemArrays addObject:item];
    
}



- (void)setArrowOffset:(CGFloat)arrowOffset {
    _arrowOffset = arrowOffset;
    [self setNeedsDisplay];
}

#pragma mark - 三角形颜色
-(void)setContainerBackgroundColor:(UIColor *)containerBackgroundColor {
    
    _containerBackgroundColor = containerBackgroundColor;
    
    self.containerView.backgroundColor = containerBackgroundColor;
    
    self.rgbStrValueArr = [self rgbWithUIColor:containerBackgroundColor];
    
    [self setNeedsDisplay];

}


#pragma mark - 重写drawRect 绘制三角形
-(void)drawRect:(CGRect)rect{
    //An opaque type that represents a Quartz 2D drawing environment.
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    /*画三角形*/
    CGPoint sPoints[3];//坐标点
    sPoints[0] = CGPointMake(self.point.x , self.point.y);//坐标1

    sPoints[1] = CGPointMake(self.point.x - ARROW_HALF_WIDTH, self.point.y + ARROW_HEIGHT);//坐标2
    sPoints[2] = CGPointMake(self.point.x + ARROW_HALF_WIDTH, self.point.y + ARROW_HEIGHT);//坐标3
    if (self.directionType == CZHPopUpViewDirectionTypeUp) {
        
        sPoints[1] = CGPointMake(self.point.x - ARROW_HALF_WIDTH, self.point.y + ARROW_HEIGHT);//坐标2
        sPoints[2] = CGPointMake(self.point.x + ARROW_HALF_WIDTH, self.point.y + ARROW_HEIGHT);//坐标3
    } else if (self.directionType == CZHPopUpViewDirectionTypeDown) {
        
        sPoints[1] = CGPointMake(self.point.x - ARROW_HALF_WIDTH, self.point.y - ARROW_HEIGHT);//坐标2
        sPoints[2] = CGPointMake(self.point.x + ARROW_HALF_WIDTH, self.point.y - ARROW_HEIGHT);//坐标3
    } else if (self.directionType == CZHPopUpViewDirectionTypeRight) {
        
        sPoints[1] = CGPointMake(self.point.x - ARROW_HEIGHT, self.point.y - ARROW_HALF_WIDTH);//坐标2
        sPoints[2] = CGPointMake(self.point.x - ARROW_HEIGHT, self.point.y + ARROW_HALF_WIDTH);//坐标3
    }  else if (self.directionType == CZHPopUpViewDirectionTypeLeft) {
        
        sPoints[1] = CGPointMake(self.point.x + ARROW_HEIGHT, self.point.y - ARROW_HALF_WIDTH);//坐标2
        sPoints[2] = CGPointMake(self.point.x + ARROW_HEIGHT, self.point.y + ARROW_HALF_WIDTH);//坐标3
    }
    
    CGContextAddLines(context, sPoints, 3);//添加线
    //填充色
    CGFloat r = 1.0;
    CGFloat g = 1.0;
    CGFloat b = 1.0;
    CGFloat a = 1.0;
    
    if (self.rgbStrValueArr.count > 0) {
        
        r = [self.rgbStrValueArr[0] floatValue];
        g = [self.rgbStrValueArr[1] floatValue];
        b = [self.rgbStrValueArr[2] floatValue];
        a = [self.rgbStrValueArr[3] floatValue];
        
    }

    CGContextSetFillColorWithColor(context, self.containerBackgroundColor.CGColor);
    //画线笔颜色
    CGContextSetRGBStrokeColor(context, r, g, b, a);//画笔线的颜色
    CGContextClosePath(context);//封起来
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    //    CGAffineTransform transform = CGAffineTransformMakeRotation(180 * M_PI/180.0);
    //    [self setTransform:transform];
}


@end





