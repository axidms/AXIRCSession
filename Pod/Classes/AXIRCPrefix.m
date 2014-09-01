//
//  AXIRCPrefix.m
//  MyIRC
//
//  Created by Alex Mertvetsov on 30.08.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import "AXIRCPrefix.h"

@implementation AXIRCPrefix

- (id)initWithNickOrServer:(NSString *)nickOrServer
                      user:(NSString *)user
                      host:(NSString *)host
{
    self = [super init];
    
    if (self) {
        _nickOrServer = [nickOrServer copy];
        _user = [user copy];
        _host = [host copy];
    }
    
    return self;
}

+ (instancetype)prefixWithNickOrServer:(NSString *)nickOrServer
                                  user:(NSString *)user
                                  host:(NSString *)host
{
    return [[AXIRCPrefix alloc] initWithNickOrServer:nickOrServer user:user host:host];
}

@end
