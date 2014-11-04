//
//  ListTableViewCell.h
//  TwiceMovie
//
//  Created by Liming Tian on 10/30/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "USAModel.h"

@interface ListTableViewCell : UITableViewCell
{
    UIImageView *_imageView;
    UILabel     *_titleLabel;
    UILabel     *_yearLabel;
}

@property (nonatomic, retain) USAModel *usaModel;
@end
