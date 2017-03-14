//
//  DWPVersionInfo.h
//  Mystilo
//
//  Created by Jaime Aranaz on 12/11/15.
//  Copyright © 2015 Jaime Aranaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VersionInfo : NSObject

+ (NSString *)versionNumber;

+ (NSString *)buildDate;

+ (NSString *)copyright;

@end
