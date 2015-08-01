//
//  DetailsTableViewCell.h
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 DetailsTableViewCell is a sub class of UITableviewCell and its formatted to rende the uilabel and imageviews
 
 */

@interface DetailsTableViewCell : UITableViewCell

@property(nonatomic,retain) NSString *detailTitle;
@property(nonatomic,retain) NSString *detailDescription;
@property(nonatomic,retain) NSString *detailImageHref;

// Set the data in the UIlabel and imageview and the fonts for the UIlabel
-(void)setDataAndFonts;

@end
