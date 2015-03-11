//
//  SoundsClip.h
//  UTPresentation
//
//  Created by James Logan on 3/10/15.
//  Copyright (c) 2015 James Logan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoundClip : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *duration;
@property (strong, nonatomic) NSString *URL;

@end
