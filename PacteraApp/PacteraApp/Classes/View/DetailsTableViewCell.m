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
#import "UIImageView+AFNetworking.h"

#define kLabelHorizontalInsets      10.0f
#define accessoryTypeSpacing 35
#define highPriority 999



@interface DetailsTableViewCell ()



@property (nonatomic, assign) BOOL didSetupConstraints;


@end

@implementation DetailsTableViewCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Title label is an mandatory filed, If title label is Null it is filtered whie parsing the
        // response
        _titleLabel = [[UILabel alloc]init];
        
        
        // Set the text and load other fonts to the title label
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setNumberOfLines:0];
        [_titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0f]];
        [_titleLabel setTextColor:RGB(65, 85, 140)];
        [self.contentView addSubview:_titleLabel];

        
        _detailLabel = [[UILabel alloc]init];
        
        // Set the text and load other fonts to the details label
        [_detailLabel setTextAlignment:NSTextAlignmentLeft];
        [_detailLabel setNumberOfLines:0];
        [_detailLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:14.0f]];
        [_detailLabel setTextColor:RGB(103, 103, 103)];
        [self.contentView addSubview:_detailLabel];
        
        _detailsImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_detailsImageView];
        
        [self setBackgroundColor:RGBa(236, 236, 236,0.6)];
        
        
    }
    
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)updateConstraints{
    
    if (!self.didSetupConstraints) {

        
        // Does not Convert Atoresizing mask to constraints
        [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        // Add Leading Constraint for title Label
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                            attribute:NSLayoutAttributeLeading
                                                            relatedBy:NSLayoutRelationEqual
                                                            toItem:self.contentView
                                                            attribute:NSLayoutAttributeLeading
                                                            multiplier:1
                                                            constant:kLabelHorizontalInsets]];
        
        // Add Trailing Constraint for title Label
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeTrailing
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTrailing
                                                                    multiplier:1
                                                                      constant:kLabelHorizontalInsets]];
        
        // Add Top Constraint for title Label
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:kLabelHorizontalInsets]];
        
            
        // Does not Convert Autoresizing mask to constraints
        [self.detailLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
            
        // Add leading constraint to detail labe w.r.t the title label
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                toItem:self.titleLabel
                                                                attribute:NSLayoutAttributeLeading
                                                                multiplier:1
                                                                constant:0]];
            
        
            
        // Add top constraint from title label
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel
                                                                         attribute:NSLayoutAttributeTop
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.titleLabel
                                                                         attribute:NSLayoutAttributeBottom
                                                                        multiplier:1
                                                                          constant:kLabelHorizontalInsets]];
            
        // Add bottom constarint to content view
        NSLayoutConstraint *bottomConstraintForDetailLabel =[NSLayoutConstraint constraintWithItem:self.contentView
                                                                                    attribute:NSLayoutAttributeBottom
                                                                                    relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                                    toItem:self.detailLabel
                                                                                    attribute:NSLayoutAttributeBottom
                                                                                    multiplier:1
                                                                                    constant:kLabelHorizontalInsets];
            
            // Set High Prioiryt to the constraint and add the same to conetent view
        [bottomConstraintForDetailLabel setPriority:UILayoutPriorityRequired];
        [self.contentView addConstraint:bottomConstraintForDetailLabel];
        
        // Does not Convert Autoresizing mask to constraints
        [self.detailsImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        // Add Trailing constraint for Inmageview w.r.t the contentview
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                            attribute:NSLayoutAttributeTrailing
                                                            relatedBy:NSLayoutRelationEqual
                                                            toItem:self.detailsImageView
                                                            attribute:NSLayoutAttributeTrailing
                                                            multiplier:1
                                                            constant:kLabelHorizontalInsets]];
        
        // Add CentreY constraint for ImageView w.r.t ot content view
        NSLayoutConstraint *constraintCentreYForImageView= [NSLayoutConstraint
                                                            constraintWithItem:self.detailsImageView
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                            toItem:self.contentView
                                                            attribute:NSLayoutAttributeCenterY
                                                            multiplier:1 constant:0];
        // Set low priority and add to the content view
        [constraintCentreYForImageView setPriority:highPriority];
        [self.contentView addConstraint:constraintCentreYForImageView];
        
        // Add Top constraint for Inmageview w.r.t the detail label
        NSLayoutConstraint *constraintTopForImageView =[NSLayoutConstraint
                                   constraintWithItem:self.detailsImageView
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.detailLabel
                                   attribute:NSLayoutAttributeTop
                                   multiplier:1
                                   constant:0];
        
        // Set High priority and add to the content view
        [constraintTopForImageView setPriority:UILayoutPriorityDefaultLow];
        [self.contentView addConstraint:constraintTopForImageView];
        
        // Add bottom constraint to imageview w.r.t contnet view
        [self.contentView addConstraint:[NSLayoutConstraint
                                         constraintWithItem:self.contentView
                                         attribute:NSLayoutAttributeBottom
                                         relatedBy:NSLayoutRelationGreaterThanOrEqual
                                         toItem:self.detailsImageView
                                         attribute:NSLayoutAttributeBottom
                                         multiplier:1
                                         constant:kLabelHorizontalInsets]];
            
        // Setting the Height and Width for the ImageView.
        // NOTE : Constraints for image view are set using Autolayout VFL language
            NSDictionary *dictionary=NSDictionaryOfVariableBindings(_detailsImageView);
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_detailsImageView(70)]" options:0 metrics:nil views:dictionary]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_detailsImageView(50)]" options:0 metrics:nil views:dictionary]];
        
        // Add Trailing constraint to detail label w.r.t the title label
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.detailsImageView
                                                            attribute:NSLayoutAttributeLeading
                                                            relatedBy:NSLayoutRelationEqual
                                                            toItem:self.detailLabel
                                                            attribute:NSLayoutAttributeTrailing
                                                            multiplier:1
                                                            constant:kLabelHorizontalInsets]];
        
        self.didSetupConstraints = YES;

    }
    [super updateConstraints];

    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
    self.titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.titleLabel.frame)-accessoryTypeSpacing;
    self.detailLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.detailLabel.frame)-accessoryTypeSpacing;
}




#pragma mark -
#pragma mark Dealloc Method

-(void)dealloc
{
    [_titleLabel release];
    [_detailLabel release];
    [_detailsImageView release];
    
    [super dealloc];
}



@end
