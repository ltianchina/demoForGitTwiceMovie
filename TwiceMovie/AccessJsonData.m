//
//  AccessJsonData.m
//  TwiceMovie
//
//  Created by Liming Tian on 10/30/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "AccessJsonData.h"

@implementation AccessJsonData

+ (id)parserJsonData:(NSString *)path
{
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    
    NSString *jsonDataPath = [resourcePath stringByAppendingPathComponent:path];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonDataPath];
    
    id jsonObject = [NSJSONSerialization  JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    return jsonObject;
}

+ (id)fetchUSAData
{
    return [[self parserJsonData:@"NorthUSA.json"] objectForKey:@"subjects"];
}
@end
