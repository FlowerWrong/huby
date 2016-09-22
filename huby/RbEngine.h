//
//  RbEngine.h
//  huby
//
//  Created by king Yang on 16/9/22.
//  Copyright © 2016年 king Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "mruby.h"
#include "mruby/compile.h"

@interface RbEngine : NSObject

@property (nonatomic, assign) mrb_state *mrb;

+ (id)sharedManager;

- (void)execFileScript:(NSString *)script;
- (void)execStringScript:(NSString *)script;

@end
