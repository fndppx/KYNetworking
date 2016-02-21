//
//  KYResponseItem.h
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StaticValues.h"
#import "KYRequestItem.h"
@interface KYResponseItem : NSObject
@property(nonatomic,strong)NSString * oriResponseString;
@property(nonatomic,strong)NSDictionary * responseDict;
@property(nonatomic,strong)KYRequestItem * requestItem;
@property(nonatomic,strong)NSMutableArray * returnDataArray;
@property(nonatomic,assign)kReturnCode returnCode;
@property(nonatomic,strong)NSString * httpMessage;
@property(nonatomic,strong)NSString * debugMessage;
@property(nonatomic,strong)NSString * alertMessage;
@property(nonatomic,assign)BOOL hasUpdate;//数据是否更新，根据http304判断
@property(nonatomic,assign)NSInteger state;//移动代理返回的状态码



+ (KYResponseItem * )responseItemWithRequestItem:(KYResponseItem *)requestItem
                                    returnCode:(kReturnCode)returnCode
                              responseJSONData:(NSData *)jsonData;
////获取一个简洁的ResponseItem，提供给上层使用
//+ (ResponseItem *)simpleResponseItemWithResponseItemData:(ResponseItem *)responseItem;

@end
