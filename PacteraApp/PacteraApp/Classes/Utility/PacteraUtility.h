//
//  PacteraUtility.h
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 PacteraUtility is a utility class , all the helper functions for this porject are made available in this class
 
 */

@interface PacteraUtility : NSObject

/**
 Get the instance of the class using this function, Its a singleton class
 
 */
+(id)instance;

/**
 
 Checks whther the string is a valid one, checks for NULL and empty string
 
 @param string A string whose validity has t be verified
 
 */
-(BOOL)isValidString:(id)string;

@end
