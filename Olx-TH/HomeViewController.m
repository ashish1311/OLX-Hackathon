//
//  HomeViewController.m
//  Olx-TH
//
//  Created by AshishX Singal on 9/26/15.
//  Copyright (c) 2015 Ashish Singal. All rights reserved.
//

#import "HomeViewController.h"
#import "IGLDropDownMenu.h"



@interface HomeViewController () <IGLDropDownMenuDelegate>
@property (nonatomic, strong) IGLDropDownMenu *dropDownMenu;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *dataArray = @[@{@"image":@"sun.png",@"title":@"Mobiles"},
                           @{@"image":@"clouds.png",@"title":@"Cars"},
                           @{@"image":@"snow.png",@"title":@"Electronics"},];
    
    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < dataArray.count; i++) {
        NSDictionary *dict = dataArray[i];
        
        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
        [item setIconImage:[UIImage imageNamed:dict[@"image"]]];
        [item setText:dict[@"title"]];
        [dropdownItems addObject:item];
    }
    
    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
    self.dropDownMenu.menuText = @"Kharid Le";
    self.dropDownMenu.dropDownItems = dropdownItems;
    self.dropDownMenu.paddingLeft = 15;
    [self.dropDownMenu setFrame:CGRectMake(20, 250, 320, 45)];
    self.dropDownMenu.delegate = self;
    
    // You can use block instead of delegate if you want
    /*
     __weak typeof(self) weakSelf = self;
     [self.dropDownMenu addSelectedItemChangeBlock:^(NSInteger selectedIndex) {
     __strong typeof(self) strongSelf = weakSelf;
     IGLDropDownItem *item = strongSelf.dropDownMenu.dropDownItems[selectedIndex];
     strongSelf.textLabel.text = [NSString stringWithFormat:@"Selected: %@", item.text];
     }];
     */
    
    [self setUpParamsForDemo1];
    
    [self.dropDownMenu reloadView];
    
    [self.view addSubview:self.dropDownMenu];
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 50)];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.textLabel];

}

- (void)setUpParamsForDemo1
{
    self.dropDownMenu.type = IGLDropDownMenuTypeStack;
    self.dropDownMenu.gutterY = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dismissPresented:(id)sender {
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
