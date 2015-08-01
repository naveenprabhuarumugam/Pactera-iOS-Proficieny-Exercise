//
//  DetailsTableViewController.m
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "ResponseObject.h"
#import "DetailsTableViewCell.h"
#import "Details.h"
#import "UIImageView+AFNetworking.h"
#import "PacteraUtility.h"
#import "NetworkBase.h"


static NSString *CellIdentifier = @"CellIdentifier";


@interface DetailsTableViewController ()

// A dictionary of offscreen cells that are used within the tableView:heightForRowAtIndexPath: method to
// handle the height calculations. These are never drawn onscreen. The dictionary is in the format:
//      { NSString *reuseIdentifier : UITableViewCell *offscreenCell, ... }
@property (retain, nonatomic) NSMutableDictionary *offscreenCells;

@property (nonatomic,retain) UIRefreshControl *refreshControl;

-(void)handleRefresh;

// Error message from service all is displayed to the user
-(void)showErrorAlert:(NSError *)error;

@end

@implementation DetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.tableView registerClass:[DetailsTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    // Setting the estimated row height prevents the table view from calling tableView:heightForRowAtIndexPath: for every row in the table on first load;
    // it will only be called as cells are about to scroll onscreen. This is a major performance optimization.
    if ([self.tableView respondsToSelector:@selector(estimatedRowHeight)]) {
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    }
    
    self.tableView.allowsSelection = NO;
    
    // Instantiate UIRefreshControl
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    self.refreshControl = refreshControl;
    [refreshControl release];
    
    // Add target and selector to refreshcontrol
    [self.refreshControl addTarget:self action:@selector(handleRefresh) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addSubview:self.refreshControl];
    
    // Unhide the navigation bar and set the title from the response
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationItem setTitle:self.responseObject.title];
    [self.navigationItem setHidesBackButton:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self.responseObject detailsObjArray] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    Details *detailsObj = [[self.responseObject detailsObjArray] objectAtIndex:indexPath.row];
    
    // Set the data and fonts of the UITableviewcell
    [cell.titleLabel setText:detailsObj.title];
    [cell.detailLabel setText:detailsObj.detailedDescription];
    [cell.detailsImageView setImageWithURL:[NSURL URLWithString:detailsObj.imageHref] placeholderImage:[UIImage imageNamed:@"Noimage"]];

    
    // Make sure the constraints have been added to this cell, since it may have just been created from scratch
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This project has only one cell identifier, but if you are have more than one, this is the time
    // to figure out which reuse identifier should be used for the cell at this index path.
    NSString *reuseIdentifier = CellIdentifier;
    
    // Use the dictionary of offscreen cells to get a cell for the reuse identifier, creating a cell and storing
    // it in the dictionary if one hasn't already been added for the reuse identifier.
    // WARNING: Don't call the table view's dequeueReusableCellWithIdentifier: method here because this will result
    // in a memory leak as the cell is created but never returned from the tableView:cellForRowAtIndexPath: method!
    DetailsTableViewCell *cell = [self.offscreenCells objectForKey:reuseIdentifier];
    if (!cell) {
        cell = [[[DetailsTableViewCell alloc] init] autorelease];
        [self.offscreenCells setObject:cell forKey:reuseIdentifier];
    }
    
    // Configure the cell for this indexPath
    
    Details *detailsObj = [[self.responseObject detailsObjArray] objectAtIndex:indexPath.row];

    
    // Set the data to the UITableviewcell
    [cell.titleLabel setText:detailsObj.title];
    [cell.detailLabel setText:detailsObj.detailedDescription];
    
    // Make sure the constraints have been added to this cell, since it may have just been created from scratch
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    // The cell's width must be set to the same size it will end up at once it is in the table view.
    // This is important so that we'll get the correct height for different table view widths, since our cell's
    // height depends on its width due to the multi-line UILabel word wrapping. Don't need to do this above in
    // -[tableView:cellForRowAtIndexPath:] because it happens automatically when the cell is used in the table view.
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));

    
    // Do the layout pass on the cell, which will calculate the frames for all the views based on the constraints
    // (Note that the preferredMaxLayoutWidth is set on multi-line UILabels inside the -[layoutSubviews] method
    // in the UITableViewCell subclass
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    // Get the actual height required for the cell
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    // Add an extra point to the height to account for the cell separator, which is added between the bottom
    // of the cell's contentView and the bottom of the table view cell.
    height += 1;
    
    return height;
}


#pragma mark -
#pragma mark Custom Methods

-(void)handleRefresh{
    
    [self.refreshControl beginRefreshing];
    // Instantai the Network base object, which is the gate way to make networkcalls
    NetworkBase *networkBaeObj = [[[NetworkBase alloc]init] autorelease];
    [networkBaeObj fetchDetailsWithBlock:^(ResponseObject *responseObj, NSError *error) {
        
        if (!error) {
            // Success repsosne
            NSLog(@"Success Response received");
            
            // Update the new response Object with the old one
            self.responseObject = responseObj;
            [self.tableView reloadData];
        }
        else{
            
            // Failure Scenario
            NSLog(@"UnSuccessfull Response Received");
            
            // Display error alert to the user
            [self showErrorAlert:error];
        }
        
        
        // Stop the refresh conreol
        [self.refreshControl endRefreshing];
    }];
    
}


-(void)showErrorAlert:(NSError *)error
{
    // Allocate the alertview and display the message
    UIAlertView *alertView=[[[UIAlertView alloc]initWithTitle:@"Error" message:@"The internet conenction appears to be offline. Kindly connect your device with a network and try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
    [alertView show];
}


#pragma mark -
#pragma mark dealloc
-(void)dealloc
{
    [_offscreenCells release];
    [_responseObject release];
    
    [super dealloc];
}

@end
