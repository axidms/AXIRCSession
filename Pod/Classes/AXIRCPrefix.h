//
//  AXIRCPrefix.h
//  MyIRC
//
//  Created by Alex Mertvetsov on 30.08.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import <Foundation/Foundation.h>


// <prefix>   ::= <servername> | <nick> [ '!' <user> ] [ '@' <host> ]
@interface AXIRCPrefix : NSObject

+ (instancetype)prefixWithNickOrServer:(NSString *)nickOrServer
                                  user:(NSString *)user
                                  host:(NSString *)host;

@property (nonatomic, copy, readonly) NSString *nickOrServer;
@property (nonatomic, copy, readonly) NSString *user;
@property (nonatomic, copy, readonly) NSString *host;

@end
