//

#import "ViewController.h"
#import <Parse/Parse.h>

@implementation ViewController


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"Parse Push Notifications", @"Parse Push Notifications")];
    
    [self loadInstallData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - UIViewController

/* Touch handler for the button */
- (IBAction)broadcastPushNotification:(id)sender  {
    [PFPush sendPushMessageToChannelInBackground:@"global" withMessage:@"Hello World!"];
}

- (IBAction)updateInstallation:(id)sender {
    NSLog(@"updateInstallation");
    NSString *gender = @"male";
    if (self.genderControl.selectedSegmentIndex == 1) {
        gender = @"female";
    }
    NSNumber *age = [NSNumber numberWithInt:(int)self.ageControl.value];
    PFInstallation *install = [PFInstallation currentInstallation];
    [install setObject:age forKey:@"age"];
    [install setObject:gender forKey:@"gender"];
    [install saveInBackground];
}

- (IBAction)updateAgeLabel:(id)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterNoStyle;
    self.ageLabel.text = [formatter stringFromNumber:[NSNumber numberWithInt:(int)self.ageControl.value]];
}

- (void)loadInstallData {
    NSLog(@"loadInstallData");
    PFInstallation *install = [PFInstallation currentInstallation];
    NSNumber *age = [install objectForKey:@"age"];
    NSString *gender = [install objectForKey:@"gender"];

    // Handle saved age, or populate default age.
    if (!age) {
        age = [NSNumber numberWithInt:35];
        [install setObject:age forKey:@"age"];
    }
    self.ageLabel.text = [NSString stringWithFormat:@"%@", age];
    self.ageControl.value = [age floatValue];
    
    // Handle saved gender, or populate default gender.
    if ([gender isEqualToString:@"male"]) {
        self.genderControl.selectedSegmentIndex = 0;
    } else if ([gender isEqualToString:@"female"]) {
        self.genderControl.selectedSegmentIndex = 1;
    } else {
        self.genderControl.selectedSegmentIndex = 0;
        [install setObject:@"male" forKey:@"gender"];
    }
    
    [install saveInBackground];
    
}

@end
