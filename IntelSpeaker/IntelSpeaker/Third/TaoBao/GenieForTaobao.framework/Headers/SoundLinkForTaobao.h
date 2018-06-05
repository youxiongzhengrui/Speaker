//
//  DALinkSoundConfig.h
//  Coin
//
//  Created by yaowan on 16/9/19.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "DALinkProtocol.h"

@interface SoundLinkForTaobao : NSObject<DALinkProtocol>

+ (SoundLinkForTaobao *)sharedInstance;

@end
