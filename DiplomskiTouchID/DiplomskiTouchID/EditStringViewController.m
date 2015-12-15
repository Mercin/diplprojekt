//
//  EditStringViewController.m
//  DiplomskiTouchID
//
//  Created by Infinum iOS on 15/12/15.
//  Copyright © 2015 Infinum. All rights reserved.
//

#import "EditStringViewController.h"

@interface EditStringViewController ()
@property (weak, nonatomic) IBOutlet UITextField *editStringTextField;
@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation EditStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.editStringTextField.text = self.passedString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)okPressed:(id)sender {
    if (![self.editStringTextField hasText] || (self.editStringTextField.text == self.passedString)){
        NSLog(@"Prazno ili nije unijeta promjena");
    }
    else{
        NSString *itemToPassBack = self.editStringTextField.text;
        [self.delegate editItemViewController:self didFinishEnteringItem:itemToPassBack];

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
