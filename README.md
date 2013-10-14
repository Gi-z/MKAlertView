MKAlertView
===========

A self-contained Metro UI style UIAlertView replacement.

##Requirements

MKAlertView requires QuartzCore to be linked to the project, and has been tested to iOS 5+.

##Usage

MKAlertView can be instantiated with the following lines.

    MKAlertView *al = [[MKAlertView alloc] initWithType:MKAlertViewTypeDialog title:@"TITLE TEXT" body:@"BODY TEXT" leftButton:@"dismiss" rightButton:@"confirm"];
    al.delegate = self;
    [al show];

The following delegate methods are available.

    - (void)alertViewConfirmed:(MKAlertView *)alertView;
    - (void)alertViewDismissed:(MKAlertView *)alertView;
    - (void)alertViewConfirmed:(MKAlertView *)alertView withText:(NSString *)enteredText;

##License

MetroKit (the classes MKButton and MKTextField) were originally written by Shawn Wall.
MKAlertView is freely available, provided credits are made to "Glenn Forbes".
