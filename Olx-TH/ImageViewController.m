//
//  ImageViewController.m
//  Olx-TH
//
//  Created by AshishX Singal on 9/26/15.
//  Copyright (c) 2015 Ashish Singal. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

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
- (IBAction)btnGalleryClicked:(id)sender
{
    ipc= [[UIImagePickerController alloc] init];
    ipc.delegate = self;
    ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
        [self presentViewController:ipc animated:YES completion:nil];
}
- (IBAction)btnCameraClicked:(id)sender
{
    ipc = [[UIImagePickerController alloc] init];
    ipc.delegate = self;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:ipc animated:YES completion:NULL];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"No Camera Available." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        alert = nil;
    }
}
#pragma mark - ImagePickerController Delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
        [picker dismissViewControllerAnimated:YES completion:nil];
    _ivPickedImage.image = [info objectForKey:UIImagePickerControllerOriginalImage];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)dismissController:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES ];
}

@end
