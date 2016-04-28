//
//  SearchUtils.m
//  HTableTest
//
//  Created by JuanFelix on 4/11/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

#import "SearchUtils.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@implementation SearchUtils

+(void)requestApplistByName:(NSString *)appName completion:(void(^)(BOOL success,NSDictionary * dataList))finished{
    NSString * searchURL = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&limit=30&entity=software",appName];
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    
    [manager GET:searchURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if (finished) {
                //NSInteger code = [[responseObject objectForKey:@"status"] integerValue];
                finished(true,responseObject);
            }
        }else{
            if (finished) {
                finished(false,nil);
            }
        }
    } failure:^(AFHTTPRequestOperation * operation, NSError *error) {
        if (finished) {
            finished(false,nil);
        }
    }];
}

@end
