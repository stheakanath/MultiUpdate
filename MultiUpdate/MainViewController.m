//
//  MainViewController.m
//  MultiUpdate
//
//  Created by Sony Theakanath on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

/*
   UITextView Keyboard Handling
*/
- (void)keyboardWillShow:(NSNotification *)notif
{
    [UIImageView beginAnimations:nil context:NULL];
    [UITextView beginAnimations:nil context:NULL];
    [UITextView setAnimationDuration:0.3];
    [UIImageView setAnimationDuration:0.3];
    [backgroundfortext setFrame:CGRectMake(18, 72, 283, 145)];
    [texttopost setFrame:CGRectMake(28, 83, 265, 131)];
    [UIImageView commitAnimations];
    [UITextView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification *)notif
{
    [UIImageView beginAnimations:nil context:NULL];
    [UITextView beginAnimations:nil context:NULL];
    [UITextView setAnimationDuration:0.3];
    [UIImageView setAnimationDuration:0];
    [backgroundfortext setFrame:CGRectMake(18, 77, 283, 320)];
    [texttopost setFrame:CGRectMake(28, 83, 265, 306)];
    [UIImageView commitAnimations];
    [UITextView commitAnimations];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range 
 replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [texttopost resignFirstResponder];
        return FALSE;
    }
    return TRUE;
}





/*
    Post Functions
*/
-(IBAction)post
{
    NSString *message = texttopost.text;
    [FBRequestConnection startForPostStatusUpdate:message completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        [self showAlert:message result:result error:error];
    }];
}

- (void)showAlert:(NSString *)message result:(id)result error:(NSError *)error
{
    NSString *alertMsg;
    NSString *alertTitle;
    
    if (error)
    {
        alertMsg = error.localizedDescription;
        alertTitle = @"Error";
    } else {
        NSDictionary *resultDict = (NSDictionary *)result;
        alertMsg = [NSString stringWithFormat:@"Successfully posted '%@'.\nPost ID: %@", message, [resultDict valueForKey:@"id"]];
        alertTitle = @"Success";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle message:alertMsg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}




/*
    Changing to Settings Menu
*/

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)gotosettings:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}


/*
    Other
*/
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Making notifications for appearing the keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window]; 
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:self.view.window];
    
    //The background image
    backgroundfortext =  [[UIImageView alloc] initWithFrame:CGRectMake(18, 77, 283, 320)];
    backgroundfortext.image = [UIImage imageNamed:@"textfield.png"];
    [self.view addSubview:backgroundfortext];
    
    //The textfield
    texttopost = [[UITextView alloc] initWithFrame:CGRectMake(28, 83, 265, 306)];
    texttopost.text = @"What's on your mind?";
    texttopost.backgroundColor = [UIColor clearColor];
    texttopost.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0];
    [self.view addSubview:texttopost];
    texttopost.delegate = self;
}



@end
