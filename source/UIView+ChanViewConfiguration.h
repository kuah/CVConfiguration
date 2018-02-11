//
//  UIView+ChanViewConfiguration.h
//  CVSDemo
//
//  Created by 陈世翰 on 16/7/5.
//  Copyright © 2016年 chan. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark __________________button_Enum_____________________
typedef NS_ENUM(NSUInteger, ChanButtonEdgeInsetsStyle) {
    ChanButtonEdgeInsetsStyleTop, // image在上，label在下
    ChanButtonEdgeInsetsStyleLeft, // image在左，label在右
    ChanButtonEdgeInsetsStyleBottom, // image在下，label在上
    ChanButtonEdgeInsetsStyleRight // image在右，label在左
};
@class CVSUniversalModel;
#pragma mark __________________common_set_____________________
typedef  CVSUniversalModel* (^FontAuto) ();
typedef  CVSUniversalModel* (^FontMinimumScale) (CGFloat minimumScaleFactor);
#pragma mark __________________view_set_____________________
typedef  CVSUniversalModel* (^ViewCornerRadius) (CGFloat radius);
///the ratio must define between 0~1
typedef  CVSUniversalModel * (^ViewCornerRatioToWidth) (CGFloat ratio);
typedef  CVSUniversalModel * (^ViewCornerRatioToHeight) (CGFloat ratio);

typedef CVSUniversalModel * (^ViewBorder) (UIColor *borderColor,CGFloat borderWidth);
typedef CVSUniversalModel * (^ViewBorderColor) (UIColor *borderColor);
typedef CVSUniversalModel * (^ViewBorderWidth) (CGFloat borderWidth);
typedef CVSUniversalModel * (^ViewBackgroundColor) (UIColor *color);
#pragma mark __________________label_set____________________
typedef  CVSUniversalModel* (^LabelAlignment) (NSTextAlignment alignment);
typedef  CVSUniversalModel* (^LabelTextColor) (UIColor *textColor);
typedef  CVSUniversalModel* (^LabelNumOfLines) (NSInteger row);
typedef  CVSUniversalModel* (^LabelFont) (UIFont *font);
typedef  CVSUniversalModel* (^LabelFontSize) (CGFloat fontSize);


#pragma mark __________________button_set____________________
typedef  CVSUniversalModel* (^ButtonImage) (UIImage *image,UIControlState state);
typedef  CVSUniversalModel * (^ButtonTitle) (NSString *titleStr,UIControlState state);
typedef CVSUniversalModel * (^ButtonBackgroundImage) (UIImage *image,UIControlState state);
typedef CVSUniversalModel * (^ButtonTitleColor) (UIColor *color,UIControlState state);
typedef CVSUniversalModel * (^ButtonTitleFont) (UIFont *font);
typedef CVSUniversalModel * (^ButtonTitleFontSize) (CGFloat fontSize);

typedef CVSUniversalModel * (^ButtonTitleTextAlignment) (NSTextAlignment alignment);
typedef CVSUniversalModel * (^ButtonLayoutContent) (ChanButtonEdgeInsetsStyle style,CGFloat space);
typedef  CVSUniversalModel* (^ButtonResponse) (id target,SEL selector,UIControlEvents event);
typedef  CVSUniversalModel * (^ButtonResponseBlock)(NSInteger tag);
#pragma mark __________________searchbar_set____________________
typedef CVSUniversalModel * (^SearchBarPlaceholderColor) (UIColor *placeholderColor);
typedef CVSUniversalModel * (^SearchBarTextFieldBackgroundColor) (UIColor *backgroundColor);
typedef CVSUniversalModel * (^SearchBarTextColor) (UIColor *textColor);
typedef CVSUniversalModel * (^SearchBarTextFont) (UIFont *font);
typedef CVSUniversalModel * (^SearchBarTextFontSize) (CGFloat fontSize);
#pragma mark __________________tableView_set____________________
typedef CVSUniversalModel * (^TableViewDefaultSettings) ();
#pragma mark __________________textView_set____________________
typedef CVSUniversalModel * (^TextViewPlaceholder) (NSString *placeholder);
typedef CVSUniversalModel * (^TextViewPlaceholderColor) (UIColor *placeholderColor);


@interface CVSUniversalModel : NSObject
#pragma mark ________________Common______________________
/**
 *   字体大小自动调节(仅单行有效)  param : ()
 */
@property (nonatomic,copy,readonly)FontAuto fontAuto;
/**
 *   字体大小自动调节(仅单行有效) 设置最小字体比例  param : (CGFloat minimumScaleFactor)
 */
@property (nonatomic,copy,readonly)FontMinimumScale fontMinimumScale;

#pragma mark ________________UIView______________________
/**
 * 圆角  最好少用，影响内存  param : (CGFloat radius)
 */
@property (nonatomic,copy,readonly)ViewCornerRadius viewCornerRadius;
/**
 *  根据宽度比例 调节圆角 param : (CGFloat ratio)
 */
@property (nonatomic,copy,readonly)ViewCornerRatioToWidth viewCornerRatioToWidth;
/**
 *  根据高度比例 调节圆角  param : (CGFloat ratio)
 */
@property (nonatomic,copy,readonly)ViewCornerRatioToHeight viewCornerRatioToHeight;
/**
 *  设置边界宽度，颜色 param : (UIColor *borderColor,CGFloat borderWidth)
 */
@property (nonatomic,copy,readonly)ViewBorder viewBorder;
/**
 *  设置边界宽度，颜色 param : (UIColor *borderColor,CGFloat borderWidth)
 */
@property (nonatomic,copy,readonly)ViewBorderColor viewBorderColor;
/**
 *  设置边界宽度，颜色 param : (UIColor *borderColor,CGFloat borderWidth)
 */
@property (nonatomic,copy,readonly)ViewBorderWidth viewBorderWidth;

/**
 *  设置背景颜色 param : (UIColor *backgroundColor)
 */
@property (nonatomic,copy,readonly)ViewBackgroundColor viewBackGroundColor;


#pragma mark ________________UILabel______________________
/**
 *   字体排列  param : (NSTextAlignment alignment)
 */
@property (nonatomic,copy,readonly)LabelAlignment labelAlignment;
/**
 *   字体颜色  param : (UIColor *textColor)
 */
@property (nonatomic,copy,readonly)LabelTextColor labelTextColor;
/**
 *   字体行数 为0没限制  param : (NSInteger row)
 */
@property (nonatomic,copy,readonly)LabelNumOfLines labelNumOfLines;
/**
 *   字体  param : (UIFont *font)
 */
@property (nonatomic,copy,readonly)LabelFont labelFont;
/**
 *   字体大小  param : (CGFloat fontSize)
 */
@property (nonatomic,copy,readonly)LabelFontSize labelFontSize;


#pragma mark ________________UIButton______________________
/**
 *   按钮图 param : (UIImage *image,UIControlState state)
 */
@property (nonatomic,copy,readonly)ButtonImage buttonImage;
/**
 *   标题  param : (NSString *titleStr,UIControlState state)
 */
@property (nonatomic,copy,readonly)ButtonTitle buttonTitle;
/**
 *   背景图  param : (UIImage *image,UIControlState state)
 */
@property (nonatomic,copy,readonly)ButtonBackgroundImage buttonBackgroundImage;
/**
 *   标题颜色  param : (UIColor *color,UIControlState state)
 */
@property (nonatomic,copy,readonly)ButtonTitleColor buttonTitleColor;
/**
 *   标题字体大小 param : (UIFont *font)
 */
@property (nonatomic,copy,readonly)ButtonTitleFont buttonTitleFont;
/**
 *   标题字体大小 param : (CGFloat fontSize)
 */
@property (nonatomic,copy,readonly)ButtonTitleFontSize buttonTitleFontSize;

/**
 *   标题排列样式 param : (NSTextAlignment alignment)
 */
@property (nonatomic,copy,readonly)ButtonTitleTextAlignment buttonTitleTextAlignment;
/**
 *   自动调节图片和标题  param : (ChanButtonEdgeInsetsStyle style,CGFloat space)
 */
@property (nonatomic,copy,readonly)ButtonLayoutContent buttonLayoutContent;
/**
 *   设置点击事件 parm:(id target,SEL selector,UIControlEvents event)
 */
@property (nonatomic,copy,readonly)ButtonResponse buttonResponse;

#pragma mark ________________UISearchBar______________________
/**
 *   设置placeholder颜色 parm:(UIColor *placeholderColor)
 */
@property (nonatomic,copy,readonly)SearchBarPlaceholderColor searchBarPlaceholderColor;
/**
 *   设置text颜色 parm:(UIColor *textColor)
 */
@property (nonatomic,copy,readonly)SearchBarTextColor searchBarTextColor;
/**
 *   设置field的背景颜色 parm:(UIColor *backgroundColor)
 */
@property (nonatomic,copy,readonly)SearchBarTextFieldBackgroundColor searchBarTextFieldBackgroundColor;
/**
 *   设置text字体,placeholder会跟着改变 parm:(UIFont *font)
 */
@property (nonatomic,copy,readonly)SearchBarTextFont searchBarTextFont;
/**
 *   使用系统默认字体设置text字体大小,placeholder会跟着改变 parm:(CGFloat fontSize)
 */
@property (nonatomic,copy,readonly)SearchBarTextFontSize searchBarTextFontSize;


#pragma mark ________________UITableView______________________
/**
 *   对tableView做一些默认的操作，比如去掉footer，默认的分割线等 会调用-(void)setUpDefaultSettings方法
 */
@property (nonatomic,copy,readonly)TableViewDefaultSettings tableViewDefaultSettings;

#pragma mark ________________TextView______________________
/**
 *   设置textView的Placeholder
 */
@property (nonatomic,strong)TextViewPlaceholder textViewPlaceholder;
/**
 *   设置textView的Placeholder
 */
@property (nonatomic,strong)TextViewPlaceholderColor textViewPlaceholderColor;


#pragma mark ________________setting_View_Target______________________
/**
 *  绑定的view
 */
@property (nonatomic,weak)UIView *settingView;

/**
 *   语法糖
 */
@property (nonatomic,weak,readonly)id org;

@end
@interface UIView (ChanViewConfiguration)
/*
 *  批量添加子控件
 *
 *  @param subviews   子控件
 */
- (void)cvc_addSubviews:(NSArray *)subviews;
-(CVSUniversalModel *)cvc;
@end

typedef void (^ChanViewConfiguration_ButtonActionBlock)(NSInteger tag);
@interface UIButton (ChanViewConfiguration)
/**
 * @brief 按钮内容自动排列
 * @param style 看上面的enum枚举
 * @param space 文字跟图片的间距

 */
-(void)layoutButtonWithEdgeInsetsStyle:(ChanButtonEdgeInsetsStyle)style
                       imageTitleSpace:(CGFloat)space;
-(void)cvc_actionHandler:(ChanViewConfiguration_ButtonActionBlock)touchHandler;

@end

@interface UITableView (ChanViewConfiguration)
/**
 *  @brief 根据一组nibNames来注册cell
 *  @param array 装载nibNames的数组
 */
-(void)cvc_tableViewRegisterCellWithNibNames:(NSArray *)array;
/**
 *  @brief 根据一组classNames来注册cell
 *  @param array 装载classNames的数组
 */
-(void)cvc_tableViewRegisterCellWithClassNames:(NSArray *)array;
/**
 *  @brief 根据一组nibNames来注册HeaderFooterView
 *  @param array 装载nibNames的数组
 */
-(void)cvc_tableViewRegisterHeaderFooterViewWithNibNames:(NSArray *)array;
/**
 *  @brief 根据一组classNames来注册HeaderFooterView
 *  @param array 装载classNames的数组
 */
-(void)cvc_tableViewRegisterHeaderFooterViewWithClassNames:(NSArray *)array;
/**
 *  @brief 对tableView做一些默认的操作，比如去掉footer，默认的分割线等
 */
-(void)setUpDefaultSettings;

@end

///根据retina 一个点的单位
#define CVC_ONE_PIX_HEIGHT [UIScreen cvc_isRetina]?0.5:1.0
@interface UIScreen (ChanViewConfiguration)
/**
 *  @brief 判断是不是retina屏幕
 *  Check if the current device has a Retina display
 *  @return Returns YES if it has a Retina display, NO if not
 */
+ (BOOL)cvc_isRetina;

@end
