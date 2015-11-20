//
//  StringListViewController.m
//  DiplomskiTouchID
//
//  Created by Infinum on 20/11/15.
//  Copyright © 2015 Infinum. All rights reserved.
//

#import "StringListViewController.h"
#import <Valet/Valet.h>

@interface StringListViewController ()

@end

@implementation StringListViewController
static NSString *serviceName = @"diplomski.DiplomskiTouchID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    VALValet *myValet = [[VALValet alloc] initWithIdentifier:@"Mirko" accessibility:VALAccessibilityWhenUnlocked];
    
    NSString *const username = @"List";
    NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche",
                             @"Opel", @"Volkswagen", @"Audi"];

    NSData *archiveArray = [NSKeyedArchiver archivedDataWithRootObject:germanMakes];
    [myValet setObject:archiveArray forKey:username];
    
    NSData *data =  [myValet objectForKey:username];
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSString *const myLuggageCombination = array[2];
    
    self.passField.text = myLuggageCombination;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
