//
//  BridgingFile.m
//  PetrolMap
//
//  Created by Liang on 9/6/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "MapManagerDelegate.h"

BMKMapManager* _mapManager;
@implementation MapManagerDelegate

-(instancetype)init{
    
    _mapManager = [[BMKMapManager alloc] init];
    BOOL ret = [_mapManager start:@"vZTqCaSktGPCsdDzOocMW0r2" generalDelegate:self];
    if (!ret) {
        _error = @"failed";
        NSLog(@"manager start failed!");
    }else{
        _error = @"succeed";
        NSLog(@"manager start succeed!");
    }
    NSLog([[NSBundle mainBundle] bundleIdentifier]);
    return self;
}

- (void)onGetNetworkState:(int)iError
{
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
    
}

- (void)onGetPermissionState:(int)iError
{
    if (0 == iError) {
        NSLog(@"授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
}

@end
