//
//  StatusHistoryViewController.m
//  CardGame
//
//  Created by Vichet Meng on 4/9/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//

#import "StatusHistoryViewController.h"

@interface StatusHistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *statusHistoryTextView;

@end

@implementation StatusHistoryViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    [self updateStatusHistoryTextView];
}

-(void) updateStatusHistoryTextView
{
    NSMutableAttributedString *statusHistoryText = [[NSMutableAttributedString alloc] init];
    for(NSMutableAttributedString *status in self.statusHistory)
    {
        [statusHistoryText appendAttributedString:status];
        [statusHistoryText appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        self.statusHistoryTextView.attributedText = statusHistoryText;
    }
}

@end
