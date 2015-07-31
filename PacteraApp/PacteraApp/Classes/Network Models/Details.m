//
//  Details.m
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import "Details.h"
#import "PacteraUtility.h"


// Keys used for parsing from JSON reponse
static NSString * const kTitleName = @"title";
static NSString * const kDescription = @"description";
static NSString * const kImageHref = @"imageHref";


@implementation Details


-(BOOL)conformsToValues:(NSDictionary *)reponseDict{
    PacteraUtility *utility = [PacteraUtility instance];
    
    if (![utility isValidString:[reponseDict valueForKeyPath:kTitleName]] && ![utility isValidString:[reponseDict valueForKeyPath:kDescription]] && ![utility isValidString:[reponseDict valueForKeyPath:kImageHref]]) {
        return NO;
    }
    
    self.title = [reponseDict valueForKeyPath:kTitleName];
    self.detailedDescription = [reponseDict valueForKeyPath:kDescription];
    self.imageHref = [reponseDict valueForKeyPath:kImageHref];
    
    return YES;
}


#pragma mark -
#pragma mark Dealloc Method
-(void)dealloc{
    
    [_title release];
    [_detailedDescription release];
    [_imageHref release];
    
    [super dealloc];
    
}


@end
