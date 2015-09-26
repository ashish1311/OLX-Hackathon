//
//  ViewController.m
//  Olx-TH
//
//  Created by AshishX Singal on 9/26/15.
//  Copyright (c) 2015 Ashish Singal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textField_Name,textFieled_email,textFieled_Location,textFieled_Phone;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc] init];

    [self getCurrentLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveDataToDb:(id)sender {
    
    
    BOOL isAllFieldAvailableWithUs = [self isAllFieldValid];
    
    if (isAllFieldAvailableWithUs) {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        // saving an NSString
        [prefs setObject:textField_Name.text forKey:@"Name"];
        [prefs setObject:textFieled_email.text forKey:@"Email"];
        [prefs setObject:textFieled_Phone.text forKey:@"Phone"];
        [prefs setObject:textFieled_Location.text forKey:@"Location"];
        
        
        //retrieving
        NSUserDefaults *retr_prefs = [NSUserDefaults standardUserDefaults];
        
        // getting an NSString
        NSString *Name = [retr_prefs stringForKey:@"Name"];
        NSLog(@"Name Saved %@",Name);
        
        
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"firstControllerId"];
        [self.navigationController pushViewController:vc animated:YES];
    }

}

-(void)getCurrentLocation
{
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
}
-(BOOL)isAllFieldValid
{
    if ([textField_Name.text length] != 0) {
        if ([textFieled_email.text length] != 0) {
            if ([textFieled_Phone.text length] != 0) {
                if ([textFieled_Location.text length] != 0) {
                    return YES;
                }
                else
                {
                    [self showAlert:@"Please enter your location."];
                    return NO;
                }
            }
            else
            {
                [self showAlert:@"Please enter your Phone."];
                return NO;
            }
        }
        else
        {
            [self showAlert:@"Please enter your name."];
            return NO;
        }
    }
    else
    {
        [self showAlert:@"Please enter your Email."];
        return NO;
    }
}
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    [self showAlert:@"Failed to get your location."];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        textFieled_Location.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
    }
}
-(void)showAlert:(NSString*)message
{
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];

}
#pragma mark - Textfiedl Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}// called when 'return' key pressed. return NO to ignore.

@end
