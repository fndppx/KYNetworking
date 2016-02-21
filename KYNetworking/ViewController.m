//
//  ViewController.m
//  KYNetworking
//
//  Created by keyan on 16/2/17.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import "ViewController.h"
#import "KYNetworkManager.h"
#import "KYRequestItem.h"
#import "KYDateCenterExtend+Test.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self selRequestAction];
//    [self blockRequestAction];
//    [self delegateRequestAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)blockRequestAction
{
    [KYNetworkManager postReqeustWithURL:@"http://www.perasst.com:8081/perasst_v2/user/login.pa" params:@{@"userName":@"18538320461",@"password":@"123456"} successBlock:^(id returnData,int code,NSString *msg) {
        
        NSLog(@"----%@",returnData);
        
    } failureBlock:^(NSError *error) {
        
        NSLog(@"-----%@",error.localizedDescription);
        
    } showHUD:YES];
}
- (void)selRequestAction
{
    
    for (int i = 0; i<10; i++) {
//        [ [KYDateCenterExtend sharedDataCenterExtend]
//         sendVideoBlockListWithTenant_id:@"1111111532"page_id:@"0"
//         user_id:@""
//         RequestTarget:self
//         successSEL:@selector(sendVideoBlockListWithTenant_idSuccess:)
//         failSEL:@selector(sendVideoBlockListWithTenant_idFailed:)
//         isReadLocalCache:NO];
        

    }
    [ [KYDateCenterExtend sharedDataCenterExtend]
     sendVideoBlockListWithTenant_id:@"1111111532"page_id:@"0"
     user_id:@""
     RequestTarget:self
     successSEL:@selector(sendVideoBlockListWithTenant_idSuccess:)
     failSEL:@selector(sendVideoBlockListWithTenant_idFailed:)
     isReadLocalCache:NO];
//

//     [KYNetworkManager postReqeustWithURL:@"http://www.perasst.com:8081/perasst_v2/user/login.pa" params:@{@"userName":@"18538320461",@"password":@"123456"} target:self action:@selector(finishedRequest:didFaild:) showHUD:YES];
}

- (void)sendVideoBlockListWithTenant_idSuccess:(KYResponseItem*)item
{
    
}
- (void)sendVideoBlockListWithTenant_idFailed:(KYResponseItem*)item
{
    
}
- (void)delegateRequestAction
{
    [KYNetworkManager postReqeustWithURL:@"http://www.perasst.com:8081/perasst_v2/user/login.pa" params:@{@"userName":@"18538320461",@"password":@"123456"} delegate:self showHUD:YES];

}

#pragma mark - KYAsiNetworkDelegate

- (void)requestDidFinishLoading:(NSDictionary *)returnData
{
    NSLog(@"-----%@",returnData);
}

- (void)requestdidFailWithError:(NSError *)error
{
    
}
#pragma mark - target
- (void)finishedRequest:(id)data didFaild:(NSError*)error
{
    NSLog(@"---%@-%@",data,error);
}





@end
