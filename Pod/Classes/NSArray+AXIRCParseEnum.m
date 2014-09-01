//
//  NSArray+AXIRCParseEnum.m
//  MyIRC
//
//  Created by Alex Mertvetsov on 29.08.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import "NSArray+AXIRCParseEnum.h"

@implementation NSArray (AXIRCParseEnum)

- (NSString *)axirc_stringWithEnum:(NSUInteger)enumValue {
    return [self objectAtIndex:enumValue];
}

- (NSUInteger)axirc_enumFromString:(NSString *)strValue andDefault:(NSUInteger)def {
    NSUInteger n = [self indexOfObject:strValue];
    if (n == NSNotFound) n = def;
    return n;
}

- (NSUInteger)axirc_enumFromString:(NSString *)strValue {
    return [self axirc_enumFromString:strValue andDefault:0];
}

@end
