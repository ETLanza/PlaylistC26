//
//  DVMSong.h
//  PlaylistC26
//
//  Created by Eric Lanza on 5/20/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMSong : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* artist;

// init(title: String, artist: String)
- (instancetype) initWithTitle:(NSString*)title artist:(NSString*)artist;

@end

NS_ASSUME_NONNULL_END
