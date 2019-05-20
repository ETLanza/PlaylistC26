//
//  DVMPlaylist.h
//  PlaylistC26
//
//  Created by Eric Lanza on 5/20/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DVMSong;

NS_ASSUME_NONNULL_BEGIN

@interface DVMPlaylist : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, strong, readonly) NSArray* songs;

- (instancetype) initWithName:(NSString*)name songs:(NSArray*)songs;

- (void) addSongsObject:(DVMSong *)object;
- (void) removeSongsObject:(DVMSong *)object;

@end

NS_ASSUME_NONNULL_END
