//
//  RootViewController.m
//  myChoice
//
//  Created by Tre`Von McKay on 11/11/11.
//  Copyright (c) 2011 McKay Industries. All rights reserved.
//

#import "RootViewController.h"

#import "ModelController.h"
#import "DataViewController.h"

@interface RootViewController ()

@property (readonly, strong, nonatomic) ModelController *modelController;

@end

@implementation RootViewController

@synthesize pageViewController = _pageViewController;
@synthesize modelController = _modelController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
/*
- (void)loadView
{
}
*/
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"myChoice" style:UIBarButtonItemStyleBordered target:self.navigationController action:@selector(popViewControllerAnimated:)];
    
    [self.navigationItem setBackBarButtonItem:backBtn];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:nil];
    }
    
    switch (indexPath.row) {
        case 0:{
            [cell.textLabel setText:@"Transformers 3: Dark Side of the Moon"];
            break;
        }
        default:
            break;
    }
        
    return cell;
}

#pragma mark -
#pragma mark - Tableview Delegate

- (void)hideNavigation{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)showNavigation{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self performSelector:@selector(hideNavigation) withObject:nil afterDelay:0.7];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self.pageViewController setDelegate:self];
    
    DataViewController *startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray *viewControllers = [NSArray arrayWithObjects:startingViewController, nil];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    
    [self.pageViewController setDataSource:self.modelController];
    
    [self addChildViewController:self.pageViewController];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:self.pageViewController animated:YES];
    
    CGRect pageViewRect = self.navigationController.view.bounds;
    [self.pageViewController.view setFrame:pageViewRect];
    
    [self.pageViewController didMoveToParentViewController:self];
    
    [self.view setGestureRecognizers:self.pageViewController.gestureRecognizers];
    [self performSelector:@selector(hideNavigation) withObject:nil afterDelay:0.7];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showNavigation)];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [swipeDown setEnabled:TRUE];
    
    [self.pageViewController.view addGestureRecognizer:swipeDown];
}

- (ModelController *)modelController{
    /*
     Return the model controller object, creating it if necessary.
     In more complex implementations, the model controller may be passed to the view controller.
     */
    if (!_modelController) {
        _modelController = [[ModelController alloc] init];
    }
    return _modelController;
}

#pragma mark -
#pragma mark - UIPageViewController delegate methods

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation{
    
    UIViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:currentViewController];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
    [self.pageViewController setDoubleSided:NO];
    
    return UIPageViewControllerSpineLocationMin;
}

#pragma mark -
#pragma mark - UISearchDisplay Delegate

#pragma mark -
#pragma mark - UISearchbar Delegate

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.searchDisplayController setActive:NO animated:YES];
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar{
    //[self presentModalViewController:searchController.searchContentsController animated:YES];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [self.searchDisplayController setActive:YES animated:YES];
    
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [self.searchDisplayController setActive:YES animated:YES];
}

@end
