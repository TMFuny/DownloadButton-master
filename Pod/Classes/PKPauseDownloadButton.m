//
//  PKPauseDownloadButton.m
//  Pods
//
//  Created by MrChens on 16/5/27.
//
//

#import "PKPauseDownloadButton.h"
#import "NSLayoutConstraint+PKDownloadButton.h"
#import "UIImage+PKDownloadButton.h"

static const CGFloat kDefaultPauseButtonWidth = 8.f;

@interface PKPauseDownloadButton ()

@property (nonatomic, weak) UIButton *pauseButton;

- (UIButton *)createPauseButton;
- (NSArray *)createPauseButtonConstraints;
- (void)updateAppearance;
- (PKCircleProgressView *)createCircleProgressView;

@end

static PKPauseDownloadButton *CommonInit(PKPauseDownloadButton *self) {
    if (self != nil) {
        UIButton *pauseButton = [self createPauseButton];
        pauseButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:pauseButton];
        self.pauseButton = pauseButton;
        
        [self addConstraints:[self createPauseButtonConstraints]];
        [self updateAppearance];
        [self setNeedsDisplay];
    }
    return self;
}

@implementation PKPauseDownloadButton

#pragma mark - properties

- (void)setPauseButtonWidth:(CGFloat)pauseButtonWidth {
    _pauseButtonWidth = pauseButtonWidth;
    [self.pauseButton setImage:[UIImage pauseImageOfSize:pauseButtonWidth color:self.tintColor]
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
- (UIButton *)createPauseButton {
    UIButton *pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pauseButton.tintColor = [UIColor clearColor];
    _pauseButtonWidth = kDefaultPauseButtonWidth;
    return pauseButton;
}

- (NSArray *)createPauseButtonConstraints {
    
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsForWrappedSubview:self.pauseButton withInsets:UIEdgeInsetsZero]];
    
    return constraints;
}

- (PKCircleProgressView *)createCircleProgressView {
    PKCircleProgressView *circleProgressView = [[PKCircleProgressView alloc] init];
    return circleProgressView;
}

#pragma mark - appearance
- (void)updateAppearance {
    [self.pauseButton setImage:[UIImage pauseImageOfSize:_pauseButtonWidth color:self.tintColor]
                      forState:UIControlStateNormal];
}

-(void)tintColorDidChange {
    [super tintColorDidChange];
    [self updateAppearance];
}
@end
