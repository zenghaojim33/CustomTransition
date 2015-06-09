//
//  PresentedViewController.m
//  BubbleTransition
//
//  Created by Anson on 15/6/9.
//  Copyright (c) 2015年 Anson Tsang. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.closeButton.transform = CGAffineTransformMakeRotation(M_PI_4);
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault animated:YES];

}


- (IBAction)closeClicked:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
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

@end
