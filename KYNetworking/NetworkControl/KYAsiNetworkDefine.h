//
//  KYAsiNetworkDefine.h
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//

#ifndef KYAsiNetworkDefine_h
#define KYAsiNetworkDefine_h

/**
 *  请求类型
 */
typedef enum {
    KYAsiNetWorkGET = 1,   /**< GET请求 */
    KYAsiNetWorkPOST       /**< POST请求 */
} KYAsiNetWorkType;

/**
 *  网络请求超时的时间
 */
#define MHAsi_API_TIME_OUT 20


#if NS_BLOCKS_AVAILABLE
/**
 *  请求开始的回调（下载时用到）
 */
typedef void (^KYAsiStartBlock)(void);

/**
 *  请求成功回调
 *
 *  @param returnData 回调block
 */
typedef void (^KYAsiSuccessBlock)(id returnData,int code,NSString *msg);

/**
 *  请求失败回调
 *
 *  @param error 回调block
 */
typedef void (^KYAsiFailureBlock)(NSError *error);
#endif 
#endif /* KYAsiNetworkDefine_h */
