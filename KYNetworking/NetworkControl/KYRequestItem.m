//
//  KYRequestItem.m
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import "KYRequestItem.h"
#import "KYNetworkConfiguration.h"
@implementation KYRequestItem
- (id)init
{
    self = [super init];
    if (self) {
//        _requestTimeout = kLCRequestTimeout;
//        _httpMethodType = LCHTTPRequestGet;
        _requestHeader = [NSDictionary dictionaryWithDictionary:[[KYNetworkConfiguration shardConfiguration] requestHeader]];
    }
    return self;
}

@end
