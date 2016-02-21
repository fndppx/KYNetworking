//
//  KYDataCenter.m
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import "KYDataCenter.h"
#import "KYAsiNetworkHandler.h"
#import "KYNetworkManager.h"
#import "KYJSONParser.h"
@interface KYDataCenter()
@property (nonatomic, strong) KYRequestItem * requestItem;

@end

@implementation KYDataCenter
- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}


- (void)sendSuccessResponseData:(KYResponseItem *)item
{
    KYRequestItem * requestItem = item.requestItem;

    if (item.returnCode == kRequestSuccess)
    {
        if (requestItem.delegateTarget && requestItem.requestSuccessSEL)
        {
            if ([requestItem.delegateTarget respondsToSelector:requestItem.requestSuccessSEL])
            {
                [requestItem.delegateTarget performSelectorOnMainThread:requestItem.requestSuccessSEL
                                                             withObject:item
                                                          waitUntilDone:NO];
            }
        }
    }
   
}
- (void)sendFailResponseData:(KYResponseItem *)item
{
    KYRequestItem * requestItem = item.requestItem;

    if (requestItem.delegateTarget && requestItem.requestFailSEL)
    {
        if ([requestItem.delegateTarget respondsToSelector:requestItem.requestFailSEL])
        {
            [requestItem.delegateTarget performSelectorOnMainThread:requestItem.requestFailSEL
                                                   withObject:item
                                                waitUntilDone:NO];
        }
    }
}

- (int)sendRequestWithRequestItem:(KYRequestItem *)item
{

    _requestItem  = item;
    
   
      if (_requestItem.paramDict && [_requestItem.paramDict allKeys].count != 0)
    {
        _requestItem.finalRequestUrl = [NSString stringWithFormat:@"%@%@",_requestItem.requestUrl,[KYDataCenter converDictToString:item.paramDict]];
    }
    else
    {
        _requestItem.finalRequestUrl = [NSString stringWithFormat:@"%@",_requestItem.requestUrl];
    }

    //整合拼接请求url
    NSString * urlString = nil;
    if (item.needURLEncode)
    {
        urlString = [NSString stringWithFormat:@"%@",[_requestItem.finalRequestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    else
    {
        urlString = [NSString stringWithFormat:@"%@",_requestItem.finalRequestUrl];
    }
    if (_requestItem.httpMethodType==HttpMethodGet) {

        
        [KYNetworkManager getRequstWithURL:urlString params:nil target:self action:@selector(finishedRequest:didFaild:) showHUD:YES];
    }
    else if (_requestItem.httpMethodType==HttpMethodPost)
    {
        [KYNetworkManager postReqeustWithURL:urlString params:_requestItem.paramDict target:self successAction:@selector(finishedRequest:didFaild:) failedAction:@selector(failedRequest:didFaild:) showHUD:YES];

    }

    return 0;
}

- (void)finishedRequest:(id)returnData didFaild:(NSError*)error
{
    NSLog(@"-----%@",returnData);
    KYResponseItem * responseItem = [[KYResponseItem alloc] init];
    responseItem.requestItem = _requestItem;
    if ([returnData isKindOfClass:[NSArray class]])
    {
        responseItem.responseDict = [NSDictionary dictionaryWithObject:returnData
                                                                forKey:@"list"];
    }
    else if ([returnData isKindOfClass:[NSDictionary class]])
    {
        responseItem.responseDict = [NSDictionary dictionaryWithDictionary:returnData];
    }
    [self networkRequestExecuteFinishedWithItem:responseItem];
    
}
- (void)failedRequest:(id)returnData didFaild:(NSError*)error
{
    NSLog(@"-----%@",returnData);
    KYResponseItem * responseItem = [[KYResponseItem alloc] init];
    responseItem.requestItem = _requestItem;
    if ([returnData isKindOfClass:[NSArray class]])
    {
        responseItem.responseDict = [NSDictionary dictionaryWithObject:returnData
                                                                forKey:@"list"];
    }
    else if ([returnData isKindOfClass:[NSDictionary class]])
    {
        responseItem.responseDict = [NSDictionary dictionaryWithDictionary:returnData];
    }
    [self networkRequestExecuteFinishedWithItem:responseItem];
}

- (void)networkRequestExecuteFinishedWithItem:(KYResponseItem *)responseItem
{
    KYRequestItem * requestItem = responseItem.requestItem;
    
//    responseItem.errorInfo = [self parseReturnCode:responseItem.code];
    
    //解析回调处理
    if (requestItem.targetCenter && requestItem.targetCenterParser)
    {
        if ([requestItem.targetCenter respondsToSelector:requestItem.targetCenterParser])
        {
            responseItem = [requestItem.targetCenter performSelector:requestItem.targetCenterParser
                                                           withObject:responseItem];
        }
    }

    if (requestItem.targetCenter &&requestItem.parseMethod) {
        if ([requestItem.targetCenter respondsToSelector:requestItem.parseMethod]) {
                responseItem = [requestItem.targetCenter performSelector:requestItem.parseMethod
                                                                    withObject:responseItem];

        }
    }
}


- (void)requestdidFailWithError:(NSError *)error
{
    
}

+ (NSString *)converDictToString:(NSDictionary *)dict
{
    if (!dict)
    {
        return @"";
    }
    NSMutableString * converString = [NSMutableString string];
    NSArray * keyArray = [dict allKeys];
    for (id key in keyArray)
    {
        if (converString.length==0)
        {
            [converString appendFormat:@"?%@=%@",key,[dict objectForKey:key]];
        }
        else
        {
            [converString appendFormat:@"&%@=%@",key,[dict objectForKey:key]];
        }
    }
    return converString;
}

//- (BOOL)isLegalRequest:(KYRequestItem *)requestItem
//{
//    if (!requestItem)
//    {
//        //请求配置Item不合法
//        return NO;
//    }
//    else if (requestItem.requestUrl.length == 0)
//    {
//        //请求地址不合法
//        return NO;
//    }
//    else if ([self isDuplicateRequest:requestItem])
//    {
//        //重复请求
//        return NO;
//    }
//    return YES;
//}

@end
