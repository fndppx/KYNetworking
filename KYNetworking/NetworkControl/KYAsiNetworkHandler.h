//
//  KYAsiNetworkHandler.h
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KYAsiNetworkItem.h"
#import "KYAsiNetworkDefine.h"
@class MHAsiNetworkItem;
/**
 *  网络请求Handler类
 */

@interface KYAsiNetworkHandler : NSObject
/**
 *  单例
 *
 *  @return BMNetworkHandler的单例对象
 */
+ (KYAsiNetworkHandler *)sharedInstance;

/**
 *  items
 */
@property(nonatomic,strong)NSMutableArray *items;

/**
 *   单个网络请求项
 */
@property(nonatomic,strong)KYAsiNetworkItem *netWorkItem;

/**
 *  networkError
 */
@property(nonatomic,assign)BOOL networkError;

#pragma mark - 创建一个网络请求项
/**
 *  创建一个网络请求项
 *
 *  @param url          网络请求URL
 *  @param networkType  网络请求方式
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param showHUD      是否显示HUD
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return 根据网络请求的委托delegate而生成的唯一标示
 */
- (KYAsiNetworkItem*)conURL:(NSString *)url
                networkType:(KYAsiNetWorkType)networkType
                     params:(NSMutableDictionary *)params
                   delegate:(id)delegate
                    showHUD:(BOOL)showHUD
                     target:(id)target
              successAction:(SEL)successAction
               failedAction:(SEL)failedAction
               successBlock:(KYAsiSuccessBlock)successBlock
               failureBlock:(KYAsiFailureBlock)failureBlock;
/**
 *   监听网络状态的变化
 */
+ (void)startMonitoring;
/**
 *   取消所有正在执行的网络请求项
 */
+ (void)cancelAllNetItems;

@end
