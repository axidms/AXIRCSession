//
//  NSArray+AXIRCParseEnum.m
//  MyIRC
//
//  Created by Alex Mertvetsov on 29.08.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import "NSArray+AXIRCParseEnum.h"

@implementation NSArray (AXIRCParseEnum)

- (NSString *)axirc_stringWithEnum:(NSInteger)enumValue
{
    return [self objectAtIndex:(NSUInteger)enumValue];
}

- (NSInteger)axirc_enumFromString:(NSString *)strValue andDefault:(NSInteger)def
{
    NSInteger n = [self indexOfObject:strValue];
    if (n == NSNotFound) n = def;
    return n;
}

- (NSInteger)axirc_enumFromString:(NSString *)strValue
{
    return [self axirc_enumFromString:strValue andDefault:0];
}

@end
