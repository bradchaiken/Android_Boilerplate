//
//  Copyright (c) 2013 Parse. All rights reserved.

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/* Touch handler for the button */
-(IBAction)broadcastPushNotification:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (strong, nonatomic) IBOutlet UISlider *ageControl;

@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
- (IBAction)updateInstallation:(id)sender;
- (IBAction)updateAgeLabel:(id)sender;
@end
