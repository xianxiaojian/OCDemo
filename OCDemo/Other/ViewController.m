//
//  ViewController.m
//  OCDemo
//
//  Created by linjing on 16/3/15.
//  Copyright © 2016年 linjing. All rights reserved.
//  new branch linjing

#import "ViewController.h"
#import "PullToRefreshViewController.h"

static NSString *const kCellId = @"cell";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //ssstest run
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellId];
    [self.view addSubview:tableView];
    
    self.array = @[@"PullToRefresh",@"Test",@"",@"",@"",@""];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId forIndexPath:indexPath];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            PullToRefreshViewController *pullToRefreshVC = [[PullToRefreshViewController alloc] init];
            [self.navigationController pushViewController:pullToRefreshVC animated:YES];
        }
            
            break;
            
        default:
            break;
    }
}
@end
