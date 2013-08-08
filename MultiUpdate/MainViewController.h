//
//  MainViewController.h
//  MultiUpdate
//
//  Created by Sony Theakanath on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"
#import "AppDelegate.h"

@interface MainViewController : UIViewController <UITextViewDelegate>
{
    UITextView *texttopost;
    UIImageView *backgroundfortext;
}

- (IBAction)post;
- (IBAction)gotosettings:(id)sender;

@end
