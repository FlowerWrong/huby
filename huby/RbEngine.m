//
//  RbEngine.m
//  huby
//
//  Created by king Yang on 16/9/22.
//  Copyright © 2016年 king Yang. All rights reserved.
//

#import "RbEngine.h"

@implementation RbEngine

+ (id)sharedManager {
    static RbEngine *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        _mrb = mrb_open();
    }
    return self;
}

- (void)dealloc {
    NSLog(@"mruby instance will be closed");
    mrb_close(_mrb);
}

- (void)execFileScript:(NSString *)script {
    FILE *f = fopen([script UTF8String], "r");
    mrb_load_file(_mrb, f);
}

- (void)execStringScript:(NSString *)script {
    mrb_load_string(_mrb, [script UTF8String]);
}

@end
