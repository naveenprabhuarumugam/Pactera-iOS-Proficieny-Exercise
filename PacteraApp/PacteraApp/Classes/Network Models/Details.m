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
    
    
    if ([utility isValidString:[reponseDict valueForKeyPath:kDescription]] ) {
        self.detailedDescription = [reponseDict valueForKeyPath:kDescription];
    }
    else{
        self.detailedDescription = @"Sorry, No Description Available";
    }
    if ([utility isValidString:[reponseDict valueForKeyPath:kImageHref]] ) {
        self.imageHref = [reponseDict valueForKeyPath:kImageHref];
    }
    else{
        self.imageHref = @"";
    }
    
    self.title = [reponseDict valueForKeyPath:kTitleName];
    
    return YES;
}





@end
