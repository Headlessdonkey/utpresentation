//
//  SoundClipRespository.m
//  UTPresentation
//
//  Created by James Logan on 3/10/15.
//  Copyright (c) 2015 James Logan. All rights reserved.
//

#import "SoundClipRespository.h"
#import "SoundClip.h"
#import <AFNetworking/AFNetworking.h>

@implementation SoundClipRespository

- (void)getSoundClips:(SoundClipReturnBlock)completion
{
//    if (completion) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            completion([self getFakeSoundClips]);
//        });
//    }
    
//    NSURL *URL = [NSURL URLWithString:@"https://api.clyp.it/FeaturedList/Featured"];
//    
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:URL];
//    
//    [manager GET:[URL relativePath]
//      parameters:nil
//         success:^(AFHTTPRequestOperation *operation, id JSON) {
//
//             if (completion) {
//                 completion([self soundClipsFromJSON:JSON]);
//             }
//         }
//         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             
//         }
//     ];
}

//- (NSArray*)getFakeSoundClips
//{
//    //Step one: Create a fake sound clip in code
////    SoundsClip *clip = [SoundsClip new];
////    clip.title = @"Fake Title";
////    clip.duration = @"4:56";
////    return @[clip];
//    
//    //Step two: Create sound clip for data stored on disk
//    
////    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"FakeNetworkResponse" ofType:@"json"];
////    NSData *data = [NSData dataWithContentsOfFile:filePath];
////    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
////    NSLog(@"json: %@", json);
////
////    NSMutableArray *soundClips = [NSMutableArray new];
////    
////    for (NSDictionary *soundClipJson in json) {
////        SoundsClip *soundClip = [SoundsClip new];
////        soundClip.title = soundClipJson[@"Title"];
////        soundClip.duration = [self durationString:soundClipJson[@"Duration"]];
////        
////        [soundClips addObject:soundClip];
////    }
////    
////    return soundClips;
////    return [self soundClipsFromJSON:json];
////    return @[];
//}

-(NSArray*)soundClipsFromJSON:(NSArray*)JSON
{
    NSMutableArray *soundClips = [NSMutableArray new];
    
    for (NSDictionary *soundClipJson in JSON) {
        SoundClip *soundClip = [SoundClip new];
        soundClip.title = soundClipJson[@"Title"];
        soundClip.duration = [self durationString:soundClipJson[@"Duration"]];
        
        [soundClips addObject:soundClip];
    }
    
    return soundClips;
}

- (NSString*)durationString:(NSNumber*)durationNumber
{
    double duration = [durationNumber doubleValue];
    
    NSString *durationString = @"--";
    
    if ( duration > 0) {
        
        int numberOfHours = duration/3600;
        
        int numberOrMinutes = (duration - (numberOfHours * 3600))/60;
        
        int numberOfSeconds = duration - (numberOrMinutes * 60);
        
        if (numberOfHours > 0) {
            durationString = [NSString stringWithFormat:@"%dh %dm %ds",numberOfHours,numberOrMinutes,numberOfSeconds];
        }
        else if (numberOrMinutes > 0) {
            durationString = [NSString stringWithFormat:@"%dm %ds",numberOrMinutes,numberOfSeconds];
        }
        else
        {
            durationString = [NSString stringWithFormat:@"%ds",numberOfSeconds];
        }
    }
    
    return durationString;
}

@end
