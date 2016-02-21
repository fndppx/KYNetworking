//
//  KYJSONParser.h
//  KYNetworking
//
//  Created by keyan on 16/2/18.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYJSONParser : NSObject
+ (id)parseOpenAPIResult:(NSData *)responseData;

@end
