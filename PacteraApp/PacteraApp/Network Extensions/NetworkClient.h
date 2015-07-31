//
//  NetworkClient.h
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

/**
 
 'NetworkClient' is a subclass of 'AFHTTPRequestOperationManager' and it is starting port for Making Network calls
 SSL pinning policy for the application and the request and reposne serializer can be customized
 
 */

@interface NetworkClient : AFHTTPRequestOperationManager


/**
 
 Get the instance of the class using this function, the Pinning mode is set to None and the response serializer is JSON
 
 */

+(instancetype)sharedClient;

@end
