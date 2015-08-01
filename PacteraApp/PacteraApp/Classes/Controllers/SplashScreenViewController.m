//
//  SplashScreenViewController.m
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 31/07/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import "SplashScreenViewController.h"
#import "NetworkBase.h"
#import "DetailsTableViewController.h"

@interface SplashScreenViewController ()

// UIActivity Indicato to be displayed when service call is made
@property (nonatomic,retain) UIActivityIndicatorView *activityIndicatorView;


// Error message from service all is displayed to the user
-(void)showErrorAlert:(NSError *)error;

@end

@implementation SplashScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    // Allocate backgrounf image view fro the splash screen
    UIImageView *backGroundImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Pacteranew"]];
    [self.view addSubview:backGroundImageView];

    // Do not resize Autoresizing mask to constraints
    [backGroundImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    // Add Leading constraint to image view w.r.t self.vie
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:backGroundImageView
                              attribute:NSLayoutAttributeLeading
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeLeading
                              multiplier:1
                              constant:0]];
    
    // Add Traiing constraint to image view w.r.t self.vie
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:backGroundImageView
                              attribute:NSLayoutAttributeTrailing
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeTrailing
                              multiplier:1
                              constant:0]];
    
    // Add Top constraint to image view w.r.t self.vie
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:backGroundImageView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeTop
                              multiplier:1
                              constant:0]];
    
    // Add Bottom constraint to image view w.r.t self.vie
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:backGroundImageView
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeBottom
                              multiplier:1
                              constant:0]];
    
    [backGroundImageView release];

    
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
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self.activityIndicatorView startAnimating];
    [self loadDetailsAboutCanada];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark -
# pragma mark Custom Methods

-(void)loadDetailsAboutCanada{
    
    NetworkBase *networkBaeObj = [[NetworkBase alloc]init];
    [networkBaeObj fetchDetailsWithBlock:^(ResponseObject *responseObj, NSError *error) {
        
        if (!error) {
            // Success repsosne
            NSLog(@"Success Response received");
            
            // Instantiate the DetaisTableViewcontroller with plain style and set the response object paramter
            DetailsTableViewController *detailsTableViewControllerObj= [[DetailsTableViewController alloc]initWithStyle:UITableViewStylePlain];
            
            [detailsTableViewControllerObj setResponseObject:responseObj];
            
            // Push the tableview contoller on to the stack
            [self.navigationController pushViewController:detailsTableViewControllerObj animated:YES];
            
            // Release the table viewcontroller object
            [detailsTableViewControllerObj release];
            
            
        }
        else{
            
            // Failure Scenario
            NSLog(@"UnSuccessfull Response Received");
            
            // Display error alert to the user
            [self showErrorAlert:error];
        }
    }];
    
}

-(void)showErrorAlert:(NSError *)error
{
    // Allocate the alertview and set the error message with retry option
    UIAlertView *alertView=[[[UIAlertView alloc]initWithTitle:@"" message:@"The internet conenction appears to be offline. Kindly connect your device with a network and try again" delegate:self cancelButtonTitle:@"Retry" otherButtonTitles: nil] autorelease];
    [alertView setDelegate:self];
    [alertView show];
}


#pragma mark -
#pragma mark Alertview delegate


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    // On tap of retry button in alert invoke network call again
    [self loadDetailsAboutCanada];
}

#pragma mark -
#pragma mark dealloc
-(void)dealloc
{
    [_activityIndicatorView release];
    [super dealloc];
}



@end
