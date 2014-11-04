//
//  USAViewController.h
//  TwiceMovie
//
//  Created by Liming Tian on 10/28/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterView.h"
@interface USAViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
@private
    PosterView *_posterView;
    UITableView *_listView;
    NSMutableArray *_usaData;
}
@end
