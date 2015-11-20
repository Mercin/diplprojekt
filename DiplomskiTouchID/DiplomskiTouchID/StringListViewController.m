//
//  StringListViewController.m
//  DiplomskiTouchID
//
//  Created by Infinum on 20/11/15.
//  Copyright © 2015 Infinum. All rights reserved.
//

#import "StringListViewController.h"
#import <Valet/Valet.h>

@interface StringListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *fetchedStrings;

@end

@implementation StringListViewController
static NSString *serviceName = @"diplomski.DiplomskiTouchID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(openAddPage)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    VALValet *myValet = [[VALValet alloc] initWithIdentifier:@"Mirko" accessibility:VALAccessibilityWhenUnlocked];
    
    self.title = @"Secure data";
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    NSString *const username = @"List";
    
    NSData *data = [myValet objectForKey:username];
    self.fetchedStrings = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    
//    NSString *const username = @"List";
//    NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche",
//                             @"Opel", @"Volkswagen", @"Audi"];
//
//    NSData *archiveArray = [NSKeyedArchiver archivedDataWithRootObject:germanMakes];
//    [myValet setObject:archiveArray forKey:username];
//    
//    NSData *data =  [myValet objectForKey:username];
//    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
//    NSString *const myLuggageCombination = array[2];
//    
//    self.passField.text = myLuggageCombination;
    

}

-(void)openAddPage {
    NSLog(@"IM ALIIIIVEEEE");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fetchedStrings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.fetchedStrings objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    Post *post = self.posts[indexPath.row];
//    
//    PostDetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PostDetails"];
//    vc.post = post;
//    [self.navigationController pushViewController:vc animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
