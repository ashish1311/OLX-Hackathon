//
//  SubmitAdViewController.m
//  Olx-TH
//
//  Created by AshishX Singal on 9/26/15.
//  Copyright (c) 2015 Ashish Singal. All rights reserved.
//

#import "SubmitAdViewController.h"

@interface SubmitAdViewController ()

@end

@implementation SubmitAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)showAlert:(NSString*)message
{
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
    
}
- (IBAction)submitAd:(id)sender {
    
    if ([textField_Name.text length] != 0 ) {
        if ([textField_location.text length] != 0 ) {
            if ([textField_phone.text length] != 0 ) {
                if ([textField_email.text length] != 0 ) {
                    if ([textField_title.text length] != 0 ) {
                        [self showAlert:@"Ad Submitted Successfull."];
                    }
                    else
                        [self showAlert:@"Please enter Title"];

                }
                else
                    [self showAlert:@"Please enter Email"];

            }
            else
                [self showAlert:@"Please enter Phone"];
        }
        else
            [self showAlert:@"Please enter Location"];
    }
    else
        [self showAlert:@"Please enter Name"];
    
}
#pragma mark - Textfiedl Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}// called when 'return' key pressed. return NO to ignore.

@end
