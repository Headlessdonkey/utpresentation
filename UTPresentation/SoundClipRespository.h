//
//  SoundClipRespository.h
//  UTPresentation
//
//  Created by James Logan on 3/10/15.
//  Copyright (c) 2015 James Logan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SoundsClip.h"

typedef void (^SoundClipReturnBlock)(NSArray*);

@interface SoundClipRespository : NSObject

- (void)getSoundClips:(SoundClipReturnBlock)completion;

@end
