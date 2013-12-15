//
//  MetroUIStyleAlertView.m
//  Metroa
//
//  Created by Glenn Forbes on 12/10/2013.
//  Copyright (c) 2013 Glenn Forbes. All rights reserved.
//

#import "MKAlertView.h"
#import "MKButton.h"
#import "MKTextField.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation MKAlertView
@synthesize titleLabel, textLabel, delegate;

- (id)initWithType:(MKAlertViewType)type title:(NSString *)titleText body:(NSString *)bodyText leftButton:(NSString *)leftButtonText rightButton:(NSString *)rightButtonText
{
    self = [super init];
    self.type = type;
    
    mainWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    mainWindow.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    UIViewController *rootVC = [[UIViewController alloc] init];
    [mainWindow setRootViewController:rootVC];
    [rootVC.view addSubview:self];
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, ([[UIScreen mainScreen] bounds].size.height/3)+82)];
    [view setBackgroundColor:[UIColor colorWithWhite:0.122 alpha:1.000]];
    
    [rootVC.view addSubview:view];
    
    if (type == MKAlertViewTypeTextEntry)
    {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 305, 50)];
        titleLabel.text = titleText;
        titleLabel.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:30];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        [view addSubview:titleLabel];
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 305, 100)];
        textLabel.text = bodyText;
        textLabel.font = [UIFont fontWithName:@"SourceSansPro-Light" size:20];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor whiteColor];
        textLabel.textAlignment = NSTextAlignmentLeft;
        [view addSubview:textLabel];
        
        MKButton *button1 = [[MKButton alloc] initWithFrame:CGRectMake(10, view.frame.size.height-40, 145, 30)];
        [button1 setTitle:leftButtonText forState:UIControlStateNormal];
        [button1 setBackgroundColor:[UIColor colorWithWhite:0.122 alpha:1.000]];
        button1.titleLabel.font = [UIFont fontWithName:@"SourceSansPro-Semibold" size:16];
        button1.titleLabel.textColor = [UIColor whiteColor];
        [button1 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        
        MKButton *button2 = [[MKButton alloc] initWithFrame:CGRectMake(165, view.frame.size.height-40, 145, 30)];
        [button2 setTitle:rightButtonText forState:UIControlStateNormal];
        [button2 setBackgroundColor:[UIColor colorWithWhite:0.122 alpha:1.000]];
        button2.titleLabel.font = [UIFont fontWithName:@"SourceSansPro-Semibold" size:16];
        button2.titleLabel.textColor = [UIColor whiteColor];
        [button2 addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:button1];
        [view addSubview:button2];
        
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        view.layer.transform = CATransform3DMakeRotation(1.75, 1, 0, 0);
        [CATransaction commit];
        
        d = [[MKTextField alloc] initWithFrame:CGRectMake(10, ([[UIScreen mainScreen] bounds].size.height/3)+5, 300, 30)];
        [view addSubview:d];
    }
    else if (type == MKAlertViewTypeDialog)
    {
        view.frame = CGRectMake(0, 0, 320, ([[UIScreen mainScreen] bounds].size.height/3));
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 305, 50)];
        titleLabel.text = titleText;
        titleLabel.font = [UIFont fontWithName:@"SourceSansPro-Regular" size:30];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        [view addSubview:titleLabel];
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 55, 280, 200)];
        textLabel.text = bodyText;
        textLabel.font = [UIFont fontWithName:@"SourceSansPro-Light" size:20];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor whiteColor];
        textLabel.textAlignment = NSTextAlignmentLeft;
        textLabel.numberOfLines = 0;
        [textLabel sizeToFit];
        [view addSubview:textLabel];
        
        MKButton *button1 = [[MKButton alloc] initWithFrame:CGRectMake(10, view.frame.size.height-40, 145, 30)];
        [button1 setTitle:leftButtonText forState:UIControlStateNormal];
        [button1 setBackgroundColor:[UIColor colorWithWhite:0.122 alpha:1.000]];
        button1.titleLabel.font = [UIFont fontWithName:@"SourceSansPro-Semibold" size:16];
        button1.titleLabel.textColor = [UIColor whiteColor];
        [button1 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        
        MKButton *button2 = [[MKButton alloc] initWithFrame:CGRectMake(165, view.frame.size.height-40, 145, 30)];
        [button2 setTitle:rightButtonText forState:UIControlStateNormal];
        [button2 setBackgroundColor:[UIColor colorWithWhite:0.122 alpha:1.000]];
        button2.titleLabel.font = [UIFont fontWithName:@"SourceSansPro-Semibold" size:16];
        button2.titleLabel.textColor = [UIColor whiteColor];
        [button2 addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:button1];
        [view addSubview:button2];
        
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        view.layer.transform = CATransform3DMakeRotation(1.75, 1, 0, 0);
        [CATransaction commit];
    }
    
    self.hidden = YES;
    
    return self;
}

- (void)show
{
    self.hidden = NO;
    [mainWindow makeKeyAndVisible];
    [mainWindow setWindowLevel:UIWindowLevelAlert];
    if (self.type == MKAlertViewTypeTextEntry)
    {
        [d becomeFirstResponder];
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    view.layer.transform = CATransform3DMakeRotation(0, 1, 0, 0);
    [UIView commitAnimations];
}

- (void)confirm:(MKButton *)button
{
    if (self.type == MKAlertViewTypeDialog)
    {
        [self.delegate alertViewConfirmed:self];
    }
    else if (self.type == MKAlertViewTypeTextEntry)
    {
        [d resignFirstResponder];
        [self.delegate alertViewConfirmed:self withText:d.text];
    }
    for (UIView *views in mainWindow.rootViewController.view.subviews)
    {
        if (![views respondsToSelector:@selector(buttonType)])
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.3];
            views.layer.transform = CATransform3DMakeRotation(M_PI_2,1.0,0.0,0.0);
            [UIView commitAnimations];
        }
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDidStopSelector:@selector(hideMain)];
    view.alpha = 0;
    [UIView commitAnimations];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    mainWindow.alpha = 0;
    [UIView commitAnimations];
}

- (void)back:(MKButton *)button
{
    [d resignFirstResponder];
    [delegate alertViewDismissed:self];
    for (UIView *views in mainWindow.rootViewController.view.subviews)
    {
        if (![views respondsToSelector:@selector(buttonType)])
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.3];
            views.layer.transform = CATransform3DMakeRotation(M_PI_2,1.0,0.0,0.0);
            [UIView commitAnimations];
        }
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDidStopSelector:@selector(hideMain)];
    view.alpha = 0;
    mainWindow.alpha = 0;
    [UIView commitAnimations];
}

- (void)hideMain
{
    mainWindow.hidden = YES;
}
@end
