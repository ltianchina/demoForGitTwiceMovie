//
//  USAModel.m
//  TwiceMovie
//
//  Created by Liming Tian on 10/30/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "USAModel.h"

@implementation USAModel

#pragma mark - Memory

- (void)dealloc
{
    self.medium = nil;
    self.title = nil;
    self.year = nil;
    [super dealloc];
}
@end
