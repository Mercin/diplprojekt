//
//  EditStringViewController.h
//  DiplomskiTouchID
//
//  Created by Infinum iOS on 15/12/15.
//  Copyright © 2015 Infinum. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditStringViewController;
@protocol EditStringViewControllerDelegate <NSObject>
-(void)editItemViewController:(EditStringViewController *)controller didFinishEnteringItem:(NSString *)item;
@end
@interface EditStringViewController : UIViewController
@property (nonatomic, weak) NSString *passedString;
@property (nonatomic, weak) id <EditStringViewControllerDelegate> delegate;
@end
