//
//  Copyright (c) 2012 Parse. All rights reserved.

#import "ViewController.h"
#import <Parse/Parse.h>

@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"Parse Push Notifications"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - ()

/* Touch handler for the button */
- (IBAction)broadcastPushNotification:(id)sender  {
    [PFPush sendPushMessageToChannelInBackground:@"" withMessage:@"Hello World!"];
}


@end
