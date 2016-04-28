//
//  SearchUtils.h
//  HTableTest
//
//  Created by JuanFelix on 4/11/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchUtils : NSObject

/**
 *  检索iTunesStore 应用
 *
 *  @param appName  应用名称
 *  @param finished 请求完成回调
 */
+(void)requestApplistByName:(NSString *)appName completion:(void(^)(BOOL success,NSDictionary * dataList))finished;

@end
