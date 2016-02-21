//
//  KYAsiNetworkDelegate.h
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "KYAsiNetworkItem.h"
@class KYAsiNetworkItem;
/**
 *   AFN 请求封装的代理协议
 */
@protocol KYAsiNetworkDelegate <NSObject>

@optional
/**
 *   请求结束
 *
 *   @param returnData 返回的数据
 */
- (void)requestDidFinishLoading:(NSDictionary*)returnData;
/**
 *   请求失败
 *
 *   @param error 失败的 error
 */
- (void)requestdidFailWithError:(NSError*)error;

- (void)netWorkWillDealloc:(KYAsiNetworkItem*)itme;

@end
