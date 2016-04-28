//
//  AppListModel.h
//  HTableTest
//
//  Created by JuanFelix on 4/11/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppListModel : NSObject

@property (nonatomic,strong) NSString * imgURL;
@property (nonatomic,strong) NSString * trackName;
@property (nonatomic,strong) NSString * artistName;
@property (nonatomic) BOOL isStar;
@property (nonatomic,strong) NSString * downloadURL;

-(void)buildModelFromData:(NSDictionary *)dicD;

@end
