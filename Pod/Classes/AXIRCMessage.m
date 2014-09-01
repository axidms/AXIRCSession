//
//  AXMessage.m
//  MyIRC
//
//  Created by Alex Mertvetsov on 29.08.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import "AXIRCMessage.h"
#import "NSArray+AXIRCParseEnum.h"

NSString *const AXIRCCommandArray[] = {
    @"PASS",
    @"NICK",
    @"USER",
    @"SERVER",
    @"OPER",
    @"QUIT",
    @"SQUIT",
    @"JOIN",
    @"PART",
    @"MODE",
    @"TOPIC",
    @"NAMES",
    @"LIST",
    @"INVITE",
    @"KICK",
    @"VERSION",
    @"STATS",
    @"LINKS",
    @"TIME",
    @"CONNECT",
    @"TRACE",
    @"ADMIN",
    @"INFO",
    @"PRIVMSG",
    @"NOTICE",
    @"WHO",
    @"WHOIS",
    @"WHOWAS",
    @"KILL",
    @"PING",
    @"PONG",
    @"ERROR",
    @"AWAY",
    @"REHASH",
    @"RESTART",
    @"SUMMON",
    @"USERS",
    @"WALLOPS",
    @"USERHOST",
    @"ISON"
};

/// COMMAND RESPONSES
NSInteger const AXIRC_RPL_NONE = 300;
NSInteger const AXIRC_RPL_AWAY = 301;
NSInteger const AXIRC_RPL_USERHOST = 302;
NSInteger const AXIRC_RPL_ISON = 303;
NSInteger const AXIRC_RPL_UNAWAY = 305;
NSInteger const AXIRC_RPL_NOWAWAY = 306;
NSInteger const AXIRC_RPL_WHOISUSER = 311;
NSInteger const AXIRC_RPL_WHOISSERVER = 312;
NSInteger const AXIRC_RPL_WHOISOPERATOR = 313;
NSInteger const AXIRC_RPL_WHOWASUSER = 314;
NSInteger const AXIRC_RPL_ENDOFWHO = 315;
NSInteger const AXIRC_RPL_WHOISIDLE = 317;
NSInteger const AXIRC_RPL_ENDOFWHOIS = 318;
NSInteger const AXIRC_RPL_WHOISCHANNELS = 319;
NSInteger const AXIRC_RPL_LISTSTART = 321;
NSInteger const AXIRC_RPL_LIST = 322;
NSInteger const AXIRC_RPL_LISTEND = 323;
NSInteger const AXIRC_RPL_CHANNELMODEIS = 324;
NSInteger const AXIRC_RPL_NOTOPIC = 331;
NSInteger const AXIRC_RPL_TOPIC = 332;
NSInteger const AXIRC_RPL_INVITING = 341;
NSInteger const AXIRC_RPL_SUMMONING = 342;
NSInteger const AXIRC_RPL_VERSION = 351;
NSInteger const AXIRC_RPL_WHOREPLY = 352;
NSInteger const AXIRC_RPL_NAMREPLY = 353;
NSInteger const AXIRC_RPL_LINKS = 364;
NSInteger const AXIRC_RPL_ENDOFLINKS = 365;
NSInteger const AXIRC_RPL_ENDOFNAMES = 366;
NSInteger const AXIRC_RPL_BANLIST = 367;
NSInteger const AXIRC_RPL_ENDOFBANLIST = 368;
NSInteger const AXIRC_RPL_ENDOFWHOWAS = 369;
NSInteger const AXIRC_RPL_INFO = 371;
NSInteger const AXIRC_RPL_MOTD = 372;
NSInteger const AXIRC_RPL_ENDOFINFO = 374;
NSInteger const AXIRC_RPL_MOTDSTART = 375;
NSInteger const AXIRC_RPL_ENDOFMOTD = 376;
NSInteger const AXIRC_RPL_YOUREOPER = 381;
NSInteger const AXIRC_RPL_REHASHING = 382;
NSInteger const AXIRC_RPL_TIME = 391;
NSInteger const AXIRC_RPL_USERSSTART = 392;
NSInteger const AXIRC_RPL_USERS = 393;
NSInteger const AXIRC_RPL_ENDOFUSERS = 394;
NSInteger const AXIRC_RPL_NOUSERS = 395;
NSInteger const AXIRC_RPL_TRACELINK = 200;
NSInteger const AXIRC_RPL_TRACECONNECTING = 201;
NSInteger const AXIRC_RPL_TRACEHANDSHAKE = 202;
NSInteger const AXIRC_RPL_TRACEUNKNOWN = 203;
NSInteger const AXIRC_RPL_TRACEOPERATOR = 204;
NSInteger const AXIRC_RPL_TRACEUSER = 205;
NSInteger const AXIRC_RPL_TRACESERVER = 206;
NSInteger const AXIRC_RPL_TRACENEWTYPE = 208;
NSInteger const AXIRC_RPL_TRACELOG = 261;
NSInteger const AXIRC_RPL_STATSLINKINFO = 211;
NSInteger const AXIRC_RPL_STATSCOMMANDS = 212;
NSInteger const AXIRC_RPL_STATSCLINE = 213;
NSInteger const AXIRC_RPL_STATSNLINE = 214;
NSInteger const AXIRC_RPL_STATSILINE = 215;
NSInteger const AXIRC_RPL_STATSKLINE = 216;
NSInteger const AXIRC_RPL_STATSYLINE = 218;
NSInteger const AXIRC_RPL_ENDOFSTATS = 219;
NSInteger const AXIRC_RPL_STATSLLINE = 241;
NSInteger const AXIRC_RPL_STATSUPTIME = 242;
NSInteger const AXIRC_RPL_STATSOLINE = 243;
NSInteger const AXIRC_RPL_STATSHLINE = 244;
NSInteger const AXIRC_RPL_UMODEIS = 221;
NSInteger const AXIRC_RPL_LUSERCLIENT = 251;
NSInteger const AXIRC_RPL_LUSEROP = 252;
NSInteger const AXIRC_RPL_LUSERUNKNOWN = 253;
NSInteger const AXIRC_RPL_LUSERCHANNELS = 254;
NSInteger const AXIRC_RPL_LUSERME = 255;
NSInteger const AXIRC_RPL_ADMINME = 256;
NSInteger const AXIRC_RPL_ADMINLOC1 = 257;
NSInteger const AXIRC_RPL_ADMINLOC2 = 258;
NSInteger const AXIRC_RPL_ADMINEMAIL = 259;

/// ERROR REPLIES
NSInteger const AXIRC_ERR_NOSUCHNICK = 401;
NSInteger const AXIRC_ERR_NOSUCHSERVER = 402;
NSInteger const AXIRC_ERR_NOSUCHCHANNEL = 403;
NSInteger const AXIRC_ERR_CANNOTSENDTOCHAN = 404;
NSInteger const AXIRC_ERR_TOOMANYCHANNELS = 405;
NSInteger const AXIRC_ERR_WASNOSUCHNICK = 406;
NSInteger const AXIRC_ERR_TOOMANYTARGETS = 407;
NSInteger const AXIRC_ERR_NOORIGIN = 409;
NSInteger const AXIRC_ERR_NORECIPIENT = 411;
NSInteger const AXIRC_ERR_NOTEXTTOSEND = 412;
NSInteger const AXIRC_ERR_NOTOPLEVEL = 413;
NSInteger const AXIRC_ERR_WILDTOPLEVEL = 414;
NSInteger const AXIRC_ERR_UNKNOWNCOMMAND = 421;
NSInteger const AXIRC_ERR_NOMOTD = 422;
NSInteger const AXIRC_ERR_NOADMININFO = 423;
NSInteger const AXIRC_ERR_FILEERROR = 424;
NSInteger const AXIRC_ERR_NONICKNAMEGIVEN = 431;
NSInteger const AXIRC_ERR_ERRONEUSNICKNAME = 432;
NSInteger const AXIRC_ERR_NICKNAMEINUSE = 433;
NSInteger const AXIRC_ERR_NICKCOLLISION = 436;
NSInteger const AXIRC_ERR_USERNOTINCHANNEL = 441;
NSInteger const AXIRC_ERR_NOTONCHANNEL = 442;
NSInteger const AXIRC_ERR_USERONCHANNEL = 443;
NSInteger const AXIRC_ERR_NOLOGIN = 444;
NSInteger const AXIRC_ERR_SUMMONDISABLED = 445;
NSInteger const AXIRC_ERR_USERSDISABLED = 446;
NSInteger const AXIRC_ERR_NOTREGISTERED = 451;
NSInteger const AXIRC_ERR_NEEDMOREPARAMS = 461;
NSInteger const AXIRC_ERR_ALREADYREGISTRED = 462;
NSInteger const AXIRC_ERR_NOPERMFORHOST = 463;
NSInteger const AXIRC_ERR_PASSWDMISMATCH = 464;
NSInteger const AXIRC_ERR_YOUREBANNEDCREEP = 465;
NSInteger const AXIRC_ERR_KEYSET = 467;
NSInteger const AXIRC_ERR_CHANNELISFULL = 471;
NSInteger const AXIRC_ERR_UNKNOWNMODE = 472;
NSInteger const AXIRC_ERR_INVITEONLYCHAN = 473;
NSInteger const AXIRC_ERR_BANNEDFROMCHAN = 474;
NSInteger const AXIRC_ERR_BADCHANNELKEY = 475;
NSInteger const AXIRC_ERR_NOPRIVILEGES = 481;
NSInteger const AXIRC_ERR_CHANOPRIVSNEEDED = 482;
NSInteger const AXIRC_ERR_CANTKILLSERVER = 483;
NSInteger const AXIRC_ERR_NOOPERHOST = 491;
NSInteger const AXIRC_ERR_UMODEUNKNOWNFLAG = 501;
NSInteger const AXIRC_ERR_USERSDONTMATCH = 502;

int const AXIRCMaxMessageLength = 512;

static NSInteger const kMaxParamsAllowed = 10;

@implementation AXIRCMessage

#pragma mark - Object Lifecycle

- (id)initWithPrefix:(AXIRCPrefix *)prefix
             command:(NSInteger)command
              params:(NSArray *)params
{
    self = [super init];
    
    if (self) {
        _prefix = prefix;
        _command = command;
        _params = params;
    }
    
    return self;
}

+ (instancetype)messageWithPrefix:(AXIRCPrefix *)prefix
                          command:(NSInteger)command
                           params:(NSArray *)params
{
    return [[AXIRCMessage alloc] initWithPrefix:prefix command:command params:params];
}

+ (instancetype)messageFromBytes:(const uint8_t *)messagesBuffer
                          length:(NSUInteger)len
                   usingEncoding:(NSStringEncoding)encoding
{
    uint8_t buffer[AXIRCMaxMessageLength * 2];
    
	memcpy (buffer, messagesBuffer, len);
	buffer[len] = '\0';
    
    uint8_t *p = (uint8_t *)buffer;
    const char *nickOrServer = 0, *user = 0, *host = 0;
    const char *command = 0, *trailingParam = 0, *middleParam = 0;
    AXIRCPrefix *prefix;
    NSInteger commandKey = -1, paramNumber = 0;
    NSMutableArray *params = [NSMutableArray array];
    
    // <prefix>   ::= <servername> | <nick> [ '!' <user> ] [ '@' <host> ]
    
    if (buffer[0] == ':')
	{
		while (*p && *p != ' ') {
            if (*p == '@') {
                *p++ = '\0';
                host = (const char *)p;
            } else if (*p == '!') {
                *p++ = '\0';
                user = (const char *)p;
            } else
                p++;
        }
        
		*p++ = '\0';
		nickOrServer = (const char *)buffer + 1;
        NSString *nickOrServerString = nickOrServer != NULL ? [[NSString alloc] initWithCString:nickOrServer encoding:encoding] : nil;
        NSString *userString = user != NULL ? [[NSString alloc] initWithCString:user encoding:encoding] : nil;
        NSString *hostString = host != NULL ? [[NSString alloc] initWithCString:host encoding:encoding] : nil;
        
        prefix = [AXIRCPrefix prefixWithNickOrServer:nickOrServerString user:userString host:hostString];
	}
    
    // <command>  ::= <letter> { <letter> } | <number> <number> <number>
    
    command = (const char *)p;
    
    while (*p && *p != ' ')
        p++;
    
    *p++ = '\0';
    
    NSString *commandString = [[NSString alloc] initWithCString:command encoding:encoding];    
    commandKey = [AXIRCMessage commandByString:commandString];

    // <params>   ::= <SPACE> [ ':' <trailing> | <middle> <params> ]
    
    while (*p && paramNumber < kMaxParamsAllowed)
	{
		if ( *p == ':' )
		{
            paramNumber++;
            trailingParam = (const char *)p + 1;
            NSString *param = [[NSString alloc] initWithCString:trailingParam encoding:encoding];
			[params addObject:param];
			break;
		}
        
        middleParam = (const char *)p;
        
		for (; *p && *p != ' '; p++ )
			;
        
		paramNumber++;
        
		if (*p)
            *p++ = '\0';
        
        NSString *param = [[NSString alloc] initWithCString:middleParam encoding:encoding];
        [params addObject:param];
	}
    
    return [[AXIRCMessage alloc] initWithPrefix:prefix command:commandKey params:params];
}

#pragma mark - Public methods

- (const uint8_t *)bytesUsingEncoding:(NSStringEncoding)encoding
{    
    NSMutableString *messageString = [NSMutableString string];
    
    if (self.prefix) {
        [messageString appendString:@":"];
        [messageString appendString:self.prefix.nickOrServer];
        
        if (self.prefix.user) {
            [messageString appendString:@"!"];
            [messageString appendString:self.prefix.user];
        }
        
        if (self.prefix.host) {
            [messageString appendString:@"@"];
            [messageString appendString:self.prefix.host];
        }
    }
    
    [messageString appendString:@" "];
    
    if (self.command > AXIRCCommandCount)
        [messageString appendString:[NSString stringWithFormat:@"%li", (long)self.command]];
    else
        [messageString appendString:AXIRCCommandArray[self.command]];
    
    if (self.params && self.params.count > 0) {
        for (int i = 0; i < self.params.count; i++) {
            [messageString appendString:@" "];
            if (i == self.params.count - 1)
                [messageString appendString:@":"];
            [messageString appendString:self.params[i]];
        }
    }
    
    [messageString appendString:@"\r\n"];
    
    return (const uint8_t *)[messageString cStringUsingEncoding:encoding];
}

#pragma mark - Private methods

+ (AXIRCCommand)commandByString:(NSString *)commandString
{
    NSInteger index = [AXIRCMessage parseEnumByArray:AXIRCCommandArray count:AXIRCCommandCount stringValue:commandString andDefaultValue:-1];
    
    if (index < 0)
        return [commandString integerValue];
    else
        return index;
}

+ (NSUInteger)parseEnumByArray:(const id *)array count:(NSUInteger)count stringValue:(NSString *)value andDefaultValue:(NSUInteger)defaultValue {
    return [[NSArray arrayWithObjects:array count:count] axirc_enumFromString:value andDefault:defaultValue];
}

@end
