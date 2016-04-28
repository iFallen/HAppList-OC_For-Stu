//
//  ViewController.m
//  HTableTest
//
//  Created by JuanFelix on 4/11/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

#import "ViewController.h"
#import "AppListCell.h"
#import "SearchUtils.h"
#import "AppListModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,AppListCellStarDelegate>
{
    NSMutableArray * arrAppList;
}

@property (weak, nonatomic) IBOutlet UITableView *tblList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    arrAppList = [NSMutableArray array];
    
    [_tblList setContentInset:UIEdgeInsetsMake(40, 0, 0, 0)];
    [_tblList registerNib:[UINib nibWithNibName:@"AppListCell" bundle:nil] forCellReuseIdentifier:@"CELLID"];
    
    [SearchUtils requestApplistByName:@"QQ" completion:^(BOOL success, NSDictionary *dataList) {
        if(success){
            [self buildAppDataList:dataList[@"results"]];
        }else{
            NSLog(@"数据请求失败...");
        }
    }];
}

-(void)buildAppDataList:(NSArray *)arrList{
    if (arrList && arrList.count) {
        if (arrAppList && arrAppList.count) {
            [arrAppList removeAllObjects];
        }
        for(NSDictionary * dicP in arrList){
            AppListModel * appM = [[AppListModel alloc] init];
            [appM buildModelFromData:dicP];
            [arrAppList addObject:appM];
        }
        [_tblList reloadData];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AppListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID"];
    cell.delegate = self;
    [cell setAModel:[arrAppList objectAtIndex:indexPath.row]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(arrAppList && arrAppList.count){
        return arrAppList.count;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
}


#pragma mark - 
-(void)appListStarMarked:(BOOL)star cell:(AppListCell *)cell{
    NSIndexPath * indexPath = [_tblList indexPathForCell:cell];
    AppListModel * model = [arrAppList objectAtIndex:indexPath.row];
    model.isStar = star;
//    [arrAppList replaceObjectAtIndex:indexPath.row withObject:model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
