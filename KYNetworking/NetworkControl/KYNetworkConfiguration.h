//
//  KYNetworkConfiguration.h
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYNetworkConfiguration : NSObject
+ (KYNetworkConfiguration *)shardConfiguration;



/**
 *  @author CC
 *
 *  设置HTTP请求的Header
 *
 *  @param dict 自定义请求Header的Dict
 */
- (void)configRequestHeader:(NSDictionary *)dict;

/**
 *  @author CC
 *
 *  获取当前设置的请求Header
 *
 *  @return 当前设置的请求Header字典
 */
- (NSDictionary *)requestHeader;

/**
 *  @author CC
 *
 *  更新请求Header的参数数据
 *
 *  @param value 参数值
 *  @param key   参数名称
 */
- (void)updateHeaderValue:(NSString *)value key:(NSString *)key;

/**
 *  @author CC
 *
 *  移除当前请求Header的某项参数设置
 *
 *  @param key 参数名称
 */
- (void)removeHeaderValueWithKey:(NSString *)key;
@end
