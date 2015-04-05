//
//  RootViewController.m
//  TimerDemo
//
//  Created by Li Hongli on 13-3-4.
//  Copyright (c) 2013年 Li Hongli. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    //[dateFormatter setDateFormat:@"hh:mm:ss"] // 输出格式
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss:SSSSSS"];  // 输出格式
    
    //[dateFormatter setDateFormat:@"yyMMddHHmmssSSSSSS"]; // 输出格式
    // 时间字符串
    startDate = [[dateFormatter stringFromDate:[NSDate date]] retain];
    [dateFormatter release];
    mTimer = [[NSTimer scheduledTimerWithTimeInterval:1/60.0f target:self selector:@selector(mGoTimer) userInfo:nil repeats:YES]retain];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [mTimer invalidate];
}

- (void)mGoTimer
{
    NSDateFormatter *formatters = [[NSDateFormatter alloc]init];

    [formatters setDateStyle:NSDateFormatterMediumStyle];
    [formatters setTimeStyle:NSDateFormatterShortStyle];
    //[dateFormatter setDateFormat:@"hh:mm:ss"] // 输出格式
    
    [formatters setDateFormat:@"yyyy-MM-dd HH:mm:ss:SSSSSS"];  // 输出格式

    
    NSDate *dateS = [formatters dateFromString:startDate];
    float endFloat = [[NSDate date] timeIntervalSinceDate:dateS];
    NSLog(@"%f",endFloat);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
