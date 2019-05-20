//
//  DVMDetailTableViewController.h
//  PlaylistC26
//
//  Created by Eric Lanza on 5/20/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DVMPlaylist;

NS_ASSUME_NONNULL_BEGIN

@interface DVMDetailTableViewController : UITableViewController

@property (nonatomic, strong) DVMPlaylist *playlist;

@end

NS_ASSUME_NONNULL_END
