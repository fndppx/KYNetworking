//
//  SHUtil.m
//  Utility
//
//  Created by Tiger Xia on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SHUtil.h"


/*
 改造该方法的实现：
 1. 加入stateBar的高度的影响
 2. window的frame是否已可以完成该功能的实现
 */
CGRect ScreenBounds(void) {
    //默认是iphone&&横屏下的尺寸
    CGRect bounds = CGRectMake(0, 0, 480, 320);
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        bounds = CGRectMake(0, 0, 1024, 768);
    }
    UIInterfaceOrientation curOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsPortrait(curOrientation)) {
        bounds = CGRectMake(0, 0, bounds.size.height, bounds.size.width);
    }
    return bounds;
}

NSString* PathForBundleResource(NSString* fileName) {
    NSString* path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    return path;
}

UIImage* ImageWithResourceName(NSString* fileName) {
    UIImage* img = nil;
    NSString* path = PathForBundleResource(fileName);
    if (path) {
        img = [UIImage imageWithContentsOfFile:path];
    }
    return img;
}

void SHAlert(NSString * format, ...) {
#ifdef DEBUG
	va_list arglist;
	if (!format) return;
	va_start(arglist, format);
	NSString* message = [[NSString alloc] initWithFormat:format arguments:arglist];
	va_end(arglist);
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"调试信息" 
						  message:message
						  delegate:nil 
						  cancelButtonTitle:@"OK" 
						  otherButtonTitles:nil];
	[alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:[NSThread isMainThread]];
	[alert release];
    [message release];
#endif
}

void SHDebugGrowl(NSString* format, ...) {
#ifdef DEBUG
	va_list arglist;
	if (!format) return;
	va_start(arglist, format);
	NSString* message = [[NSString alloc] initWithFormat:format arguments:arglist];
	va_end(arglist);
    [GrowlView showMessage:[NSString stringWithFormat:@"调试信息  -- %@ --", message]
                   details:nil
                customView:nil
                    offset:CGPointZero
                  duration:5
                  animated:YES];
    [message release];
#endif
}

@implementation SHUtil

@end
