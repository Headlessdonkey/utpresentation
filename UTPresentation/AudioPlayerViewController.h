//
//  AudioPlayerViewController.h
//  UTPresentation
//
//  Created by James Logan on 3/10/15.
//  Copyright (c) 2015 James Logan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AudioPlayerViewController : UIViewController

+ (instancetype)sharedInstance;

@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end
