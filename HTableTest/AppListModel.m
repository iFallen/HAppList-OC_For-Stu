//
//  AppListModel.m
//  HTableTest
//
//  Created by JuanFelix on 4/11/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

#import "AppListModel.h"

@implementation AppListModel

-(void)buildModelFromData:(NSDictionary *)dicD{
    if(dicD && [dicD isKindOfClass:[NSDictionary class]] && dicD.count){
        _imgURL = dicD[@"artworkUrl100"];
        _trackName = dicD[@"trackName"];
        _artistName = dicD[@"artistName"];
        _isStar = false;
        _downloadURL = dicD[@"trackViewUrl"];
    }else{
        _imgURL = @"";
        _trackName = @"";
        _artistName = @"";
        _isStar = false;
        _downloadURL = @"";
    }
}

@end
