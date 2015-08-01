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


@property (nonatomic,retain) UILabel *titleLabel; // title label which holds the Heading of the table viee cell
@property (nonatomic,retain) UILabel *detailLabel; // Description content
@property (nonatomic,retain) UIImageView *detailsImageView; // imageview which loads image url from backgrounds



@end
