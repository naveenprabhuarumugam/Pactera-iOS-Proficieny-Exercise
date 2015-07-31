//
//  Details.h
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 'Details' is a subclass of 'NSObject' class. This acts as  a bean class or Network Model class for 
 the JSON response
 
 
 */
@interface Details : NSObject

// Ttile freom the Reponse
@property(nonatomic,retain) NSString *title;

// Detaield description from the reponse
@property(nonatomic,retain) NSString *detailedDescription;

// Image Url form the reponse
@property(nonatomic,retain) NSString *imageHref;


/**
 
 Checks whether JSON response has any unexpected values
 
 @Param responseDict A response dictionary which has to be verified for any NULL or unexpected values
 
 */

-(BOOL)conformsToValues:(NSDictionary *)reposneDict;

@end
