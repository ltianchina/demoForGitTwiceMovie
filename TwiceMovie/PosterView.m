//
//  PosterView.m
//  TwiceMovie
//
//  Created by Liming Tian on 10/31/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "PosterView.h"
#define kHeaderScrollViewHeight 100
@implementation PosterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self _initHeaderView];
        
        [self _initContentView];
        
        [self _initFooterView];
        
        [self bringSubviewToFront:_headerView];
    }
    
    return self;
}

- (void)_initHeaderView
{
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -kHeaderScrollViewHeight, kDeviceWidth, 20+kHeaderScrollViewHeight)];
    _headerView.userInteractionEnabled = YES;
    UIImage *oldImage = [UIImage imageNamed:@"indexBG_home"];
    UIImage *newImage = [oldImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 120, 0)];
    _headerView.image = newImage;
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(150, 90+10, 20, 20);
    [_button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(pullOrPushBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:_button];
    
    [self addSubview:_headerView];
}

- (void)_initContentView
{
    _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, kDeviceWidth, kDeviceHeight-_footerView.height-20-45-90-40)];
    _contentView.backgroundColor = [UIColor orangeColor];
    [self addSubview:_contentView];
}

- (void)_initFooterView
{
    _footerView = [[UILabel alloc] initWithFrame:CGRectMake(0, _contentView.bottom, kDeviceWidth, 30)];
    _footerView.backgroundColor = [UIColor redColor];
    [self addSubview:_footerView];
}

- (void)pullOrPushBtn:(UIButton *)button
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    if (_headerView.top == 0) {
        _headerView.top = -kHeaderScrollViewHeight;
        [_button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    } else {
        _headerView.top = 0;
        [_button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateNormal];
    }
    [UIView commitAnimations];
}


#pragma mark - Memory

- (void)dealloc
{
    
    [super dealloc];
}
@end
