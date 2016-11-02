//
//  UIView+ChanViewConfiguration.m
//  CVSDemo
//
//  Created by 陈世翰 on 16/7/5.
//  Copyright © 2016年 chan. All rights reserved.
//

#import "UIView+ChanViewConfiguration.h"
#import <objc/runtime.h>
static const void *ChanViewConfiguration_ButtonBlockKey = &ChanViewConfiguration_ButtonBlockKey;
@implementation CVSUniversalModel

@synthesize viewBorder = _viewBorder;
@synthesize viewBorderColor = _viewBorderColor;
@synthesize viewBorderWidth = _viewBorderWidth;
@synthesize viewBackGroundColor = _viewBackGroundColor;
@synthesize viewCornerRadius = _viewCornerRadius;
@synthesize viewCornerRatioToWidth = _viewCornerRatioToWidth;
@synthesize viewCornerRatioToHeight = _viewCornerRatioToHeight;
@synthesize settingView = _settingView;
-(ViewCornerRatioToHeight)viewCornerRatioToHeight{
    __weak typeof(self) weakSelf = self;
    _viewCornerRatioToHeight = ^(CGFloat ratio){
        weakSelf.settingView.layer.cornerRadius = weakSelf.settingView.bounds.size.height*ratio;
        weakSelf.settingView.layer.masksToBounds = YES;
        return weakSelf;
    };
    return _viewCornerRatioToHeight;
}
-(ViewCornerRatioToWidth)viewCornerRatioToWidth{
    __weak typeof(self) weakSelf = self;
    _viewCornerRatioToWidth = ^(CGFloat ratio){
        weakSelf.settingView.layer.cornerRadius = weakSelf.settingView.bounds.size.width*ratio;
        weakSelf.settingView.layer.masksToBounds = YES;
        return weakSelf;
    };
    return _viewCornerRatioToWidth;
}
-(ViewCornerRadius)viewCornerRadius{
    __weak typeof(self) weakSelf = self;
    _viewCornerRadius = ^(CGFloat radius){
        weakSelf.settingView.layer.cornerRadius = radius;
        weakSelf.settingView.layer.masksToBounds = YES;
        return weakSelf;
    };
    return _viewCornerRadius;
}
-(ViewBackgroundColor)viewBackGroundColor{
    __weak typeof(self) weakSelf = self;
    _viewBackGroundColor = ^(UIColor *color){
        weakSelf.settingView.backgroundColor = color;
        return weakSelf;
    };
    return _viewBackGroundColor;
}
-(ViewBorder)viewBorder{
    __weak typeof(self) weakSelf = self;
    _viewBorder = ^(UIColor *borderColor,CGFloat borderWidth){
        weakSelf.settingView.layer.borderWidth = borderWidth;
        weakSelf.settingView.layer.borderColor = borderColor.CGColor;
        return weakSelf;
    };
    return _viewBorder;
}
-(ViewBorderColor)viewBorderColor{
    __weak typeof(self) weakSelf = self;
    _viewBorderColor = ^(UIColor *borderColor){
        weakSelf.settingView.layer.borderColor = borderColor.CGColor;
        return weakSelf;
    };
    return _viewBorderColor;
}
-(ViewBorderWidth)viewBorderWidth{
    __weak typeof(self) weakSelf = self;
    _viewBorderWidth = ^(CGFloat borderWidth){
        weakSelf.settingView.layer.borderWidth = borderWidth;
        return weakSelf;
    };
    return _viewBorderWidth;
}
#pragma mark ___________________UILabel________________________
@synthesize labelFont = _labelFont;
@synthesize labelAlignment = _labelAlignment;
@synthesize labelNumOfLines = _labelNumOfLines;
@synthesize labelFontSize = _labelFontSize;
@synthesize labelTextColor = _labelTextColor;

-(LabelTextColor)labelTextColor{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UILabel class]], @"当前对象使用类:%@ 非UILabel的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _labelTextColor = ^(UIColor *textColor){
        [(UILabel *)weakSelf.settingView setTextColor:textColor];
        return weakSelf;
    };
    return _labelTextColor;
}
-(LabelFontSize)labelFontSize{
    __weak typeof(self) weakSelf = self;
        NSAssert([self.settingView.class isSubclassOfClass:[UILabel class]], @"当前对象使用类:%@ 非UILabel的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _labelFontSize = ^(CGFloat fontSize){
        ((UILabel *)weakSelf.settingView).font = [UIFont systemFontOfSize:fontSize];
        return weakSelf;
    };
    return _labelFontSize;
}
-(LabelNumOfLines)labelNumOfLines{
    __weak typeof(self) weakSelf = self;
        NSAssert([self.settingView.class isSubclassOfClass:[UILabel class]], @"当前对象使用类:%@ 非UILabel的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _labelNumOfLines = ^(NSInteger row){
        ((UILabel *)weakSelf.settingView).numberOfLines = row;
        return weakSelf;
    };
    return _labelNumOfLines;
}
-(LabelAlignment)labelAlignment{
    __weak typeof(self) weakSelf = self;
        NSAssert([self.settingView.class isSubclassOfClass:[UILabel class]], @"当前对象使用类:%@ 非UILabel的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _labelAlignment = ^(NSTextAlignment alignment){
        ((UILabel *)weakSelf.settingView).textAlignment = alignment;
        return weakSelf;
    };
    return _labelAlignment;
}
-(LabelFont)labelFont{
    __weak typeof(self) weakSelf = self;
        NSAssert([self.settingView.class isSubclassOfClass:[UILabel class]], @"当前对象使用类:%@ 非UILabel的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _labelFont = ^(UIFont *font){
        ((UILabel *)weakSelf.settingView).font = font;
        return weakSelf;
    };
    return _labelFont;
}

#pragma mark ___________________UIButton________________________
@synthesize buttonImage = _buttonImage;
@synthesize buttonTitle = _buttonTitle;
@synthesize buttonBackgroundImage = _buttonBackgroundImage;
@synthesize buttonTitleColor = _buttonTitleColor;
@synthesize buttonTitleFont = _buttonTitleFont;
@synthesize buttonTitleFontSize = _buttonTitleFontSize;
@synthesize buttonTitleTextAlignment  = _buttonTitleTextAlignment;
@synthesize buttonResponse = _buttonResponse;
@synthesize buttonLayoutContent = _buttonLayoutContent;

-(ButtonImage)buttonImage{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UIButton class]], @"当前对象使用类:%@ 非UIButton的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _buttonImage = ^(UIImage *image,UIControlState state){
        [(UIButton *)weakSelf.settingView setImage:image forState:state];
        return weakSelf;
    };
    return _buttonImage;
}
-(ButtonTitle)buttonTitle{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UIButton class]], @"当前对象使用类:%@ 非UIButton的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _buttonTitle = ^(NSString *titleStr,UIControlState state){
        [(UIButton *)weakSelf.settingView setTitle:titleStr forState:state];
        ((UIButton *)weakSelf.settingView).titleLabel.text = titleStr;
        ((UIButton *)weakSelf.settingView).titleLabel.numberOfLines = 0;
        return weakSelf;
    };
    return _buttonTitle;
}
-(ButtonBackgroundImage)buttonBackgroundImage{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UIButton class]], @"当前对象使用类:%@ 非UIButton的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _buttonBackgroundImage = ^(UIImage *image,UIControlState state){
        [(UIButton *)weakSelf.settingView setBackgroundImage:image forState:state];
        return weakSelf;
    };
    return _buttonBackgroundImage;
}
-(ButtonTitleColor)buttonTitleColor{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UIButton class]], @"当前对象使用类:%@ 非UIButton的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _buttonTitleColor = ^(UIColor *color ,UIControlState state){
        [(UIButton *)weakSelf.settingView setTitleColor:color forState:state];
        return weakSelf;
    };
    return _buttonTitleColor;
}
-(ButtonTitleFont)buttonTitleFont{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UIButton class]], @"当前对象使用类:%@ 非UIButton的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _buttonTitleFont = ^(UIFont *font){
       ((UIButton *)weakSelf.settingView).titleLabel.font = font;
        return weakSelf;
    };
    return _buttonTitleFont;
}
-(ButtonTitleFontSize)buttonTitleFontSize{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UIButton class]], @"当前对象使用类:%@ 非UIButton的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _buttonTitleFontSize= ^(CGFloat fontSize){
        ((UIButton *)weakSelf.settingView).titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return weakSelf;
    };
    return _buttonTitleFontSize;
}
-(ButtonTitleTextAlignment)buttonTitleTextAlignment{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UIButton class]], @"当前对象使用类:%@ 非UIButton的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _buttonTitleTextAlignment = ^(NSTextAlignment alignment){
        ((UIButton *)weakSelf.settingView).titleLabel.textAlignment = alignment;
        
        return weakSelf;
    };
    return _buttonTitleTextAlignment;
}
-(ButtonLayoutContent)buttonLayoutContent{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UIButton class]], @"当前对象使用类:%@ 非UIButton的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _buttonLayoutContent = ^(ChanButtonEdgeInsetsStyle style,CGFloat space){
        [(UIButton *)weakSelf.settingView layoutButtonWithEdgeInsetsStyle:style imageTitleSpace:space];
        return weakSelf;
    };
    return _buttonLayoutContent;
}
-(ButtonResponse)buttonResponse{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UIButton class]], @"当前对象使用类:%@ 非UIButton的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _buttonResponse = ^ (id target,SEL selector,UIControlEvents event){
        [(UIButton *)weakSelf.settingView addTarget:target action:selector forControlEvents:event];
        return weakSelf;
    };
    return _buttonResponse;
}
#pragma mark ___________________UISearchBar________________________
@synthesize searchBarTextFont = _searchBarTextFont;
@synthesize searchBarTextColor = _searchBarTextColor;
@synthesize searchBarTextFontSize = _searchBarTextFontSize;
@synthesize searchBarPlaceholderColor = _searchBarPlaceholderColor;
-(SearchBarTextColor)searchBarTextColor{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UISearchBar class]], @"当前对象使用类:%@ 非UISearchBar的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _searchBarTextColor = ^ (UIColor *textColor){
        UITextField *textfield = [weakSelf.settingView valueForKey:@"_searchField"];
        //如果textfield为空，则还没有创建原因是text和placeholder都没有被设置
        if(!textfield)((UITextField *)weakSelf.settingView).placeholder = @"";
        [textfield setValue:textColor forKeyPath:@"textColor"];
        return weakSelf;
    };
    return _searchBarTextColor;
}
-(SearchBarPlaceholderColor)searchBarPlaceholderColor{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UISearchBar class]], @"当前对象使用类:%@ 非UISearchBar的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _searchBarPlaceholderColor = ^(UIColor *placeholderColor){
        UITextField *textfield = [weakSelf.settingView valueForKey:@"_searchField"];
        //如果textfield为空，则还没有创建原因是text和placeholder都没有被设置
        if(!textfield)((UITextField *)weakSelf.settingView).placeholder = @"";
        [textfield setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
        return weakSelf;
    };
    return _searchBarPlaceholderColor;
}
-(SearchBarTextFont)searchBarTextFont{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UISearchBar class]], @"当前对象使用类:%@ 非UISearchBar的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _searchBarTextFont = ^(UIFont *textFont){
            UITextField *textfield = [weakSelf.settingView valueForKey:@"_searchField"];
        //如果textfield为空，则还没有创建原因是text和placeholder都没有被设置
        if(!textfield)((UITextField *)weakSelf.settingView).placeholder = @"";
            [textfield setValue:textFont forKeyPath:@"font"];
        return weakSelf;
    };
    return _searchBarTextFont;
}
-(SearchBarTextFontSize)searchBarTextFontSize{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UISearchBar class]], @"当前对象使用类:%@ 非UISearchBar的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _searchBarTextFontSize = ^(CGFloat fontSize){
        UITextField *textfield = [weakSelf.settingView valueForKey:@"_searchField"];
        //如果textfield为空，则还没有创建原因是text和placeholder都没有被设置
        if(!textfield)((UITextField *)weakSelf.settingView).placeholder = @"";
        [textfield setValue:[UIFont systemFontOfSize:fontSize] forKeyPath:@"font"];
        return weakSelf;
    };
    return _searchBarTextFontSize;
}
#pragma mark ___________________UITableView________________________
@synthesize tableViewDefaultSettings = _tableViewDefaultSettings;
-(TableViewDefaultSettings)tableViewDefaultSettings
{
    __weak typeof(self) weakSelf = self;
    NSAssert([self.settingView.class isSubclassOfClass:[UITableView class]], @"当前对象使用类:%@ 非UITableView的子类或非本类不能使用此方法:%s ", NSStringFromClass(self.settingView.class),__func__);
    _tableViewDefaultSettings = ^(){
        [(UITableView *)weakSelf.settingView setUpDefaultSettings];
        return weakSelf;
    };
    return _tableViewDefaultSettings;
}

@end

@implementation UIView (ChanViewConfiguration)
-(CVSUniversalModel *)CVC{
    CVSUniversalModel *center = [[CVSUniversalModel alloc] init];
    NSAssert(self != nil, @"view 不能为空 %@",self);
    center.settingView = self;
    return center;
}
- (void)cvc_addSubviews:(NSArray *)subviews
{
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        if ([view.class isSubclassOfClass:[UIView class]]) {
            [self addSubview:view];
        }
    }];
}
@end

@implementation UIButton (ChanViewConfiguration)

- (void)layoutButtonWithEdgeInsetsStyle:(ChanButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space
{
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case ChanButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case ChanButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case ChanButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case ChanButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}
-(void)cvc_actionHandler:(ChanViewConfiguration_ButtonActionBlock)touchHandler{
    objc_setAssociatedObject(self, @selector(ChanViewConfiguration_Button_ActionTouched:), touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(ChanViewConfiguration_Button_ActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)ChanViewConfiguration_Button_ActionTouched:(UIButton *)btn{
    ChanViewConfiguration_ButtonActionBlock block = objc_getAssociatedObject(self, _cmd);
    if (block) {
        block(btn.tag);
    }
}

@end

@implementation UITableView (ChanViewConfiguration)
-(void)cvc_tableViewRegisterCellWithNibNames:(NSArray *)array{
    if(![self _isAllStringIn:array])return;
    for (NSString *nibName in array) {
        [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:nibName];
    }
}
-(void)cvc_tableViewRegisterCellWithClassNames:(NSArray *)array{
    if (![self _isAllStringIn:array])return;
    for (NSString *className in array) {
        [self registerClass:NSClassFromString(className) forCellReuseIdentifier:className];
    }
}
-(void)cvc_tableViewRegisterHeaderFooterViewWithNibNames:(NSArray *)array{
    if(![self _isAllStringIn:array])return;
    for (NSString *nibName in array) {
        [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forHeaderFooterViewReuseIdentifier:nibName];
    }
}
-(void)cvc_tableViewRegisterHeaderFooterViewWithClassNames:(NSArray *)array{
    if (![self _isAllStringIn:array])return;
    for (NSString *className in array) {
        [self registerClass:NSClassFromString(className) forHeaderFooterViewReuseIdentifier:className];
    }
}

-(void)setUpDefaultSettings{
    self.tableFooterView = [UIView new];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}
/**
 *  @brief 判断数组里面是不是全是string
 *  @param array 数组参数
 *  @return  返回结果 数组是否全是string类型 如果数组为nil或0object 返回NO
 */
-(BOOL)_isAllStringIn:(NSArray*)array{
    if(!array || array.count == 0)return NO;
    for (id object in array) {
        if(![[object class] isSubclassOfClass:[NSString class]]){
            return NO;
        }
    }
    return YES;
}

@end

@implementation UIScreen (ChanViewConfiguration)

+(BOOL)cvc_isRetina{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0 || [UIScreen mainScreen].scale == 3.0)) {
        return YES;
    } else {
        return NO;
    }
}

@end
