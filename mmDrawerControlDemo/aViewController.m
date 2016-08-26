//
//  aViewController.m
//  mmDrawerControlDemo
//
//  Created by IDSBG-00 on 2016/8/25.
//  Copyright © 2016年 IDSBG-00. All rights reserved.
//

#import "aViewController.h"
#import "MMDrawerBarButtonItem.h"

//需要载入这个.h文件， 用category的方式
#import "UIViewController+MMDrawerController.h"

@interface aViewController ()

@end

@implementation aViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加一个按钮，这个按钮是他MMDrawer官方给的。。
    self.navigationItem.leftBarButtonItem = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(leftBtn)];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //设置打开手势为 支持“边边”的手势
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeBezelPanningCenterView];
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //把支持的手势设为none，这样子在别的视图中就不能用这个mm_drawerController了
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone] ;
}
- (void)leftBtn
{
    //手动打开抽屉
//    [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
//        
//    }];
    
    //这个方法是先判断状态，打开的状态它就实行关闭 关闭的状态就打开
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
