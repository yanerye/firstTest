//
//  LoginViewController.m
//  test
//
//  Created by 脉络 on 2018/11/26.
//  Copyright © 2018 脉络. All rights reserved.
//

#import "LoginViewController.h"
#import "WXApi.h"


@interface LoginViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dateArray;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"测试1";
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dateArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text =[NSString stringWithFormat:@"这是第%@行",self.dateArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
//    req.bText = YES;
//    req.text = @"分享的内容";
//    req.scene = WXSceneSession;
//    [WXApi sendReq:req];
    
    WXMediaMessage *message=[WXMediaMessage message];
    
    message.title=@"优益齿";
    message.description=@"优益齿-您身边的口腔护理专家\n欢迎下载优益齿";
    [message setThumbImage:[UIImage imageNamed:@"logo80"]];
    WXWebpageObject *webPageObject=[WXWebpageObject object];
    webPageObject.webpageUrl=@"http://www.youyichi.com/wx/appDownload";
    message.mediaObject=webPageObject;
    SendMessageToWXReq *req=[[SendMessageToWXReq alloc]init];
    req.bText=NO;
    req.message=message;
    req.scene = WXSceneTimeline;
    [WXApi sendReq:req];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath

{
    
      return YES;
    
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
      return UITableViewCellEditingStyleDelete;
}


- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
       UITableViewRowAction *layTopRowAction1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
          [self.dateArray removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
        
        
            }];
    
        layTopRowAction1.backgroundColor = [UIColor redColor];
    
        
    
//        UITableViewRowAction *layTopRowAction2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"更多" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
//
//                NSLog(@"更多");
//
//
//
//            }];
//
//        layTopRowAction2.backgroundColor = [UIColor grayColor];
    
        NSArray *arr = @[layTopRowAction1];
    
        return arr;
    
}



- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView  new];
    }
    return _tableView;
}
- (NSMutableArray *)dateArray{
    if (!_dateArray) {
        _dateArray = [NSMutableArray arrayWithObjects:@"yp1",@"yp2",@"yp3",@"yp4",@"yp5",@"yp6",@"yp7",@"yp8",@"yp9",@"yp10",@"yp11",@"yp12", nil];
    }
    return _dateArray;
}


@end
