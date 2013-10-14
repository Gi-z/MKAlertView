//
//  MetroUIStyleAlertView.h
//  Metroa
//
//  Created by Glenn Forbes on 12/10/2013.
//  Copyright (c) 2013 Glenn Forbes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKButton.h"
#import "MKKeyboardButton.h"
#import "MKKeyboardView.h"
#import "MKTextField.h"
#import <MediaPlayer/MediaPlayer.h>

typedef enum MKAlertViewType {
    MKAlertViewTypeTextEntry,
    MKAlertViewTypeDialog,
} MKAlertViewType;

@class MKAlertView;
@protocol MKAlertViewDelegate
- (void)alertViewConfirmed:(MKAlertView *)alertView;
- (void)alertViewDismissed:(MKAlertView *)alertView;
- (void)alertViewConfirmed:(MKAlertView *)alertView withText:(NSString *)enteredText;
@end

@interface MKAlertView : UIView
{
    NSMutableDictionary *viewsDict;
    MKTextField *d;
    UIButton *backgroundDim;
    UIView *view;
    UIWindow *mainWindow;
}

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *textLabel;
@property (strong, nonatomic) MKButton *leftButton;
@property (strong, nonatomic) MKButton *rightButton;
@property (nonatomic) MKAlertViewType type;
@property (nonatomic, strong) id <MKAlertViewDelegate> delegate;
- (void)show;
- (id)initWithType:(MKAlertViewType)type title:(NSString *)title body:(NSString *)bodyText leftButton:(NSString *)leftButtonText rightButton:(NSString *)rightButtonText;
@end
