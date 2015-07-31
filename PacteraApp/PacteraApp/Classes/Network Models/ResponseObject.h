//
//  ResponseObject.h
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 
 'ResponseObject' is the subclass of 'NSObject' it holds the reposne title and the array of Details object
 
 */
@interface ResponseObject : NSObject

@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSMutableArray *detailsObjArray;

/**
 
 Intializer method of this class with tile and details array
 
 */

-(id)initWithTitle:(NSString *)title andDetails:(NSMutableArray *)detailsArray;

@end
