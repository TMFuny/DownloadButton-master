//
//  PKDownloadingButton.h
//  Pods
//
//  Created by MrChens on 16/5/30.
//
//

#import <UIKit/UIKit.h>

#import "PKCircleProgressView.h"

@interface PKDownloadingButton : PKCircleProgressView
@property (nonatomic, assign) IBInspectable CGFloat downloadingButtonWidth;
@property (nonatomic, weak, readonly) UIButton *downloadingButton;
@end
