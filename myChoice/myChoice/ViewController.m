//
//  ViewController.m
//  myChoice
//
//  Created by Tre`Von McKay on 11/3/11.
//  Copyright (c) 2011 McKay Industries. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)loadScanner:(id)sender{
    UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];
    [cameraController setDelegate:self];
    [cameraController setSourceType:UIImagePickerControllerSourceTypeCamera];
    [cameraController setCameraCaptureMode:UIImagePickerControllerCameraCaptureModePhoto];
    [cameraController setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    [cameraController setEditing:TRUE animated:YES];
    [cameraController setVideoQuality:UIImagePickerControllerQualityTypeHigh];
    
    [self presentModalViewController:cameraController animated:YES];
}

@end
