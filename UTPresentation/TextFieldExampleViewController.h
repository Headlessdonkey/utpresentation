//
//  TextFieldExampleViewController.h
//  UTPresentation
//
//  Created by James Logan on 3/11/15.
//  Copyright (c) 2015 James Logan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextFieldExampleViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;

@end
