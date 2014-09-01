//
//  AXIRCSession.m
//  MyIRC
//
//  Created by Alex Mertvetsov on 30.08.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import "AXIRCSession.h"

static int AXIRCFindMessageSeparator(const uint8_t * buf, int length)
{
	for (int offset = 0; offset < length; offset++)
	{
		if (buf[offset] == 0x0D && offset < length - 1 && buf[offset+1] == 0x0A)
			return offset + 2;
	}
    
	return length;
}

@interface AXIRCSession () <NSStreamDelegate> {
    NSInputStream *_inputStream;
    NSOutputStream *_outputStream;
    NSRecursiveLock *_lock;
}

@property (nonatomic, copy) NSString *server;
@property (nonatomic, assign) NSInteger port;

@end

@implementation AXIRCSession

- (id)init
{
    self = [super init];
    
    if (self) {
        _lock = [[NSRecursiveLock alloc] init];
        _encoding = NSASCIIStringEncoding;
    }
    
    return self;
}

- (void)connectToServer:(NSString *)server withPort:(NSInteger)port
{
    self.server = server;
    self.port = port;
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)server, (UInt32)port, &readStream, &writeStream);
    _inputStream = (__bridge NSInputStream *)readStream;
    _outputStream = (__bridge NSOutputStream *)writeStream;
    _inputStream.delegate = self;
    _outputStream.delegate = self;
    [_inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [_outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [_inputStream open];
    [_outputStream open];
}

- (void)sendMessage:(AXIRCMessage *)message
{
    [_lock lock];
    const uint8_t *messageStr = [message bytesUsingEncoding:self.encoding];    
    [_outputStream write:messageStr maxLength:strlen((const char *)messageStr)];
    [_lock unlock];
}

- (void)disconnect
{
    [_inputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    _inputStream.delegate = nil;
    [_inputStream close];
    _inputStream = nil;
    
    [_outputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    _outputStream.delegate = nil;
    [_outputStream close];
    _outputStream = nil;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(session:wasDisconnectedFromServer:withPort:)]) {
        [self.delegate session:self wasDisconnectedFromServer:self.server withPort:self.port];
    }
}

- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent
{
//    switch (streamEvent) {
//		case NSStreamEventOpenCompleted:
//			NSLog(@"Stream opened");
//			break;
//            
//		case NSStreamEventHasBytesAvailable: {
//            if (theStream != _inputStream)
//                return;
//            
//            uint8_t buffer[AXIRCMaxMessageLength * 2];
//            NSMutableArray *messages = [NSMutableArray array];
//            
//            while ([_inputStream hasBytesAvailable]) {
//                int length = (int)[_inputStream read:buffer maxLength:sizeof(buffer)];
//                int offset = 0;
//                
//                do {
//                    memmove (buffer, buffer + offset, length - offset);
//                    length -= offset;
//                    offset = AXIRCFindMessageSeparator(buffer, length);
//                    AXIRCMessage *message = [AXIRCMessage messageFromBytes:buffer length:offset - 2 usingEncoding:self.encoding];
//                    [messages addObject:message];
//                    
//                    if (message.command == 1 || message.command == AXIRC_RPL_ENDOFMOTD || message.command == AXIRC_ERR_NOMOTD) {
//                        if (self.delegate && [self.delegate respondsToSelector:@selector(session:didConnectToServer:withPort:)]) {
//                            [self.delegate session:self didConnectToServer:self.server withPort:self.port];
//                        }
//                    }
//                    
//                } while (length != offset);
//            }
//            
//            if (self.delegate && [self.delegate respondsToSelector:@selector(session:didReceiveMessages:)]) {
//                [self.delegate session:self didReceiveMessages:messages];
//            }
//            
//            break;
//        }
//        
//        case NSStreamEventEndEncountered:
//            [self disconnect];
//			break;
//            
//		default:
//			break;
//	}
//    
//
    
    if (streamEvent & NSStreamEventHasBytesAvailable) {
        
        if (theStream != _inputStream)
            return;
        
        uint8_t buffer[AXIRCMaxMessageLength * 2];
        NSMutableArray *messages = [NSMutableArray array];
        
        while ([_inputStream hasBytesAvailable]) {
            int length = (int)[_inputStream read:buffer maxLength:sizeof(buffer)];
            int offset = 0;

            do {
                memmove (buffer, buffer + offset, length - offset);
                length -= offset;
                offset = AXIRCFindMessageSeparator(buffer, length);
                AXIRCMessage *message = [AXIRCMessage messageFromBytes:buffer length:offset usingEncoding:self.encoding];
                [messages addObject:message];
                
                if (message.command == 1 || message.command == AXIRC_RPL_ENDOFMOTD || message.command == AXIRC_ERR_NOMOTD) {
                    if (self.delegate && [self.delegate respondsToSelector:@selector(session:didConnectToServer:withPort:)]) {
                        [self.delegate session:self didConnectToServer:self.server withPort:self.port];
                    }
                }
                
            } while (length != offset);
        }
       
        if (self.delegate && [self.delegate respondsToSelector:@selector(session:didReceiveMessages:)]) {
            [self.delegate session:self didReceiveMessages:messages];
        }
    } else if (streamEvent & NSStreamEventEndEncountered) {
        [self disconnect];
    }
}

@end
