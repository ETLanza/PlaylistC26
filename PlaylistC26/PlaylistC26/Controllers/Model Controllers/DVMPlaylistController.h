//
//  DVMPlaylistController.h
//  PlaylistC26
//
//  Created by Eric Lanza on 5/20/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMPlaylist.h"
#import "DVMSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface DVMPlaylistController : NSObject

@property (nonatomic, strong, readonly) NSArray* playlists;

+ (DVMPlaylistController *) sharedController;

//Create
- (void) createPlaylistWithName:(NSString*)name;

//Delete
- (void) deletePlaylist:(DVMPlaylist*)playlist;

//Add song to a playlist
- (void) addSongWithTitle:(NSString*)title andArtist:(NSString*)artist toPlaylist:(DVMPlaylist*)playlist;

//Remove song from playlist
- (void) removeSong:(DVMSong*)song fromPlaylist:(DVMPlaylist*)playlist;

@end

NS_ASSUME_NONNULL_END
