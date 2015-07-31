//
//  SplashScreenViewController.m
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 31/07/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import "SplashScreenViewController.h"

@interface SplashScreenViewController ()

@property (nonatomic,strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation SplashScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    // Instantiates the activityindicator View and releasing it after transferrign the ownership
    UIActivityIndicatorView *activityIndicatorObj= [[UIActivityIndicatorView alloc]init];
    self.activityIndicatorView =activityIndicatorObj;
    [activityIndicatorObj release];
    
    [self.view addSubview:self.activityIndicatorView];
    
    // Set TranslatesAutoresizingMaskIntoConstraints to 'No' for the UIElement to behave as per the Autolayout
    [self.activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    // Aligns the activity indicator view with centre X of its superview
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    // Aligns the activity indicator view with centre Y of its superview
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
