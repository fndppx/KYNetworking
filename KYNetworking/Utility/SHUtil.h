//
//  SHUtil.h
//  Utility
//
//  Created by Tiger Xia on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHUtil+Macro.h"
//#import "constants.h"
#import "NSObjectAdditions.h"
#import "UIApplicationAdditions.h"
#import "UIViewAdditions.h"
#import "UIDeviceAdditions.h"
#import "NSStringExtend.h"
#import "NSStringExtention.h"
#import "GrowlView.h"

/**
 * @return screen bounds.           //@Tiger
 */
CGRect ScreenBounds(void);

NSString* PathForBundleResource(NSString* fileName);
UIImage* ImageWithResourceName(NSString* fileName);
void SHAlert(NSString * format, ...);
void SHDebugGrowl(NSString* format, ...);

@interface SHUtil : NSObject

@end
