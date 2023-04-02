//
//  OCUtils.m
//  LIRouter
//
//  Created by 林文峰 on 2023/4/2.
//

#import "OCUtils.h"
#import <objc/runtime.h>
#import <dlfcn.h>
#import <mach-o/ldsyms.h>

@implementation OCUtils
+ (NSArray<NSString*> *)getAllClassName {
    unsigned int count;
    const char **classes;
    Dl_info info;

    dladdr(&_mh_execute_header, &info);
    classes = objc_copyClassNamesForImage(info.dli_fname, &count);
    
    NSMutableArray<NSString *> *names = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        NSString *name = [NSString stringWithCString:classes[i] encoding:NSUTF8StringEncoding];
        [names addObject:name];
    }
    
    return [names copy];
}
@end
