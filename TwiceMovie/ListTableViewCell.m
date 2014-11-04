//
//  ListTableViewCell.m
//  TwiceMovie
//
//  Created by Liming Tian on 10/30/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

#pragma mark - UIViewController Lifecycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self _initSubviews];
        
        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
    return self;
}

#pragma mark - Private Method
- (void)_initSubviews
{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:_titleLabel];
    
    _yearLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:_yearLabel];
}

#pragma mark - LayoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _imageView.frame = CGRectMake(5, 5, 70, 90);
    [_imageView setImageWithURL:[NSURL URLWithString:self.usaModel.medium]];
    
    _titleLabel.frame = CGRectMake(_imageView.right, _imageView.top, kDeviceWidth-_imageView.width-70, _imageView.height/2);
    _titleLabel.text = self.usaModel.title;
    
    _yearLabel.frame = CGRectMake(_titleLabel.left, _titleLabel.bottom, _titleLabel.width, _titleLabel.height);
    _yearLabel.text = self.usaModel.year;
}

#pragma mark - Memory
- (void)dealloc
{
    [_imageView release], _imageView = nil;
    [_titleLabel release], _titleLabel = nil;
    [_yearLabel release], _yearLabel = nil;
    self.usaModel = nil;
    [super dealloc];
}
@end
