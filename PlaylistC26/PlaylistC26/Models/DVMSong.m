//
//  DVMSong.m
//  PlaylistC26
//
//  Created by Eric Lanza on 5/20/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

#import "DVMSong.h"

@implementation DVMSong

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist
{
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
    }
    return self;
}

@end
