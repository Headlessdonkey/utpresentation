//
//  SoundClipRespository.m
//  UTPresentation
//
//  Created by James Logan on 3/10/15.
//  Copyright (c) 2015 James Logan. All rights reserved.
//

#import "SoundClipRespository.h"

@implementation SoundClipRespository

- (void)getSoundClips:(SoundClipReturnBlock)completion
{
    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([self getFakeSoundClips]);
        });
    }
}

- (NSArray*)getFakeSoundClips
{
    //Step one: Create a fake sound clip in code
    SoundsClip *clip = [SoundsClip new];
    clip.title = @"Fake Title";
    clip.duration = @"4:56";
    return @[clip];
}

@end
