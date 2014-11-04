//
//  ItemView.h
//  TwiceMovie
//
//  Created by Liming Tian on 10/28/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ItemViewDelegate <NSObject>
- (void)clickedItem:(NSInteger)tag;
@end

@interface ItemView : UIView

@property (nonatomic,retain) UIImageView *itemImage;
@property (nonatomic,retain) UILabel     *itemTitle;
@property (nonatomic,assign) id<ItemViewDelegate> delegate;
@end
