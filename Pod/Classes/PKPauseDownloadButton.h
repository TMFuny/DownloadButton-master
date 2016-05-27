//
//  PKPauseDownloadButton.h
//  Pods
//
//  Created by MrChens on 16/5/27.
//
//

#import <UIKit/UIKit.h>
#import "PKCircleProgressView.h"

@interface PKPauseDownloadButton : PKCircleProgressView
@property (nonatomic, assign) IBInspectable CGFloat pauseButtonWidth;
@property (nonatomic, weak, readonly) UIButton *pauseButton;

@end
