//
//  Details.m
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import "Details.h"
#import "PacteraUtility.h"
#import "PacteraConstants.h"




@implementation Details


-(BOOL)conformsToValues:(NSDictionary *)reponseDict{
    PacteraUtility *utility = [PacteraUtility instance];
    
    if (![utility isValidString:[reponseDict valueForKeyPath:TITLENAME]] && ![utility isValidString:[reponseDict valueForKeyPath:DESCRIPTION]] && ![utility isValidString:[reponseDict valueForKeyPath:IMAGEHREF]]) {
        return NO;
    }
    
    
    if ([utility isValidString:[reponseDict valueForKeyPath:DESCRIPTION]] ) {
        self.detailedDescription = [reponseDict valueForKeyPath:DESCRIPTION];
    }
    else{
        self.detailedDescription = @"Sorry, No Description Available";
    }
    if ([utility isValidString:[reponseDict valueForKeyPath:IMAGEHREF]] ) {
        self.imageHref = [reponseDict valueForKeyPath:IMAGEHREF];
    }
    else{
        self.imageHref = @"";
    }
    
    self.title = [reponseDict valueForKeyPath:TITLENAME];
    
    return YES;
}





@end
