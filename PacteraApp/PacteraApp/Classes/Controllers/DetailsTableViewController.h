//
//  DetailsTableViewController.h
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ResponseObject;


/**
 
 'DetailsTab;eViewController' is a subclass of UITableViewController, The list in the repsonse is 
 populated in UITabelview by usinf this class
 
 */
@interface DetailsTableViewController : UITableViewController

// The Response object which holds the title name  and rows
@property(nonatomic,retain) ResponseObject *responseObject;

@end
