//
//  KYDataCenter.h
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KYResponseItem.h"
@interface KYDataCenter : NSObject
- (KYResponseItem *)parseReturnData:(KYResponseItem *)item;
#pragma mark 统一请求事件
- (int)sendRequestWithRequestItem:(KYRequestItem *)item;
#pragma mark 向上层发送返回结果
- (void)sendSuccessResponseData:(KYResponseItem *)item;
- (void)sendFailResponseData:(KYResponseItem *)item;
@end
