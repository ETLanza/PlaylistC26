//
//  DVMPlaylist.m
//  PlaylistC26
//
//  Created by Eric Lanza on 5/20/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

#import "DVMPlaylist.h"

@interface DVMPlaylist()

@property (nonatomic, strong) NSMutableArray* internalSongs;

@end

@implementation DVMPlaylist

- (instancetype) initWithName:(NSString *)name songs:(NSArray *)songs
{
    self = [super init];
    if (self) {
        _name = name;
        _internalSongs = [songs mutableCopy];
    }
    return self;
}

// MARK: - Methods
#pragma mark - Methods
- (void) addSongsObject:(DVMSong *)object
{
    [self.internalSongs addObject:object];
}

- (void) removeSongsObject:(DVMSong *)object
{
    [self.internalSongs removeObject:object];
}

- (NSArray *) songs
{
    return self.internalSongs;
}

// let newPlayist =  DVMPlaylist(name: "Betterest", songs: [Song1, Song2, Song3])
// newPlaylist.songs 
@end
