//
//  NetworkBase.m
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import "NetworkBase.h"
#import "NetworkClient.h"
#import "Details.h"
#import "PacteraConstants.h"
#import "ResponseObject.h"


@implementation NetworkBase


#pragma mark -
#pragma mark Custom Methods

-(void)fetchDetailsWithBlock:(void (^)(ResponseObject* responseObj, NSError * error))block{
    
    
    // Get Call with URI is passed to the Networkclient
    [[NetworkClient sharedClient] GET:@"u/746330/facts.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // Success Response
        
        // Get the values of the title and details from the response
        NSString *title = [responseObject valueForKeyPath:TITLENAME];
        NSArray *detailsReponseArray = [responseObject valueForKeyPath:ROWS];
        
        NSMutableArray *detailsObjArray=[[NSMutableArray alloc]initWithCapacity:[detailsReponseArray count]];
        
        // Enumerate the 'detailsResponseArray' to iterate among the details objects
        [detailsReponseArray enumerateObjectsUsingBlock:^(NSDictionary *responseDict, NSUInteger idx, BOOL *stop) {
            Details *detailObj = [[Details alloc]init];
            
            // Check for NULL parameter and add them to the array
            if ([detailObj conformsToValues:responseDict]) {
                [detailsObjArray addObject:detailObj];
            }
            
            // Relase teh detailObj object
            [detailObj release];
        }];
        
        //Instantiate the responseobject with title and details object array
        ResponseObject * responseObj =[[[ResponseObject alloc]initWithTitle:title andDetails:detailsObjArray] autorelease];
        [detailsObjArray release];
        
        if (block) { // Check the presence of block, If block is present
            
            // The Repsonse Object is returend back and the weeroe as nil
            block(responseObj,nil);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Failure response
        
        if (block) { // Check the presence of block, If block is present
            
            // The error message is sent back
            block(nil,error);
        }
        
    }];
    
}
@end
