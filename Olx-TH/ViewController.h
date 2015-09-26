//
//  ViewController.h
//  Olx-TH
//
//  Created by AshishX Singal on 9/26/15.
//  Copyright (c) 2015 Ashish Singal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate,UITextFieldDelegate>
{
    CLLocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet UITextField *textField_Name;
@property (weak, nonatomic) IBOutlet UITextField *textFieled_email;
@property (weak, nonatomic) IBOutlet UITextField *textFieled_Phone;
@property (weak, nonatomic) IBOutlet UITextField *textFieled_Location;

@end

