//
//  NSArray+AXIRCParseEnum.h
//  MyIRC
//
//  Created by Alex Mertvetsov on 29.08.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (AXIRCParseEnum)

- (NSString *)axirc_stringWithEnum:(NSUInteger)enumValue;

- (NSUInteger)axirc_enumFromString:(NSString *)strValue andDefault:(NSUInteger)def;

- (NSUInteger)axirc_enumFromString:(NSString *)strValue;

@end
