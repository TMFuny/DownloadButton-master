//
//  UIImage+PKDownloadButton.m
//  Download
//
//  Created by Pavel on 31/05/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import "UIImage+PKDownloadButton.h"

@implementation UIImage (PKDownloadButton)

+ (UIImage *)stopImageOfSize:(CGFloat)size color:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size, size), NO, 1.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setStroke];
    
    CGRect stopImageRect = CGRectMake(0.f, 0.f, size, size);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextAddRect(context, stopImageRect);
    CGContextFillRect(context, stopImageRect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)downloadingImageOfSize:(CGFloat)size color:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size, size), NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //FIX ME urgly code
    CGContextMoveToPoint(context, size/2-3, size/2-6);
    CGContextAddLineToPoint(context, size/2-3, size/2+6);
    
    CGContextMoveToPoint(context, size/2+3, size/2-6);
    CGContextAddLineToPoint(context, size/2+3, size/2+6);
    
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextStrokePath(context);
    UIImage *pauseImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return pauseImage;
}

+ (UIImage *)pauseImageOfSize:(CGFloat)size color:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size, size), NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //FIX ME urgly code
    CGContextMoveToPoint(context, size/2, size/8);
    CGContextAddLineToPoint(context, size/2, size*7/8);
    
    CGContextMoveToPoint(context, size/2, size*7/8);
    CGContextAddLineToPoint(context, 0,size/2);
    
    CGContextMoveToPoint(context, size/2, size*7/8);
    CGContextAddLineToPoint(context, size, size/2);
    
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextStrokePath(context);
    UIImage *pauseImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return pauseImage;
}

+ (UIImage *)buttonBackgroundWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30.f, 30.f), NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setStroke];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(2.f, 2.f, 26.f, 26.f)
                                                          cornerRadius:4.f];
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    bezierPath.lineWidth = 1.f;
    [bezierPath stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f)];
}

+ (UIImage *)highlitedButtonBackgroundWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30.f, 30.f), NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setStroke];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(2.f, 2.f, 26.f, 26.f)
                                                          cornerRadius:4.f];
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    bezierPath.lineWidth = 1.f;
    [bezierPath stroke];
    [color setFill];
    [bezierPath fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f)];
}

@end
