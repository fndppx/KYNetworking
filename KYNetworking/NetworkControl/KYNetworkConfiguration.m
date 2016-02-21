//
//  KYNetworkConfiguration.m
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import "KYNetworkConfiguration.h"
@interface KYNetworkConfiguration ()

@property (nonatomic, strong) NSMutableDictionary * commonRequestHeaderDict;

@end
@implementation KYNetworkConfiguration
static KYNetworkConfiguration*_shardConfiguration;
+ (KYNetworkConfiguration *)shardConfiguration{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shardConfiguration = [[KYNetworkConfiguration alloc]init];
    });
    return _shardConfiguration;
}

#pragma mark - 外部调用
- (void)configRequestHeader:(NSDictionary *)dict
{
    _commonRequestHeaderDict = nil;
    _commonRequestHeaderDict = [NSMutableDictionary dictionaryWithDictionary:dict];
}

- (NSDictionary *)requestHeader
{
    return _commonRequestHeaderDict;
}

- (void)updateHeaderValue:(NSString *)value key:(NSString *)key
{
    if (!value || !key)
    {
        return;
    }
    if (!_commonRequestHeaderDict)
    {
        _commonRequestHeaderDict = [NSMutableDictionary dictionary];
    }
    [_commonRequestHeaderDict setObject:value forKey:key];
}

- (void)removeHeaderValueWithKey:(NSString *)key
{
    if (!key)
    {
        return;
    }
    if (_commonRequestHeaderDict)
    {
        [_commonRequestHeaderDict removeObjectForKey:key];
    }
}

@end
