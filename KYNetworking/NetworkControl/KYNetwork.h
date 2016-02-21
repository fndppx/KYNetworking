//
//  KYNetwork.h
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//

#ifndef KYNetwork_h
#define KYNetwork_h
#ifdef DEBUG
#   define DTLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__);
#else
#   define DTLog(...)
#endif

#define SHOW_ALERT(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];


#import "KYAsiNetworkDefine.h"
#import "KYAsiNetworkDefine.h"
#import "KYAsiNetworkHandler.h"
#import "KYNetworkManager.h"
#import "KYAsiNetworkUrl.h"

#endif /* KYNetwork_h */
