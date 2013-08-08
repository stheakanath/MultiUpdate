//
//  AccountScreenViewController.h
//  MultiUpdate
//
//  Created by Sony Theakanath on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FlipsideViewController.h"

@interface AccountScreenViewController : UIViewController
{
    IBOutlet UIButton *authButton;
}
- (IBAction)authButtonAction:(id)sender;
- (IBAction)back;


@end
