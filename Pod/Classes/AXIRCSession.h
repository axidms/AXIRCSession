//
//  AXIRCSession.h
//  MyIRC
//
//  Created by Alex Mertvetsov on 30.08.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXIRCMessage.h"

@class AXIRCSession;

@protocol AXIRCSessionDelegate <NSObject>

@optional

- (void)session:(AXIRCSession *)session didConnectToServer:(NSString *)server withPort:(NSInteger)port;

- (void)session:(AXIRCSession *)session didReceiveMessages:(NSArray *)messages;

- (void)session:(AXIRCSession *)session wasDisconnectedFromServer:(NSString *)server withPort:(NSInteger)port;

@end

@interface AXIRCSession : NSObject

- (void)connectToServer:(NSString *)server withPort:(NSInteger)port;
- (void)sendMessage:(AXIRCMessage *)message;
- (void)disconnect;

@property (nonatomic, assign) id<AXIRCSessionDelegate> delegate;
@property (nonatomic, assign) NSStringEncoding encoding;

@end
