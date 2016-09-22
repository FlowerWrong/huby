//
//  AppDelegate.m
//  huby
//
//  Created by king Yang on 16/9/22.
//  Copyright © 2016年 king Yang. All rights reserved.
//

#import "AppDelegate.h"
#import "RbEngine.h"
#import <objc/runtime.h>

#import "RbEngine.h"
#include <stdlib.h>
#include <stdio.h>

// https://developer.apple.com/reference/objectivec/1657527-objective_c_runtime
// https://github.com/mruby/mruby/blob/master/src/class.c#L437
// https://github.com/skandhas/mruby-core-ext/blob/master/src/core_ext_hash.c
static mrb_value my_c_method(mrb_state *mrb, mrb_value self)
{
    puts("Called my C method");
    char *class_name;
    // Extract a value
    mrb_get_args(mrb, "z", &class_name);
    NSLog(@"class_name is %s", class_name);
    Class theClass = NSClassFromString(@"NSAlert");
    id alert = [[theClass alloc] init];
    // NSAlert *alert = [NSAlert new];
    [alert addButtonWithTitle:@"确定"];
    [alert addButtonWithTitle:@"取消"];
    [alert setMessageText:@"确定删除输入文本?"];
    [alert setInformativeText:@"如果确定删除，删除的文本不能再找回!"];
    [alert setAlertStyle:NSWarningAlertStyle];
    [alert runModal];
    
    return mrb_nil_value();
}


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    RbEngine *rbEngine = [RbEngine sharedManager];
    mrb_state *mrb = [rbEngine mrb];
    if (!mrb) { /* handle error */ }
    [rbEngine execStringScript:@"puts 'hello world form mrb_load_string'"];
    
    struct RClass *mymodule = mrb_define_module(mrb, "MyModule");
    mrb_define_class_method(mrb, mymodule, "my_c_method", my_c_method, MRB_ARGS_NONE());
    NSString *homeDir = NSHomeDirectory();
    NSString *rbpath = [homeDir stringByAppendingPathComponent:@"demo.rb"];
    NSLog(@"rb path is %@", rbpath);
    [rbEngine execFileScript:rbpath];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
