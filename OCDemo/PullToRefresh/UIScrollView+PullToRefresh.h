//
//  UIScrollView+PullToRefresh.h
//  OCDemo
//
//  Created by linjing on 16/3/15.
//  Copyright © 2016年 linjing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LJPullToRefreshState) {
    LJPullToRefreshStateStopped = 0,
    LJPullToRefreshStateTriggered,
    LJPullToRefreshStateLoading,
    LJPullToRefreshStateAll = 10
};
@class LJPullToRefreshView;
@interface UIScrollView (PullToRefresh)
- (void)pullToRefreshWithHandle:(void(^)(void))handle;
@property (nonatomic,strong) LJPullToRefreshView *pullToRefreshView;
@end


@interface LJPullToRefreshView : UIView
@property (nonatomic,copy) void(^handle)(void);
@end