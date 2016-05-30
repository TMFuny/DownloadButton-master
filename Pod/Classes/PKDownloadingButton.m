//
//  PKDownloadingButton.m
//  Pods
//
//  Created by MrChens on 16/5/30.
//
//

#import "PKDownloadingButton.h"
#import "NSLayoutConstraint+PKDownloadButton.h"
#import "UIImage+PKDownloadButton.h"

static const CGFloat kDefaultdownloadingButtonWidth = 8.f;

@interface PKDownloadingButton ()

@property (nonatomic, weak) UIButton *downloadingButton;

- (UIButton *)createDownloadingButton;
- (NSArray *)createDownloadingConstraints;
- (void)updateAppearance;
- (PKCircleProgressView *)createCircleProgressView;

@end

static PKDownloadingButton *CommonInit(PKDownloadingButton *self) {
    if (self != nil) {
        UIButton *downloadingButton = [self createDownloadingButton];
        downloadingButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:downloadingButton];
        self.downloadingButton = downloadingButton;
        
        [self addConstraints:[self createDownloadingConstraints]];
        [self updateAppearance];
        [self setNeedsDisplay];
    }
    return self;
}
@implementation PKDownloadingButton


#pragma mark - properties

- (void)setPauseButtonWidth:(CGFloat)downloadingButtonWidth {
    _downloadingButtonWidth = downloadingButtonWidth;
    [self.downloadingButton setImage:[UIImage downloadingImageOfSize:downloadingButtonWidth color:self.tintColor]
                      forState:UIControlStateNormal];
    [self setNeedsDisplay];
}

#pragma mark - initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return CommonInit([super initWithCoder:aDecoder]);
}

- (instancetype)initWithFrame:(CGRect)frame {
    return CommonInit([super initWithFrame:frame]);
}

#pragma mark - private methods
- (UIButton *)createDownloadingButton {
    UIButton *downloadingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    downloadingButton.tintColor = [UIColor clearColor];
    _downloadingButtonWidth = kDefaultdownloadingButtonWidth;
    return downloadingButton;
}

- (NSArray *)createDownloadingConstraints {
    
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsForWrappedSubview:self.downloadingButton withInsets:UIEdgeInsetsZero]];
    
    return constraints;
}

- (PKCircleProgressView *)createCircleProgressView {
    PKCircleProgressView *circleProgressView = [[PKCircleProgressView alloc] init];
    return circleProgressView;
}

#pragma mark - appearance
- (void)updateAppearance {
    [self.downloadingButton setImage:[UIImage downloadingImageOfSize:_downloadingButtonWidth color:self.tintColor]
                      forState:UIControlStateNormal];
}

-(void)tintColorDidChange {
    [super tintColorDidChange];
    [self updateAppearance];
}

@end
