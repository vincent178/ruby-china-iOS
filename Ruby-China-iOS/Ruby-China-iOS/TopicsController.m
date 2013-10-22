//
//  TopicsController.m
//  Ruby-China-iOS
//
//  Created by Vincent on 13-10-12.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "TopicsController.h"
#import "RCTopic.h"
#import "AFNetworking.h"
#import "TopicCell.h"
#import "NewTopicController.h"
#import "TopicController.h"

@interface TopicsController ()

@end

@implementation TopicsController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = @"Ruby China";
    
    // Navigation Bar Item Button
    UIBarButtonItem *newTopicButton = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                       target:self action:@selector(newTopicButtonClicked)];
    self.navigationItem.rightBarButtonItem = newTopicButton;
    

    [self refresh];
}

- (void)refresh {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"http://ruby-china.org/api/v2/topics.json";
    NSDictionary *params = @{@"page": @1, @"per_page": @10};
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        topics = responseObject;
        NSLog(@"%@", [topics objectAtIndex:0]);
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [topics count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";
    
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[TopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell setupWithTopic:[topics objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark -
#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicController *topicController = [[TopicController alloc] init];
    [self.navigationController pushViewController: topicController animated:YES];
}



















#pragma mark -
#pragma mark - Table view navigation

- (void)newTopicButtonClicked {
    NewTopicController *newTopicController = [[NewTopicController alloc] init];
    [self.navigationController pushViewController:newTopicController animated:YES];
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */


@end
