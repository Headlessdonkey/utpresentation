//
//  AudioPlayerViewController.m
//  UTPresentation
//
//  Created by James Logan on 3/10/15.
//  Copyright (c) 2015 James Logan. All rights reserved.
//

#import "AudioPlayerViewController.h"
#import "Constants.h"
#import "SoundClip.h"
#import <AFNetworking/AFNetworking.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioPlayerViewController ()
@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) SoundClip *clip;
@end

@implementation AudioPlayerViewController

+ (instancetype)sharedInstance
{
    static AudioPlayerViewController *sharedPlayer = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedPlayer = [[self alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:sharedPlayer
                                                 selector:@selector(playSoundClip:)
                                                     name:PLAY_SOUND_CLIP
                                                   object:nil];
    });
    
    return sharedPlayer;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
   
    
}

- (void)playSoundClip:(NSNotification*)note
{
    if (self.player.rate > 0 && [self.clip.URL isEqualToString:[[note userInfo] objectForKey:@"URL"]]) {
        [self.player pause];
    }
    else
    {
        self.clip = [[note userInfo] objectForKey:@"clip"];
        [self playFile: self.clip.URL];
    }

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:PLAY_SOUND_CLIP
                                                  object:nil];
}

- (void)playFile:(NSString*)URL
{

        NSError *setCategoryErr = nil;
        NSError *activationErr  = nil;
        [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error:&setCategoryErr];
        [[AVAudioSession sharedInstance] setActive:YES error:&activationErr];
        
        if (URL) {
            
            NSURL *audioUrl = [NSURL URLWithString:URL];
            self.player = [[AVPlayer alloc] initWithPlayerItem:[[AVPlayerItem alloc] initWithURL:audioUrl]];
            
            self.player.actionAtItemEnd = AVPlayerActionAtItemEndPause;
            
            [self.player play];
        }
}


@end
