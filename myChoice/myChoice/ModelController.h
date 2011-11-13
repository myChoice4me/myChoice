//
//  ModelController.h
//  myChoice
//
//  Created by Tre`Von McKay on 11/12/11.
//  Copyright (c) 2011 McKay Industries. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
