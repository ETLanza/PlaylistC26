//
//  DVMDetailTableViewController.m
//  PlaylistC26
//
//  Created by Eric Lanza on 5/20/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

#import "DVMDetailTableViewController.h"
#import "DVMPlaylistController.h"
#import "DVMPlaylist.h"
#import "DVMSong.h"

@interface DVMDetailTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@end

@implementation DVMDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)addButtonTapped:(id)sender {
    [[DVMPlaylistController sharedController] addSongWithTitle:self.titleTextField.text andArtist:self.artistTextField.text toPlaylist:self.playlist];
    [self.tableView reloadData];
    self.artistTextField.text = @"";
    self.titleTextField.text = @"";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playlist.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
    
//    DVMSong *song = [self.playlist.songs objectAtIndex:indexPath.row];
    DVMSong *song = self.playlist.songs[indexPath.row];
    
    cell.textLabel.text = [song title];
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
