//
//  KYJSONParser.m
//  KYNetworking
//
//  Created by keyan on 16/2/18.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import "KYJSONParser.h"

@implementation KYJSONParser
+ (id)parseOpenAPIResult:(NSData *)responseData
{
    if(responseData == nil)
        return nil;
    
    id resultDict = nil;
    NSError * error = nil;
    NSData *finalData = nil;
    
    @autoreleasepool {
        NSString *filteredStr = nil;
        NSString *str = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        if (str && ![str isKindOfClass:[NSNull class]])
        {
            filteredStr = [self removeUnescapedCharacter:str];
            finalData = [filteredStr dataUsingEncoding:NSUTF8StringEncoding];
        }
        else
        {
            finalData = nil;
        }
    }
    if (!finalData)
    {
        return nil;
    }
    resultDict = [NSJSONSerialization JSONObjectWithData:finalData options:0 error:&error];
    //    NSLog(@"Json解析Error:%@",error.userInfo);
    return resultDict;
}

+ (NSString *)jsonString:(NSData *)responseData
{
    NSString *filteredStr = nil;
    @autoreleasepool {
        NSString *str = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        if (str && ![str isKindOfClass:[NSNull class]])
        {
            filteredStr = [self removeUnescapedCharacter:str];
        }
    }
    return filteredStr;
}

+ (NSString *)removeUnescapedCharacter:(NSString *)inputStr
{
    NSCharacterSet *controlChars = [NSCharacterSet controlCharacterSet];
    NSRange range = [inputStr rangeOfCharacterFromSet:controlChars];
    if (range.location != NSNotFound)
    {
        NSMutableString *mutable = [NSMutableString stringWithString:inputStr];
        while (range.location != NSNotFound)
        {
            [mutable deleteCharactersInRange:range];
            range = [mutable rangeOfCharacterFromSet:controlChars];
        }
        return mutable;
    }
    return inputStr;
}

+ (NSString*)jsonStringFromObj:(id)object
{
    if (!object) {
        return nil;
    }
    
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}
@end
