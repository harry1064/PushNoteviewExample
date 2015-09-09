//
//  AGViewController.m
//  AGPushNote_Example
//
//  Created by Aviel Gross on 4/29/14.
//  Copyright (c) 2014 Aviel Gross. All rights reserved.
//

#import "AGViewController.h"
#import "AGPushNoteView.h"

static NSInteger pushCounter = 0;

@interface AGViewController ()

@end

@implementation AGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pushNowAction:(UIButton *)sender {
    NSDictionary * dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"hey",@"id", nil];
    [AGPushNoteView showWithNotificationMessage:[NSString stringWithFormat:@"%ld", (long)pushCounter++] andDictionary:dictionary];
    [AGPushNoteView setMessageAction:^(NSDictionary *dic) {
        // here you can write  code to push different view controller depending upon info in dic
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Message" message:[NSString stringWithFormat:@"%@",dictionary] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: nil];
        [alert show];
    }];

}
@end
