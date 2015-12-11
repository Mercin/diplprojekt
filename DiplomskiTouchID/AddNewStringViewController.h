//
//  AddNewStringViewController.h
//  DiplomskiTouchID
//
//  Created by Infinum on 11/12/15.
//  Copyright © 2015 Infinum. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddNewStringViewController;

@protocol ViewControllerBDelegate <NSObject>
- (void)addItemViewController:(AddNewStringViewController *)controller didFinishEnteringItem:(NSString *)item;
@end

@interface AddNewStringViewController : UIViewController

@property (nonatomic, weak) id <ViewControllerBDelegate> delegate;

@end
