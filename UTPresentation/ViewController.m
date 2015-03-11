//
//  ViewController.m
//  UTPresentation
//
//  Created by James Logan on 3/10/15.
//  Copyright (c) 2015 James Logan. All rights reserved.
//

#import "ViewController.h"
#import "SoundClipTableViewCell.h"
#import "SoundClipRespository.h"
#import "Constants.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *soundClips;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self getSoundClips];
}

- (void)getSoundClips
{
    SoundClipRespository *repo = [SoundClipRespository new];
    __weak ViewController *weakSelf = self;
    
    [repo getSoundClips:^(NSArray *soundClips) {
        weakSelf.soundClips = soundClips;
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark UITableviewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.soundClips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SoundClipTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SoundClipTableViewCell"];
    
    SoundClip *clip = (SoundClip*)self.soundClips[indexPath.row];
    
    cell.titleLabel.text = clip.title;
    cell.durationLabel.text = clip.duration;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SoundClip *clip = (SoundClip*)self.soundClips[indexPath.row];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:PLAY_SOUND_CLIP object:nil userInfo:@{@"clip":clip}];
}

@end
