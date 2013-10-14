//
//  MKButton.h
//  MetroKit
//
//  Created by Shawn Wall on 7/19/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Flattened button with square edges. Default state of white border, black 
 background & white text. Default highlight of white background, black text.
 */
@interface MKButton : UIButton


@property (strong, nonatomic) UIView *otherView;
@end
