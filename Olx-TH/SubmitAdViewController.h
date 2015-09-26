//
//  SubmitAdViewController.h
//  Olx-TH
//
//  Created by AshishX Singal on 9/26/15.
//  Copyright (c) 2015 Ashish Singal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubmitAdViewController : UIViewController<UITextViewDelegate,UITextFieldDelegate>
{
    IBOutlet UITextField* textField_Name;
        IBOutlet UITextField* textField_email;
        IBOutlet UITextField* textField_phone;
        IBOutlet UITextField* textField_location;
        IBOutlet UITextView* textView_description;
}

@end
