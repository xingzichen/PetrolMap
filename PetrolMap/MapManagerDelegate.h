//
//  BridgingFile.h
//  PetrolMap
//
//  Created by Liang on 9/6/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMapKit.h"

@interface MapManagerDelegate : NSObject<BMKGeneralDelegate>

@property (nonatomic,strong) NSString* error;

@end
