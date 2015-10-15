//
//  rivmViewController.m
//  Vaccincatie
//
//  Created by Mark Westenberg on 14-10-15.
//  Copyright © 2015 Mark Westenberg. All rights reserved.
//

#import "rivmViewController.h"
#import "GeneralSettings.h"
#import "SWRevealViewController.h"

@interface rivmViewController ()

@end

@implementation rivmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GeneralSettings *settings = [[GeneralSettings alloc] initWithView:self.view andNavController:self.navigationController];
    [settings positionColoredLine];
    [settings setNavColor];
    [self setUpMenuButton];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

-(void)setUpMenuButton {
    
    if (self.navigationController.navigationBar.tag==1)
    {
        SWRevealViewController *revealViewController = self.revealViewController;
        
        
        UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_icon"] style:UIBarButtonItemStylePlain target:revealViewController action:@selector(revealToggle:)];
        menuButton.tintColor = [UIColor whiteColor];
        self.navigationItem.leftBarButtonItem = menuButton;
        [self.navigationController.navigationBar addGestureRecognizer:revealViewController.panGestureRecognizer];
        NSLog(@"IWASHERE");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)menuActivation {
    
    NSLog(@"menu clicked!!");
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"rivminfo" forKey:@"page"];
    [[NSNotificationCenter defaultCenter] postNotificationName: @"activePage" object:nil userInfo:userInfo];
    
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
