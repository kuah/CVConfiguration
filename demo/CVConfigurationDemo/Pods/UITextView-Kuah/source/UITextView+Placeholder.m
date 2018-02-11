//
//  UITextView+Placeholder.m
//  UITextView-Kuah
//
//  Created by 陈世翰 on 2018/2/11.
//  Copyright © 2018年 Kuah. All rights reserved.
//

#import "UITextView+Placeholder.h"
#import "NSObject+Kuah.h"
#import <objc/runtime.h>
#import "KTextViewDelegateTransition.h"
@implementation UITextView (Kuah)
#pragma mark -private
-(UITextView *)placeholderTextView{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setPlaceholderTextView:(UITextView *)placeholderTextView{
    objc_setAssociatedObject(self,@selector(placeholderTextView), placeholderTextView,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(KTextViewDelegateTransition *)transitionDelegate{
    KTextViewDelegateTransition *t_delegate = objc_getAssociatedObject(self, _cmd);
    if (!t_delegate) {
        if (![self placeholderTextView])[self addplaceholderTextView];
        KTextViewDelegateTransition *transition = [[KTextViewDelegateTransition alloc]initWithTarget:self placeholderTextView:[self placeholderTextView]];
        [self setTransitionDelegate:transition];
        
    }
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setTransitionDelegate:(KTextViewDelegateTransition *)transitionDelegate{
    objc_setAssociatedObject(self,@selector(transitionDelegate), transitionDelegate,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = transitionDelegate;
}

#pragma mark -extension
-(NSString *)placeholder{
    UITextView * t = [self placeholderTextView];
    return (t && t.text.length>0)?[self placeholderTextView].text:nil;
}
-(void)setPlaceholder:(NSString *)placeholder{
    [self transitionDelegate];
    UITextView * t = [self placeholderTextView];
    if (placeholder.length>0) {
        if (!t) {
            [self addplaceholderTextView];
        }
        [self placeholderTextView].text = placeholder;
    }else{
        if(t)t.hidden = YES;
    }
}
-(UIColor *)placeholderColor{
    UITextView * t = [self placeholderTextView];
    if (t) {
        return t.textColor;
    }
    return nil;
}
-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    [self transitionDelegate];
    UITextView * t = [self placeholderTextView];
    if (!t) {
        [self addplaceholderTextView];
    }
    t.textColor = placeholderColor;
}

#pragma mark -else
+(void)load{
    [self exchangeInstanceMethod1:@selector(setDelegate:) method2:@selector(k_setDelegate:)];
    [self exchangeInstanceMethod1:@selector(setFrame:) method2:@selector(k_setFrame:)];
    [self exchangeInstanceMethod1:@selector(setTextContainerInset:) method2:@selector(k_setTextContainerInset:)];
    [self exchangeInstanceMethod1:@selector(setTextAlignment:) method2:@selector(k_setTextAlignment:)];
    [self exchangeInstanceMethod1:@selector(setFont:) method2:@selector(k_setFont:)];
}
-(void)k_setDelegate:(id<UITextViewDelegate>)delegate{
   
    if (![self isKindOfClass:[UITextView class]])return ;
    if(![delegate conformsToProtocol:@protocol(UITextViewDelegate)] || ![self respondsToSelector:@selector(transitionDelegate)]){
        [self k_setDelegate:delegate];
    }
    if (delegate!=[self transitionDelegate]) {
         [[self transitionDelegate] setRealDelegate:delegate];
    }else{
        [self k_setDelegate:delegate];
    }
}
-(void)k_setFrame:(CGRect)frame{
    [self k_setFrame:frame];
    [self placeholderTextView].frame = (CGRect){0,0,self.bounds.size};
}
-(void)k_setTextContainerInset:(UIEdgeInsets)textContainerInset{
    [self k_setTextContainerInset:textContainerInset];
    [[self placeholderTextView] setTextContainerInset:textContainerInset];
}
-(void)k_setTextAlignment:(NSTextAlignment)textAlignment{
    [self k_setTextAlignment:textAlignment];
    [[self placeholderTextView] setTextAlignment:textAlignment];
}
-(void)k_setFont:(UIFont *)font{
    [self k_setFont:font];
    self.placeholderTextView.font = font;
}

#pragma mark -another textView
-(void)addplaceholderTextView{
    UITextView *textView = [[UITextView alloc]initWithFrame:(CGRect){0,0,self.frame.size.width,self.frame.size.width}];
    [self addSubview:textView];
    textView.editable = NO;
    textView.selectable = NO;
    textView.backgroundColor  = [UIColor clearColor];
    textView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [textView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)]];
    [self setPlaceholderTextView:textView];

}
-(void)tap:(UITapGestureRecognizer *)gesture{
    self.placeholderTextView.hidden = YES;
    [self becomeFirstResponder];
}

@end
