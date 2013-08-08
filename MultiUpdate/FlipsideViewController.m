//
//  FlipsideViewController.m
//  MultiUpdate
//
//  Created by Sony Theakanath on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController () @end @implementation FlipsideViewController

/*
    Changing Views
    Link Accounts, Remove Accounts, What Accounts to use for Post, Help/Documentatio
*/

//Link Accounts
- (void)AccountScreenViewControllerDidFinish:(AccountScreenViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)switchtolinkaccounts
{
    AccountScreenViewController *controller = [[AccountScreenViewController alloc] initWithNibName:@"AccountScreenViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

//Main View
- (void) MainViewControllerDidFinish:(MainViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction) back
{
    MainViewController *controller = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}




/*
    Other
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


@end
