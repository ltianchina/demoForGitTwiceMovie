//
//  USAViewController.m
//  TwiceMovie
//
//  Created by Liming Tian on 10/28/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "USAViewController.h"
#import "ListTableViewCell.h"
#import "AccessJsonData.h"
#import "USAModel.h"

#define kPosterBtnViewTag 101
#define kListBtnViewTag   102
@interface USAViewController ()

@end

@implementation USAViewController

#pragma mark - UIView lifecycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"USA";
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
    
    [self _initListView];
    
    [self _initPosterView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _customTabbar];
    
    [self requestData];
}

#pragma mark - Private Method
- (void)requestData
{
    NSArray *usaData = [AccessJsonData fetchUSAData];
    
    _usaData = [[NSMutableArray alloc] initWithCapacity:usaData.count];
    
    for (id data in usaData) {
        USAModel *usaModel = [[USAModel alloc] init];
        
        usaModel.medium = [[[data objectForKey:@"subject"] objectForKey:@"images"] objectForKey:@"medium"];
        usaModel.title = [[data objectForKey:@"subject"] objectForKey:@"title"];
        usaModel.year = [[data objectForKey:@"subject"] objectForKey:@"year"];
        
        [_usaData addObject:usaModel];
        [usaModel release];
    }
}

- (void)_initPosterView
{
    _posterView = [[PosterView alloc] initWithFrame:self.view.frame];
    
    _posterView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_posterView];
}

- (void)_initListView
{
    _listView = [[UITableView alloc] initWithFrame:self.view.frame];
    _listView.dataSource = self;
    _listView.delegate = self;
    _listView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_listView];
}

- (void)_customTabbar
{
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    customView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeBroserMode:)];
    [customView addGestureRecognizer:tap];
    [tap release];
    
    UIImageView *posterBtnView = [[UIImageView alloc] initWithFrame:customView.frame];
    posterBtnView.userInteractionEnabled = YES;
    posterBtnView.image = [UIImage imageNamed:@"poster_home"];
    posterBtnView.tag = kPosterBtnViewTag;
    [customView addSubview:posterBtnView];
    [posterBtnView release];
    UIImageView *listBtnView = [[UIImageView alloc] initWithFrame:customView.frame];
    listBtnView.userInteractionEnabled = YES;
    listBtnView.image = [UIImage imageNamed:@"list_home"];
    listBtnView.tag = kListBtnViewTag;
    listBtnView.hidden = YES;
    [customView addSubview:listBtnView];
    [listBtnView release];
    
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    [customView release];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
    [rightBtnItem release];
}

#pragma -mark Action Method
- (void)changeBroserMode:(UITapGestureRecognizer *)tap
{
    UIView *customView = [tap view];
    UIImageView *posterBtnView = (UIImageView *)[customView viewWithTag:kPosterBtnViewTag];
    UIImageView *listBtnView = (UIImageView *)[customView viewWithTag:kListBtnViewTag];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    if (posterBtnView.hidden) {
        posterBtnView.hidden = NO;
        listBtnView.hidden = YES;
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:customView cache:YES];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        
    } else {
        posterBtnView.hidden = YES;
        listBtnView.hidden = NO;
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:customView cache:YES];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
    }
    [UIView commitAnimations];
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_usaData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.usaModel = _usaData[indexPath.row];
    return cell;
}

#pragma mark - UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark - Memory
- (void)dealloc
{
    [_posterView release],_posterView = nil;
    [_listView release], _listView = nil;
    [_usaData release], _usaData = nil;
    [super dealloc];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
