//
//  ItemView.m
//  TwiceMovie
//
//  Created by Liming Tian on 10/28/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "ItemView.h"

@implementation ItemView
#pragma mark - UIView lifecycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _initSubViews];
        
        [self _addGesture];
    }
    
    return self;
}

#pragma mark - Private Method
- (void)_initSubViews
{
    _itemImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    _itemImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_itemImage];
    
    _itemTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    _itemTitle.textAlignment = NSTextAlignmentCenter;
    _itemTitle.textColor = [UIColor whiteColor];
    [self addSubview:_itemTitle];
}

- (void)_addGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_selectedItem:)];
    [self addGestureRecognizer:tap];
    [tap release];
}

- (void)_selectedItem:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(clickedItem:)]) {
        
        [self.delegate clickedItem:self.tag];
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void)layoutSubviews
{
    _itemImage.frame = CGRectMake(0, 0, self.width, self.height*2/3.0);
    
    _itemTitle.frame = CGRectMake(0, _itemImage.bottom, self.width, self.height/3.0);
}

#pragma mark - Memory
- (void)dealloc
{
    self.itemImage = nil;
    self.itemTitle = nil;
    [super dealloc];
}
@end
