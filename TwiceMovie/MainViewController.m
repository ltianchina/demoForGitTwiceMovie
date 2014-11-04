//
//  MainViewController.m
//  TwiceMovie
//
//  Created by Liming Tian on 10/28/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "MainViewController.h"
#import "USAViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"
#import "BaseNavController.h"

@interface MainViewController ()

@end

@implementation MainViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBar.hidden = YES;
    }
    
    return self;
}
#pragma mark - UIViewController lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _initRootViewControllers];
    
    [self _initCustomTabbar];
}

#pragma mark - Private Method
- (void)_initRootViewControllers
{
    USAViewController *usaViewController = [[USAViewController alloc] init];
    BaseNavController *usaNavController = [[BaseNavController alloc] initWithRootViewController:usaViewController];
    [usaViewController release];
    
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    BaseNavController *newsNavController = [[BaseNavController alloc] initWithRootViewController:newsViewController];
    [newsViewController release];
    
    TopViewController *topViewController = [[TopViewController alloc] init];
    BaseNavController *topNavController = [[BaseNavController alloc] initWithRootViewController:topViewController];
    [topViewController release];
    
    CinemaViewController *cinemaViewController = [[CinemaViewController alloc] init];
    BaseNavController *cinemaNavController = [[BaseNavController alloc] initWithRootViewController:cinemaViewController];
    [cinemaViewController release];
    
    MoreViewController *moreViewController = [[MoreViewController alloc] init];
    BaseNavController *moreNavController = [[BaseNavController alloc] initWithRootViewController:moreViewController];
    [moreViewController release];
    
    NSArray *viewControllers = @[usaNavController,newsNavController,topNavController,cinemaNavController,moreNavController];
    
    [self setViewControllers:viewControllers animated:YES];
    
    [usaNavController release];
    [newsNavController release];
    [topNavController release];
    [cinemaNavController release];
    [moreNavController release];
    
}

- (void)_initCustomTabbar
{
    UIImageView *customTabbarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, kDeviceHeight-45-20, kDeviceWidth, 45)];
    customTabbarBG.userInteractionEnabled = YES;
    customTabbarBG.image = [UIImage imageNamed:@"tab_bg_all"];
    [self.view addSubview:customTabbarBG];
    [customTabbarBG release];
    
    _selectedItemImg = [[UIImageView alloc] initWithFrame:CGRectMake(5,0, 58, 45)];
    _selectedItemImg.image = [UIImage imageNamed:@"selectTabbar_bg_all"];
    [customTabbarBG addSubview:_selectedItemImg];
    
    int x = 0;
    NSArray *items = @[@"usa",@"news",@"top",@"cinema",@"more"];
    for (int index = 0; index < 5; index++) {
        _item = [[ItemView alloc] initWithFrame:CGRectMake(5+x,0, 58, 45)];
        _item.delegate = self;
        _item.tag = index;
        _item.itemImage.image = [UIImage imageNamed:items[index]];
        _item.itemTitle.text = items[index];
        [customTabbarBG addSubview:_item];
        
        x += (_item.width+5);
    }
}

#pragma mark - ItemViewDelegate 
- (void)clickedItem:(NSInteger)tag
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    _selectedItemImg.frame = CGRectMake((_item.width+5)*tag, 0, 58, 45);
    [UIView commitAnimations];
    
    self.selectedIndex = tag;
}
#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_selectedItemImg release],_selectedItemImg = nil;
    [_item release], _item = nil;
    [super dealloc];
}

@end
