//
//  AXMessage.h
//  MyIRC
//
//  Created by Alex Mertvetsov on 29.08.14.
//  Copyright (c) 2014 AxidSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXIRCPrefix.h"

/// Values for AXIRCCommand
typedef NS_ENUM(NSInteger, AXIRCCommand) {
// Connection Registration
        AXIRCCommandPASS = 0,
        AXIRCCommandNICK,
        AXIRCCommandUSER,
        AXIRCCommandSERVER,
        AXIRCCommandOPER,
        AXIRCCommandQUIT,
        AXIRCCommandSQUIT,
// Channel operations
        AXIRCCommandJOIN,
        AXIRCCommandPART,
        AXIRCCommandMODE,
        AXIRCCommandTOPIC,
        AXIRCCommandNAMES,
        AXIRCCommandLIST,
        AXIRCCommandINVITE,
        AXIRCCommandKICK,
// Server queries and commands
        AXIRCCommandVERSION,
        AXIRCCommandSTATS,
        AXIRCCommandLINKS,
        AXIRCCommandTIME,
        AXIRCCommandCONNECT,
        AXIRCCommandTRACE,
        AXIRCCommandADMIN,
        AXIRCCommandINFO,
// Sending messages
        AXIRCCommandPRIVMSG,
        AXIRCCommandNOTICE,
// User-based queries
        AXIRCCommandWHO,
        AXIRCCommandWHOIS,
        AXIRCCommandWHOWAS,
// Miscellaneous messages
        AXIRCCommandKILL,
        AXIRCCommandPING,
        AXIRCCommandPONG,
        AXIRCCommandERROR,
/// OPTIONAL MESSAGES
        AXIRCCommandAWAY,
        AXIRCCommandREHASH,
        AXIRCCommandRESTART,
        AXIRCCommandSUMMON,
        AXIRCCommandUSERS,
        AXIRCCommandWALLOPS,
        AXIRCCommandUSERHOST,
        AXIRCCommandISON,
        AXIRCCommandCount
};

/// COMMAND RESPONSES
extern NSInteger const AXIRC_RPL_NONE;
extern NSInteger const AXIRC_RPL_AWAY;
extern NSInteger const AXIRC_RPL_USERHOST;
extern NSInteger const AXIRC_RPL_ISON;
extern NSInteger const AXIRC_RPL_UNAWAY;
extern NSInteger const AXIRC_RPL_NOWAWAY;
extern NSInteger const AXIRC_RPL_WHOISUSER;
extern NSInteger const AXIRC_RPL_WHOISSERVER;
extern NSInteger const AXIRC_RPL_WHOISOPERATOR;
extern NSInteger const AXIRC_RPL_WHOWASUSER;
extern NSInteger const AXIRC_RPL_ENDOFWHO;
extern NSInteger const AXIRC_RPL_WHOISIDLE;
extern NSInteger const AXIRC_RPL_ENDOFWHOIS;
extern NSInteger const AXIRC_RPL_WHOISCHANNELS;
extern NSInteger const AXIRC_RPL_LISTSTART;
extern NSInteger const AXIRC_RPL_LIST;
extern NSInteger const AXIRC_RPL_LISTEND;
extern NSInteger const AXIRC_RPL_CHANNELMODEIS;
extern NSInteger const AXIRC_RPL_NOTOPIC;
extern NSInteger const AXIRC_RPL_TOPIC;
extern NSInteger const AXIRC_RPL_INVITING;
extern NSInteger const AXIRC_RPL_SUMMONING;
extern NSInteger const AXIRC_RPL_VERSION;
extern NSInteger const AXIRC_RPL_WHOREPLY;
extern NSInteger const AXIRC_RPL_NAMREPLY;
extern NSInteger const AXIRC_RPL_LINKS;
extern NSInteger const AXIRC_RPL_ENDOFLINKS;
extern NSInteger const AXIRC_RPL_ENDOFNAMES;
extern NSInteger const AXIRC_RPL_BANLIST;
extern NSInteger const AXIRC_RPL_ENDOFBANLIST;
extern NSInteger const AXIRC_RPL_ENDOFWHOWAS;
extern NSInteger const AXIRC_RPL_INFO;
extern NSInteger const AXIRC_RPL_MOTD;
extern NSInteger const AXIRC_RPL_ENDOFINFO;
extern NSInteger const AXIRC_RPL_MOTDSTART;
extern NSInteger const AXIRC_RPL_ENDOFMOTD;
extern NSInteger const AXIRC_RPL_YOUREOPER;
extern NSInteger const AXIRC_RPL_REHASHING;
extern NSInteger const AXIRC_RPL_TIME;
extern NSInteger const AXIRC_RPL_USERSSTART;
extern NSInteger const AXIRC_RPL_USERS;
extern NSInteger const AXIRC_RPL_ENDOFUSERS;
extern NSInteger const AXIRC_RPL_NOUSERS;
extern NSInteger const AXIRC_RPL_TRACELINK;
extern NSInteger const AXIRC_RPL_TRACECONNECTING;
extern NSInteger const AXIRC_RPL_TRACEHANDSHAKE;
extern NSInteger const AXIRC_RPL_TRACEUNKNOWN;
extern NSInteger const AXIRC_RPL_TRACEOPERATOR;
extern NSInteger const AXIRC_RPL_TRACEUSER;
extern NSInteger const AXIRC_RPL_TRACESERVER;
extern NSInteger const AXIRC_RPL_TRACENEWTYPE;
extern NSInteger const AXIRC_RPL_TRACELOG;
extern NSInteger const AXIRC_RPL_STATSLINKINFO;
extern NSInteger const AXIRC_RPL_STATSCOMMANDS;
extern NSInteger const AXIRC_RPL_STATSCLINE;
extern NSInteger const AXIRC_RPL_STATSNLINE;
extern NSInteger const AXIRC_RPL_STATSILINE;
extern NSInteger const AXIRC_RPL_STATSKLINE;
extern NSInteger const AXIRC_RPL_STATSYLINE;
extern NSInteger const AXIRC_RPL_ENDOFSTATS;
extern NSInteger const AXIRC_RPL_STATSLLINE;
extern NSInteger const AXIRC_RPL_STATSUPTIME;
extern NSInteger const AXIRC_RPL_STATSOLINE;
extern NSInteger const AXIRC_RPL_STATSHLINE;
extern NSInteger const AXIRC_RPL_UMODEIS;
extern NSInteger const AXIRC_RPL_LUSERCLIENT;
extern NSInteger const AXIRC_RPL_LUSEROP;
extern NSInteger const AXIRC_RPL_LUSERUNKNOWN;
extern NSInteger const AXIRC_RPL_LUSERCHANNELS;
extern NSInteger const AXIRC_RPL_LUSERME;
extern NSInteger const AXIRC_RPL_ADMINME;
extern NSInteger const AXIRC_RPL_ADMINLOC1;
extern NSInteger const AXIRC_RPL_ADMINLOC2;
extern NSInteger const AXIRC_RPL_ADMINEMAIL;

/// ERROR REPLIES
extern NSInteger const AXIRC_ERR_NOSUCHNICK;
extern NSInteger const AXIRC_ERR_NOSUCHSERVER;
extern NSInteger const AXIRC_ERR_NOSUCHCHANNEL;
extern NSInteger const AXIRC_ERR_CANNOTSENDTOCHAN;
extern NSInteger const AXIRC_ERR_TOOMANYCHANNELS;
extern NSInteger const AXIRC_ERR_WASNOSUCHNICK;
extern NSInteger const AXIRC_ERR_TOOMANYTARGETS;
extern NSInteger const AXIRC_ERR_NOORIGIN;
extern NSInteger const AXIRC_ERR_NORECIPIENT;
extern NSInteger const AXIRC_ERR_NOTEXTTOSEND;
extern NSInteger const AXIRC_ERR_NOTOPLEVEL;
extern NSInteger const AXIRC_ERR_WILDTOPLEVEL;
extern NSInteger const AXIRC_ERR_UNKNOWNCOMMAND;
extern NSInteger const AXIRC_ERR_NOMOTD;
extern NSInteger const AXIRC_ERR_NOADMININFO;
extern NSInteger const AXIRC_ERR_FILEERROR;
extern NSInteger const AXIRC_ERR_NONICKNAMEGIVEN;
extern NSInteger const AXIRC_ERR_ERRONEUSNICKNAME;
extern NSInteger const AXIRC_ERR_NICKNAMEINUSE;
extern NSInteger const AXIRC_ERR_NICKCOLLISION;
extern NSInteger const AXIRC_ERR_USERNOTINCHANNEL;
extern NSInteger const AXIRC_ERR_NOTONCHANNEL;
extern NSInteger const AXIRC_ERR_USERONCHANNEL;
extern NSInteger const AXIRC_ERR_NOLOGIN;
extern NSInteger const AXIRC_ERR_SUMMONDISABLED;
extern NSInteger const AXIRC_ERR_USERSDISABLED;
extern NSInteger const AXIRC_ERR_NOTREGISTERED;
extern NSInteger const AXIRC_ERR_NEEDMOREPARAMS;
extern NSInteger const AXIRC_ERR_ALREADYREGISTRED;
extern NSInteger const AXIRC_ERR_NOPERMFORHOST;
extern NSInteger const AXIRC_ERR_PASSWDMISMATCH;
extern NSInteger const AXIRC_ERR_YOUREBANNEDCREEP;
extern NSInteger const AXIRC_ERR_KEYSET;
extern NSInteger const AXIRC_ERR_CHANNELISFULL;
extern NSInteger const AXIRC_ERR_UNKNOWNMODE;
extern NSInteger const AXIRC_ERR_INVITEONLYCHAN;
extern NSInteger const AXIRC_ERR_BANNEDFROMCHAN;
extern NSInteger const AXIRC_ERR_BADCHANNELKEY;
extern NSInteger const AXIRC_ERR_NOPRIVILEGES;
extern NSInteger const AXIRC_ERR_CHANOPRIVSNEEDED;
extern NSInteger const AXIRC_ERR_CANTKILLSERVER;
extern NSInteger const AXIRC_ERR_NOOPERHOST;
extern NSInteger const AXIRC_ERR_UMODEUNKNOWNFLAG;
extern NSInteger const AXIRC_ERR_USERSDONTMATCH;

extern NSString *const AXIRCCommandArray[];

extern int const AXIRCMaxMessageLength;

/*
 * From RFC 1459:
 *  <message>  ::= [':' <prefix> <SPACE> ] <command> <params> <crlf>
 *  <prefix>   ::= <servername> | <nick> [ '!' <user> ] [ '@' <host> ]
 *  <command>  ::= <letter> { <letter> } | <number> <number> <number>
 *  <SPACE>    ::= ' ' { ' ' }
 *  <params>   ::= <SPACE> [ ':' <trailing> | <middle> <params> ]
 *  <middle>   ::= <Any *non-empty* sequence of octets not including SPACE
 *                 or NUL or CR or LF, the first of which may not be ':'>
 *  <trailing> ::= <Any, possibly *empty*, sequence of octets not including
 *                   NUL or CR or LF>
 */

@interface AXIRCMessage : NSObject

+ (instancetype)messageFromBytes:(const uint8_t *)messagesBuffer
                          length:(NSUInteger)len
                   usingEncoding:(NSStringEncoding)encoding;

// prefix - for client always nil;
+ (instancetype)messageWithPrefix:(AXIRCPrefix *)prefix
                          command:(NSInteger)command
                           params:(NSArray *)params;

- (const uint8_t *)bytesUsingEncoding:(NSStringEncoding)encoding;

@property (nonatomic, strong) AXIRCPrefix *prefix;
@property (nonatomic, assign) NSInteger command;
@property (nonatomic, strong) NSArray *params;

@end
