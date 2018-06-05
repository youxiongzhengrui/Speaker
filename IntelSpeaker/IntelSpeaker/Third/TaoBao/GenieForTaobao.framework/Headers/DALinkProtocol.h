//
//  DALinkProtocol.h
//  Coin
//
//  Created by yaowan on 16/9/19.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DALinkProtocol <NSObject>

@required

- (void)linkWithSSID:(NSString *)ssid password:(NSString *)password userId:(NSString *)userId token:(NSString *)token;

- (void)stopLink;

- (BOOL)isLinking;

@end
