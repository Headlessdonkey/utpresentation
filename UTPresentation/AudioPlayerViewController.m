//
//  AudioPlayerViewController.m
//  UTPresentation
//
//  Created by James Logan on 3/10/15.
//  Copyright (c) 2015 James Logan. All rights reserved.
//

#import "AudioPlayerViewController.h"
#import "Constants.h"

@interface AudioPlayerViewController ()

@end

@implementation AudioPlayerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playSoundClip:)
                                                 name:PLAY_SOUND_CLIP
                                               object:nil];
    
}

- (void)playSoundClip:(NSNotification*)note
{
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:PLAY_SOUND_CLIP
                                                  object:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
