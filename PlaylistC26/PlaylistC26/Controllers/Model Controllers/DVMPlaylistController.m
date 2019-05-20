//
//  DVMPlaylistController.m
//  PlaylistC26
//
//  Created by Eric Lanza on 5/20/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

#import "DVMPlaylistController.h"

@interface DVMPlaylistController()

@property (nonatomic, strong, readwrite) NSMutableArray* internalPlaylists;

@end

@implementation DVMPlaylistController

+ (DVMPlaylistController*)sharedController
{
    static DVMPlaylistController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [DVMPlaylistController new];
    });
    return sharedController;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalPlaylists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)playlists
{
    return self.internalPlaylists;
}

- (void)createPlaylistWithName:(NSString *)name
{
    DVMPlaylist *newPlaylist = [[DVMPlaylist alloc] initWithName:name songs:[NSMutableArray new]];
    [self.internalPlaylists addObject:newPlaylist];
}

- (void)deletePlaylist:(DVMPlaylist *)playlist
{
    [self.internalPlaylists removeObject:playlist];
}

- (void)addSongWithTitle:(NSString *)title andArtist:(NSString *)artist toPlaylist:(DVMPlaylist *)playlist
{
    DVMSong *newSong = [[DVMSong alloc] initWithTitle:title artist:artist];
    [playlist addSongsObject:newSong];
}

- (void)removeSong:(DVMSong *)song fromPlaylist:(DVMPlaylist *)playlist
{
    [playlist removeSongsObject:song];
}

@end
