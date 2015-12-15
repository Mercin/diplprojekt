//
//  AddNewStringViewController.m
//  DiplomskiTouchID
//
//  Created by Infinum on 11/12/15.
//  Copyright © 2015 Infinum. All rights reserved.
//

#import "AddNewStringViewController.h"



@interface AddNewStringViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@end

@implementation AddNewStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNewInput:(id)sender {
    if (![self.inputTextField hasText]) {
        NSLog(@"Prazno");
    }
    else{
        NSString *itemToPassBack = self.inputTextField.text;
        [self.delegate addItemViewController:self didFinishEnteringItem:itemToPassBack];
    }
        [self.navigationController popViewControllerAnimated:YES];
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
