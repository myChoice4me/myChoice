//
//  RootViewController.h
//  myChoice
//
//  Created by Tre`Von McKay on 11/11/11.
//  Copyright (c) 2011 McKay Industries. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UINavigationControllerDelegate, UIPageViewControllerDelegate, UISearchBarDelegate, UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate>{
    UISearchBar *mediaSearch;
    UISearchDisplayController *searchController;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;

- (void)hideNavigation;
- (void)showNavigation;

@end
