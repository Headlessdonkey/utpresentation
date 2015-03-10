//
//  ViewController.m
//  UTPresentation
//
//  Created by James Logan on 3/10/15.
//  Copyright (c) 2015 James Logan. All rights reserved.
//

#import "ViewController.h"
#import "SoundClipTableViewCell.h"
#import "SoundsClip.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *soundClips;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableviewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.soundClips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SoundClipTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SoundClipTableViewCell"];
    
    SoundsClip *clip = (SoundsClip*)self.soundClips[indexPath.row];
    
    cell.titleLabel.text = clip.title;
    cell.titleLabel.text = clip.duration;
    
    return cell;
}

@end
