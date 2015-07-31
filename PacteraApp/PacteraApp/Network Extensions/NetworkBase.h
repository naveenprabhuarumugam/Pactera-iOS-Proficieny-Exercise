//
//  NetworkBase.h
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResponseObject;


/**
 'Networkbase' is the subclass of 'NSObject' class. Connection with AFNetworking core classes are made via this class,It acts as a wrapper for AFNetworking
 */
@interface NetworkBase : NSObject

/*
Creates Network connection and fetches Deatils object
 
@param block A block object which has to be executed even when the request operation returns either successfully or unsuccessfully. This block takes two arguments, responseObj is set when there is successful response and error value is set when there is unsuccessful response

 */

-(void)fetchDetailsWithBlock:(void (^)(ResponseObject* responseObj, NSError * error))block;

@end
