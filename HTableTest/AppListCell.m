//
//  AppListCell.m
//  HTableTest
//
//  Created by JuanFelix on 4/11/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

#import "AppListCell.h"
#import "AppListModel.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "HFont.h"

@implementation AppListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [_btnIsStar.titleLabel setFont:[UIFont fontWithName:IconFont size:30.0]];
    [_btnIsStar setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_btnIsStar setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [_btnIsStar setTitle:IF_Star_UNFill forState:UIControlStateNormal];
    [_btnIsStar setTitle:IF_Star_Fill forState:UIControlStateSelected];
    [_btnIsStar setSelected:false];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)starAction:(UIButton *)sender {
    [_btnIsStar setSelected:_btnIsStar.selected ? false : true];
    if(_delegate && [_delegate respondsToSelector:@selector(appListStarMarked:cell:)]){
        [_delegate appListStarMarked:_btnIsStar.selected cell:self];
    }
}

- (IBAction)openInAppStoreAction:(id)sender {
    if(_aModel){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_aModel.downloadURL]];
    }
}

-(void)setAModel:(AppListModel *)aModel{
    if(_aModel != aModel){
        _aModel = aModel;
        [_imgAppIcon setImageWithURL:[NSURL URLWithString:_aModel.imgURL]];
        [_lbTrackName setText:_aModel.trackName];
        [_lbArtistName setText:_aModel.artistName];
        [_btnIsStar setSelected:_aModel.isStar];
    }
}

//-(void)reloadCellData:(AppListModel *)model{
//    [_imgAppIcon setImageWithURL:[NSURL URLWithString:model.imgURL]];
//    [_lbTrackName setText:model.trackName];
//    [_lbArtistName setText:model.artistName];
//    [_btnIsStar setSelected:model.isStar];
//}

@end
