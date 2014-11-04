//
//  PosterView.h
//  TwiceMovie
//
//  Created by Liming Tian on 10/31/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PosterView : UIView
{
@private
    UIImageView *_headerView;
    UIButton    *_button;
    
    UIScrollView *_contentView;
    
    UILabel      *_footerView;
}
@end
