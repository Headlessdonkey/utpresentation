//
//  TextFieldExampleViewController.m
//  UTPresentation
//
//  Created by James Logan on 3/11/15.
//  Copyright (c) 2015 James Logan. All rights reserved.
//

#import "TextFieldExampleViewController.h"
#import <UITextField+Blocks/UITextField+Blocks.h>

@interface TextFieldExampleViewController ()

@end

@implementation TextFieldExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.textField1 setShouldReturnBlock:^BOOL(UITextField *textField) {
        //Do something
        return YES;
    }];
    
    [self.textField2 setShouldReturnBlock:^BOOL(UITextField *textField) {
        //Do something different
        return NO;
    }];
    
    [self.textField3 setShouldReturnBlock:^BOOL(UITextField *textField) {
        //Do a third something
        return YES;
    }];
    
    
//    self.textField1.delegate = self;
//    self.textField2.delegate = self;
//    self.textField3.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.textField1)
    {
        //Do something
    }
    else if (textField == self.textField2)
    {
        //Do something different
    }
    else if (textField == self.textField3)
    {
        //Do a third something
    }
    
    return YES;
}
@end
