//
//  MKTextField.m
//  MetroKit
//
//  Created by Shawn Wall on 7/19/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import "MKTextField.h"
#import "MKKeyboardView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MKTextField

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setDefaults];        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setDefaults];
    }
    return self;
}

- (void)setDefaults {
    [self setFont:[UIFont fontWithName:@"SourceSansPro-Light" size:16]];
    [self setBackgroundColor:[UIColor whiteColor]];    
    [self setTextColor:[UIColor blackColor]];
    [self setBorderStyle:UITextBorderStyleNone];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.keyboardAppearance = UIKeyboardAppearanceDark;
}

@end
