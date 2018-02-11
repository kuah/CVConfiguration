//
//  NSObject+Kuah.h
//  UITextView-Kuah
//
//  Created by 陈世翰 on 2018/2/11.
//  Copyright © 2018年 Kuah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Kuah)
/**
 *  @brief 调换该类对象方法的实现
 */
+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2;
/**
 *  @brief 调换该类的类方法的实现
 */
+ (void)exchangeClassMethod1:(SEL)method1 method2:(SEL)method2;
@end
