//
//  TopicsController.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-28.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "TopicsController.h"
#import "Node.h"
#import "RemoteEngine.h"

@interface TopicsController ()

@end

@implementation TopicsController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"社区";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self getRemoteData];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)getRemoteData {
    RemoteEngine *remoteEngine = [[RemoteEngine alloc] initWithHostName:BaseAPIURL];
    [remoteEngine getTopicsWithPage:1 conCompletion:^(MKNetworkOperation *completedOperation) {
        NSMutableArray *response = [completedOperation responseJSON];
        self.topics = response;
        
        NSLog(@"%d", self.topics.count);
    } onError:^(MKNetworkOperation *completedOperation, NSError *error) {
        self.topics = nil;
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    NSLog(@"I'm in number of section in table view");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"I'm in number of rows section");
    NSLog(@"%d", self.topics.count);
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"I'm in cell for row at index path");
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSDictionary *cellContent = [self.topics objectAtIndex:indexPath.row];
    cell.textLabel.text = [cellContent objectForKey:@"title"];
    return cell;
}

#pragma mark - Table view delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    /*
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//     */
//}
//
@end
