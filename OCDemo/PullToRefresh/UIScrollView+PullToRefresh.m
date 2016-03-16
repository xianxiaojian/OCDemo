//
//  UIScrollView+PullToRefresh.m
//  OCDemo
//
//  Created by linjing on 16/3/15.
//  Copyright © 2016年 linjing. All rights reserved.
//

#import "UIScrollView+PullToRefresh.h"
#import <objc/runtime.h>

static const CGFloat kPullToRefreshViewHeight = 60;
static char UIScrollViewPullToRefreshView;
@interface LJPullToRefreshView ()
@property (nonatomic,assign) LJPullToRefreshState state;
@end

@implementation LJPullToRefreshView

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
//    NSLog(@"%@",change);
    CGPoint point = [change[@"new"] CGPointValue];
    NSLog(@"%f",point.y);
    if (self.state != LJPullToRefreshStateLoading) {
        if (point.y < -60) {
            self.state = LJPullToRefreshStateTriggered;
        }
    }else{
        
    }
}

@end

@interface UIScrollView ()

@end

@implementation UIScrollView (PullToRefresh)
@dynamic pullToRefreshView;
- (void)pullToRefreshWithHandle:(void (^)(void))handle{
    LJPullToRefreshView *view = [[LJPullToRefreshView alloc] initWithFrame:CGRectMake(0, -kPullToRefreshViewHeight, self.frame.size.width, kPullToRefreshViewHeight)];
    view.backgroundColor = [UIColor blueColor];
    [self addSubview:view];
    view.handle = handle;
    self.pullToRefreshView = view;
    view.state = LJPullToRefreshStateStopped;
    [self addObserver:view forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (LJPullToRefreshView *)pullToRefreshView{
    return objc_getAssociatedObject(self, &UIScrollViewPullToRefreshView);
}

- (void)setPullToRefreshView:(LJPullToRefreshView *)view{
    objc_setAssociatedObject(self, &UIScrollViewPullToRefreshView, view, OBJC_ASSOCIATION_ASSIGN);
}
@end
