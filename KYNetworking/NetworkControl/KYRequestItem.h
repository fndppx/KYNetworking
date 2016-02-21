//
//  KYRequestItem.h
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//
#define kLCRequestTimeout           10
#import <Foundation/Foundation.h>
#import "StaticValues.h"
@interface KYRequestItem : NSObject
@property (nonatomic,assign) BOOL getDataFromCache;                    // 是否需要从缓存中读取数据
@property (nonatomic,assign) BOOL isCancelled;                         //取消该请求
@property (nonatomic,assign) BOOL isReadingCache;                      //本次是否是读取缓存数据
@property (nonatomic,assign) BOOL needsCacheResponse;                  // 是否需要缓存数据
@property (nonatomic,assign) BOOL needsResponse;                       // 是否需要回调
@property (nonatomic,assign) HttpMethodType httpMethodType;            //请求方式get,post
@property (nonatomic,assign) NSInteger requestId;
@property (nonatomic,assign) RequestProcess requestState;
@property (nonatomic,assign) SEL mainParserMethod;                     //公共解析方法
@property (nonatomic,assign) SEL parseMethod;
@property (nonatomic,assign) SEL requestFailSEL;
@property (nonatomic,assign) SEL requestSuccessSEL;
@property (nonatomic,assign) SEL targetCenterParser;                   //对返回数据做解析的方法名称
@property (nonatomic,assign) int cacheSecond;                          // 缓存的时间
@property (nonatomic,assign) int maxTimeOut;
@property (nonatomic,assign) int page;
@property (nonatomic,assign) int totalCount;
@property (nonatomic,assign) int totalPage;
@property (nonatomic,strong) NSData * postFileData;
@property (nonatomic,strong) NSDictionary * requestHeader;
@property (nonatomic,strong) NSDictionary *userInfoDict;
@property (nonatomic,strong) NSMutableDictionary * paramDict;
@property (nonatomic,strong) NSMutableDictionary * postParamDict;
@property (nonatomic,strong) NSString * finalRequestUrl;
@property (nonatomic,strong) NSString * postFileKey;
@property (nonatomic,strong) NSString * postFilePath;
@property (nonatomic,strong) NSString * requestUrl;
@property (nonatomic,weak)   id delegateTarget;
@property (nonatomic,weak)   id targetCenter;
@property (nonatomic,assign) BOOL enableSSL; //是否使用加密套接字协议层传输,默认NO
@property (nonatomic,assign) BOOL needURLEncode;
/*
 初始化方法
 */
- (id)initWithRequestUrl:(NSString *)url getParamDict:(NSDictionary *)dict target:(id)target successSEL:(SEL)successSEL failSEL:(SEL)failSEL;//get
- (id)initWithRequestUrl:(NSString *)url postParamDict:(NSDictionary *)dict target:(id)target successSEL:(SEL)successSEL failSEL:(SEL)failSEL;//post

/*
 设置POST参数属性
 */
- (void)setPOSTAttributesOfFileData:(NSData *)fileData postFileKey:(NSString *)key;
- (void)setPOSTAttributesOfFilePath:(NSString *)filePath postFileKey:(NSString *)key;

/*
 设置缓存策略
 */
- (void)setCurrentCachePolicy:(kRequestCachePolicy)cachePolicy;

/*
 设置HTTP请求头部参数
 */
- (void)setCurrentRequestHeader:(NSDictionary *)headerDict;
- (NSDictionary *)currentRequestHeader;

/*
 设置响应请求结束回调解析的Target和方法
 */
- (void)setCenterTarget:(id)target parseSEL:(SEL)parseSEL;



@end
