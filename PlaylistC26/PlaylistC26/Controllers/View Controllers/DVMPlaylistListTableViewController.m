//
//  DVMPlaylistListTableViewController.m
//  PlaylistC26
//
//  Created by Eric Lanza on 5/20/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

#import "DVMPlaylistListTableViewController.h"
#import "DVMPlaylistController.h"
#import "DVMDetailTableViewController.h"

@interface DVMPlaylistListTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation DVMPlaylistListTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {
    
    [[DVMPlaylistController sharedController] createPlaylistWithName:self.nameTextField.text];
    
    [self.tableView reloadData];
    self.nameTextField.text = @"";
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return DVMPlaylistController.sharedController.playlists.count;
//    return [[[DVMPlaylistController sharedController] playlists] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    
    DVMPlaylist *playlist = [[[DVMPlaylistController sharedController] playlists] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [playlist name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu songs", playlist.songs.count];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toDetailVC"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        DVMDetailTableViewController *destinationVC = [segue destinationViewController];
        DVMPlaylist *playlist = [[[DVMPlaylistController sharedController] playlists] objectAtIndex:indexPath.row];
        destinationVC.playlist = playlist;
    }
}

@end
