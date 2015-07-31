//
//  ResponseObject.m
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import "ResponseObject.h"

@implementation ResponseObject


-(id)initWithTitle:(NSString *)title andDetails:(NSMutableArray *)detailsArray{
    self = [super init];
    if (!self) {
        return nil;
    }
    _title = [title retain];
    _detailsObjArray = [detailsArray retain];
    
    return self;
}


-(void)dealloc{
    [_title release];
    [_detailsObjArray release];
    [super dealloc];
}

@end
