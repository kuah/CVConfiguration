//
//  KTextViewDelegateTransition.m
//  UITextView-Kuah
//
//  Created by 陈世翰 on 2018/2/11.
//  Copyright © 2018年 Kuah. All rights reserved.
//

#import "KTextViewDelegateTransition.h"

@interface KTextViewDelegateTransition()
/**
 *   <#decr#>
 */
@property (nonatomic,weak)UITextView *target;
/**
 *   <#decr#>
 */
@property (nonatomic,weak)UITextView *placeholderTextView;
/**
 *   <#decr#>
 */
@property (nonatomic,weak)id<UITextViewDelegate> realDelegate;

@end
@implementation KTextViewDelegateTransition
-(instancetype)initWithTarget:(id)target placeholderTextView:(UITextView *)placeholderTextView{
    self = [super init];
    _placeholderTextView = placeholderTextView;
    _target = target;
    return self;
}

-(void)setRealDelegate:(id<UITextViewDelegate>)delegate{
    if (delegate != self) {
        _realDelegate = delegate;
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    __strong NSObject<UITextViewDelegate>* strongDelegate = _realDelegate;
    if (strongDelegate && [strongDelegate respondsToSelector:@selector(textViewShouldBeginEditing:)]) {
        return [strongDelegate textViewShouldBeginEditing:textView];
    }
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    __strong NSObject<UITextViewDelegate>* strongDelegate = _realDelegate;
    if (strongDelegate && [strongDelegate respondsToSelector:@selector(textViewShouldEndEditing:)]) {
        return [strongDelegate textViewShouldEndEditing:textView];
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    __strong NSObject<UITextViewDelegate>* strongDelegate = _realDelegate;
    self.placeholderTextView.hidden = YES;
    if (strongDelegate && [strongDelegate respondsToSelector:@selector(textViewDidBeginEditing:)]) {
        [strongDelegate textViewDidBeginEditing:textView];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    __strong NSObject<UITextViewDelegate>* strongDelegate = _realDelegate;
    if (self.target.text.length == 0) {
        self.placeholderTextView.hidden = NO;
    }
    if (strongDelegate && [strongDelegate respondsToSelector:@selector(textViewDidEndEditing:)]) {
        [strongDelegate textViewDidEndEditing:textView];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    __strong NSObject<UITextViewDelegate>* strongDelegate = _realDelegate;
    if (strongDelegate && [strongDelegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        return [strongDelegate textView:textView shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView{
    __strong NSObject<UITextViewDelegate>* strongDelegate = _realDelegate;
    if (strongDelegate && [strongDelegate respondsToSelector:@selector(textViewDidChange:)]) {
        [strongDelegate textViewDidChange:textView];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    __strong NSObject<UITextViewDelegate>* strongDelegate = _realDelegate;
    if (strongDelegate && [strongDelegate respondsToSelector:@selector(textViewDidChangeSelection:)]) {
        [strongDelegate textViewDidChangeSelection:textView];
    }
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0){
    __strong NSObject<UITextViewDelegate>* strongDelegate = _realDelegate;
    if (strongDelegate && [strongDelegate respondsToSelector:@selector(textView:shouldInteractWithURL:inRange:)]) {
        return [strongDelegate textView:textView shouldInteractWithURL:URL inRange:characterRange interaction:interaction];
    }
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0){
    __strong NSObject<UITextViewDelegate>* strongDelegate = _realDelegate;
    if (strongDelegate && [strongDelegate respondsToSelector:@selector(textView:shouldInteractWithTextAttachment:inRange:)]) {
        return [strongDelegate textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange interaction:interaction];
    }
    return YES;
}
@end
