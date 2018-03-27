//
//  CPSignRecordVC.m
//  lottery
//
//  Created by wayne on 2017/8/26.
//  Copyright © 2017年 施冬伟. All rights reserved.
//

#import "CPSignRecordVC.h"
#import "CPCPSignRecordCell.h"

@interface CPSignRecordVC ()<UITableViewDelegate,UITableViewDataSource>
{
    
    IBOutlet UITableView *_tableView;
    
    NSMutableArray *_dataList;
    
    int _page;
    int _totalPage;
}

@end

@implementation CPSignRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"签到记录";
    
    [_tableView registerNib:[UINib nibWithNibName:@"CPCPSignRecordCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([CPCPSignRecordCell class])];
    
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{

        [self queryDataForReferesh];
    }];
    
    _tableView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
        [self queryDataMore];
    }];
    
    [_tableView.mj_header beginRefreshing];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark-

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CPCPSignRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CPCPSignRecordCell class])];
    NSDictionary *info = _dataList[indexPath.row];
    
    [cell addTopLeftText:[info DWStringForKey:@"checkinDay"] topRightText:[NSString stringWithFormat:@"%@元",[info DWStringForKey:@"giftAmount"]] bottomLeftText:[NSString stringWithFormat:@"充值总额 %@",[info DWStringForKey:@"recharge"]] bottomRightText:[info DWStringForKey:@"checkinTime"]];
    return cell;
}

#pragma mark- network

-(void)queryDataForReferesh
{
    _page = 1;
    NSMutableDictionary *paramsDic =[[NSMutableDictionary alloc]initWithDictionary:@{@"token":[SUMUser shareUser].token}];
    [paramsDic setObject:[NSString stringWithFormat:@"%d",_page] forKey:@"page"];
    NSString *paramsString = [NSString encryptedByGBKAES:[paramsDic JSONString]];
    [SUMRequest startWithDomainString:[CPGlobalDataManager shareGlobalData].domainUrlString
                              apiName:CPSerVerAPINameForAPIUserCheckinList
                               params:@{@"data":paramsString}
                         rquestMethod:YTKRequestMethodGet
           completionBlockWithSuccess:^(__kindof SUMRequest *request) {
               
               [_tableView.mj_header endRefreshing];
               NSString *alertMsg = @"";
               if (request.resultIsOk) {
                   
                   NSDictionary *dataInfo = [request.resultInfo DWDictionaryForKey:@"data"];
                   NSArray *items = [dataInfo DWArrayForKey:@"items"];
                   if (items.count>0) {
                       _dataList = [[NSMutableArray alloc]initWithArray:items];
                       [_tableView reloadData];
                       _totalPage = [[dataInfo DWStringForKey:@"totalPage"]intValue];
                       if (_totalPage>_page) {
                           _page++;
                       }
                   }else{
                       alertMsg = @"暂无记录";
                   }
                   
               }else{
                   alertMsg = request.requestDescription;
               }
               
               if (alertMsg.length >0) {
                   [SVProgressHUD way_showInfoCanTouchAutoDismissWithStatus:alertMsg];
               }
               
           } failure:^(__kindof SUMRequest *request) {
               
               [_tableView.mj_header endRefreshing];
               [SVProgressHUD way_showInfoCanTouchAutoDismissWithStatus:@"网络异常"];
           }];
    
    
}

-(void)queryDataMore
{
    if (_page>=_totalPage) {
        
        [_tableView.mj_footer endRefreshingWithNoMoreData];
        [SVProgressHUD way_dismissThenShowInfoWithStatus:@"无更多记录"];
        return;

    }
    NSMutableDictionary *paramsDic =[[NSMutableDictionary alloc]initWithDictionary:@{@"token":[SUMUser shareUser].token}];
    [paramsDic setObject:[NSString stringWithFormat:@"%d",_page] forKey:@"page"];
    NSString *paramsString = [NSString encryptedByGBKAES:[paramsDic JSONString]];
    [SUMRequest startWithDomainString:[CPGlobalDataManager shareGlobalData].domainUrlString
                              apiName:CPSerVerAPINameForAPIUserCheckinList
                               params:@{@"data":paramsString}
                         rquestMethod:YTKRequestMethodGet
           completionBlockWithSuccess:^(__kindof SUMRequest *request) {

               NSString *alertMsg = @"";
               if (request.resultIsOk) {
                   
                   NSDictionary *dataInfo = [request.resultInfo DWDictionaryForKey:@"data"];
                   NSArray *items = [dataInfo DWArrayForKey:@"items"];
                   
                   _totalPage = [[dataInfo DWStringForKey:@"totalPage"]intValue];
                   if (_totalPage>_page) {
                       _page++;
                   }
                   
                   if (items.count>0) {
                       
                       [_dataList addObjectsFromArray:items];
                       [_tableView reloadData];
                       [_tableView.mj_footer endRefreshing];

                   }else{
                       alertMsg = @"无更多记录";
                       [_tableView.mj_footer endRefreshingWithNoMoreData];
                   }
                   
               }else{
                   [_tableView.mj_footer endRefreshing];
                   alertMsg = request.requestDescription;
               }
               [SVProgressHUD way_dismissThenShowInfoWithStatus:alertMsg];
               
               
           } failure:^(__kindof SUMRequest *request) {
               
               [_tableView.mj_footer endRefreshing];
               [SVProgressHUD way_showInfoCanTouchAutoDismissWithStatus:@"网络异常"];
           }];
}

@end