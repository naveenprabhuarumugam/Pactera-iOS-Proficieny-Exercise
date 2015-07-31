//
//  PacteraUtility.m
//  PacteraApp
//
//  Created by Naveenprabhu Arumugam on 1/08/2015.
//  Copyright (c) 2015 Naveenprabhu Arumugam. All rights reserved.
//

#import "PacteraUtility.h"

@implementation PacteraUtility

+(id)instance
{
    static dispatch_once_t onceToken;
    static id instance;
    
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}

-(BOOL)isValidString:(id)string{
    
    if ([string isKindOfClass:[NSNull class]]) {
        return NO;
    }
    else if ([string isEqualToString:@""])
    {
        return NO;
    }
    
    return YES;
}
@end
