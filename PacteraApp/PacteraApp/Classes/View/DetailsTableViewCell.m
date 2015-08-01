//
//  DetailsTableViewCell.m
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import "DetailsTableViewCell.h"
#import "PacteraUtility.h"
#import "PacteraUtility.h"

@interface DetailsTableViewCell ()

@property (nonatomic,retain) UILabel *titleLabel;
@property (nonatomic,retain) UILabel *detailLabel;
@property (nonatomic,retain) UIImageView *detailsImageView;

@end

@implementation DetailsTableViewCell





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setDataAndFonts{
    
    // Instantaite pacteraUtility
    PacteraUtility *pacteraUtility  = [PacteraUtility instance];
    
    // Title label is an mandatory filed, If title label is Null it is filtered whie parsing the
    // response
    UILabel *titleLabel = [[UILabel alloc]init];
    self.titleLabel = titleLabel;
    [titleLabel release];
    
    // Set the text and load other fonts to the title label
    [self.titleLabel setText:self.detailTitle];
    [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [self.titleLabel setNumberOfLines:0];
    [self.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0f]];
    [self.titleLabel setTextColor:RGB(65, 85, 140)];
    
    // Add title label to the contentview
    [self.contentView addSubview:self.titleLabel];
    
    
    // Check whether detail description is valid string or not.In case of invalid string the
    // detail label is not instantiated
    
    if ([pacteraUtility isValidString:self.detailDescription]) {
        UILabel *detailsLabel = [[UILabel alloc]init];
        self.detailLabel = detailsLabel;
        [detailsLabel release];
        
        // Set the text and load other fonts to the details label
        [self.detailLabel setText:self.detailDescription];
        [self.detailLabel setTextAlignment:NSTextAlignmentLeft];
        [self.detailLabel setNumberOfLines:0];
        [self.detailLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:14.0f]];
        [self.detailLabel setTextColor:RGB(103, 103, 103)];
        
        // Add detail label to the contentview
        [self.contentView addSubview:self.detailLabel];
    }
    
    // Check whether image href is valid string or not.In case of invalid string the
    // dimage view is not instantiated
    if ([pacteraUtility isValidString:self.detailImageHref]) {
        
        UIImageView *detailsImageView = [[UIImageView alloc]init];
        self.detailsImageView = detailsImageView;
        [detailsImageView release];

        // Add detailsImageView to the contentview
        [self.contentView addSubview:self.detailsImageView];
    }
    
    // Set the color of contentview
    [self setBackgroundColor:RGBa(236, 236, 236,0.6)];

    
}


@end
