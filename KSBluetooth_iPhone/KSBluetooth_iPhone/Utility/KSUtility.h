//
//  KSUtility.h
//  KSBluetooth_iPhone
//
//  Created by tts on 14-11-4.
//  Copyright (c) 2014年 tts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>


#define  iOS7  [[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0
#define  Screen_Width    [[UIScreen mainScreen]bounds].size.width
#define  Screen_Height   [[UIScreen mainScreen]bounds].size.height
#define  Screen_Frame    [[UIScreen mainScreen]bounds]

#define CustomLocalizedString(key, comment) \
[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]

#ifdef DEBUG
#define LogMethod						NSLog(@"%s---LineNumber:%d", __PRETTY_FUNCTION__, __LINE__);
#define LogMethodArgs(format, ... ) 	NSLog(@"%s---LineNumber:%d: %@", __PRETTY_FUNCTION__, __LINE__ , [NSString stringWithFormat:format, ##__VA_ARGS__] );
#else
#define LogMethod						{}
#define LogMethodArgs(format, ... )		{}
#endif

@interface KSUtility : NSObject


+ (const char *) CBUUIDToString:(CBUUID *)UUID;

+ (UInt16) CBUUIDToInt:(CBUUID *)UUID;

+ (NSString *)getUUID;

+ (NSString *) stringDateByFormatString:(NSString *) formatString withDate:(NSDate *)date;



@end
