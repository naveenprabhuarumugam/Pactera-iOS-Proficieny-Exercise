//
//  NetworkClient.m
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import "NetworkClient.h"

static NSString * const kBaseURLString = @"https://dl.dropboxusercontent.com/";  // Base URL string


@implementation NetworkClient



#pragma mark -
#pragma mark Custom Methods

+(instancetype)sharedClient
{
    static NetworkClient *_sharedClient=nil;
    static dispatch_once_t onceToken;
    // making use of dispatch_once to creat singleton object
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[NetworkClient alloc]initWithBaseURL:[NSURL URLWithString:kBaseURLString]];
        
        // SSL pinning policy is set to None
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        // Repsonse Serialzer is set to JSONResponseSerializer
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    
    return _sharedClient;
}



@end
