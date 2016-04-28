//
//  AppListCell.h
//  HTableTest
//
//  Created by JuanFelix on 4/11/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppListModel;
@class AppListCell;

@protocol AppListCellStarDelegate <NSObject>

@optional
-(void)appListStarMarked:(BOOL)star cell:(AppListCell *)cell;

@end

@interface AppListCell : UITableViewCell

@property (nonatomic,assign) id<AppListCellStarDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *imgAppIcon;
@property (weak, nonatomic) IBOutlet UILabel *lbTrackName;
@property (weak, nonatomic) IBOutlet UILabel *lbArtistName;
@property (weak, nonatomic) IBOutlet UIButton *btnIsStar;
@property (nonatomic, strong) AppListModel * aModel;

//-(void)reloadCellData:(AppListModel *)model;

@end
