//
//  PullToRefreshViewController.m
//  OCDemo
//
//  Created by linjing on 16/3/15.
//  Copyright © 2016年 linjing. All rights reserved.
//

#import "PullToRefreshViewController.h"
#import "UIScrollView+PullToRefresh.h"

#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define KSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
static NSString *const kCellId = @"cell";
@interface PullToRefreshViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;
@end

@implementation PullToRefreshViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, KSCREEN_WIDTH, KSCREEN_HEIGHT-64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellId];
    [self.view addSubview:tableView];
    
    [tableView pullToRefreshWithHandle:^{
        NSLog(@"触发完毕");
    }];
    
    self.array = [NSMutableArray arrayWithObjects:@"00",@"01",@"02", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId forIndexPath:indexPath];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}
@end
