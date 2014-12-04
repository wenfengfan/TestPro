//
//  KSUtility.m
//  KSBluetooth_iPhone
//
//  Created by tts on 14-11-4.
//  Copyright (c) 2014年 tts. All rights reserved.
//

#import "KSUtility.h"

@implementation KSUtility



/**
 * 转成C 字符串
 */
+ (const char *) CBUUIDToString:(CBUUID *)UUID
{
    return [[UUID.data description] cStringUsingEncoding:NSStringEncodingConversionAllowLossy];
}


+ (UInt16) CBUUIDToInt:(CBUUID *)UUID
{
    char b1[16];
    [UUID.data getBytes:b1];
    return ((b1[0] << 8) | b1[1]);
}

+ (NSString *)getUUID
{
    
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    
    
    CFRelease(uuid_ref);
    
    NSString *uuid = [NSString stringWithString:(NSString*)uuid_string_ref];
    
    
    CFRelease(uuid_string_ref);
    
    return uuid;
    
}


//根据指定时间的字符串格式和时间 格式例如yyyy-MM-dd HH:mm:ss:SSS
+ (NSString *) stringDateByFormatString:(NSString *) formatString withDate:(NSDate *)date
{
	if (date == nil) {
		return @"";
	}
    NSDateFormatter * dateFromatter=[[NSDateFormatter alloc] init];
    //[dateFromatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFromatter setTimeStyle:NSDateFormatterLongStyle];
    if(formatString!=nil)
    {
        [dateFromatter setDateFormat:formatString];
    }
    NSString * strDate=[dateFromatter stringFromDate:date];
    [dateFromatter release];
    return strDate;
}

@end
