//
//  NSArray+AXIRCParseEnum.h
//  MyIRC
//
//  Created by Alex Mertvetsov on 29.08.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (AXIRCParseEnum)

- (NSString *)axirc_stringWithEnum:(NSInteger)enumValue;

- (NSInteger)axirc_enumFromString:(NSString *)strValue andDefault:(NSInteger)def;

- (NSInteger)axirc_enumFromString:(NSString *)strValue;

@end
