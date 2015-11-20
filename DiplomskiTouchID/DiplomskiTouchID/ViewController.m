//
//  ViewController.m
//  DiplomskiTouchID
//
//  Created by Infinum on 06/11/15.
//  Copyright © 2015 Infinum. All rights reserved.
//

#import "ViewController.h"
#import "StringListViewController.h"

@import LocalAuthentication;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    
    LAContext *context = [[LAContext alloc] init];
    //2876
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication
                localizedReason:@"Are you the device owner?"
                          reply:^(BOOL success, NSError *error) {
                              dispatch_async(dispatch_get_main_queue(), ^{
                                  if (error) {

                                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                      message:@"There was a problem verifying your identity."
                                                                                     delegate:nil
                                                                            cancelButtonTitle:@"Ok"
                                                                            otherButtonTitles:nil];
                                      [alert show];
                                      return;
                                  }
                                  
                                  if (success) {
                                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                      message:@"You are the device owner!"
                                                                                     delegate:nil
                                                                            cancelButtonTitle:@"Ok"
                                                                            otherButtonTitles:nil];
                                      [alert show];
                                      
                                      StringListViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"StringListView"];
                                      [self.navigationController pushViewController:vc animated:YES];

                                      
                                      
                                  } else {
                                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                      message:@"You are not the device owner."
                                                                                     delegate:nil
                                                                            cancelButtonTitle:@"Ok"
                                                                            otherButtonTitles:nil];
                                      [alert show];
                                  }
                              });
                              
                          }];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Your device cannot authenticate using TouchID."
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}

@end
