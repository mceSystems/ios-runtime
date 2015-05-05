//
//  main.m
//  TNSApp
//
//  Created by Panayot Cankov on 7/30/14.
//  Copyright (c) 2014 TNS. All rights reserved.
//

#include <Foundation/Foundation.h>
#include <JavaScriptCore/JavaScriptCore.h>
#include <NativeScript/NativeScript.h>

#ifdef NATIVESCRIPT_DEBUGGING
#include <TNSDebugging/TNSDebugging.h>
static id debuggingServer;
#endif

int main(int argc, char *argv[]) {
    @autoreleasepool {
        TNSRuntime *runtime = [[TNSRuntime alloc] initWithApplicationPath:[[NSBundle mainBundle] bundlePath]];
        [TNSRuntimeInspector setLogsToSystemConsole:YES];

#ifdef NATIVESCRIPT_DEBUGGING
        debuggingServer = [runtime enableDebuggingWithName:[NSBundle mainBundle].bundleIdentifier];
#endif

        [runtime executeModule:@"./"];
        return 0;
    }
}