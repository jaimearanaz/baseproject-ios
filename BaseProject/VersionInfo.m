//
//  DWPVersionInfo.m
//  Mystilo
//
//  Created by Jaime Aranaz on 12/11/15.
//  Copyright © 2015 Corpora360. All rights reserved.
//

#import "VersionInfo.h"

#define kCopyrightName @"Jaime Aranaz"

@implementation VersionInfo

#pragma mark - Public methods

+ (NSString *)versionNumber
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)buildDate
{
    NSString *dateString = [NSString stringWithFormat:@"%@, %@",
                            [NSString stringWithUTF8String:__DATE__],
                            [NSString stringWithUTF8String:__TIME__]];
    return dateString;
}

+ (NSString *)copyright
{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    NSString *stringYear = [dateFormatter stringFromDate:date];
    
    NSString *copyright = [NSString stringWithFormat:@"Copyright © %@ %@", stringYear, kCopyrightName];

    return copyright;
}

@end
