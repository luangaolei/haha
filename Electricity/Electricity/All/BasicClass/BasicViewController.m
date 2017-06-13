//
//  BasicViewController.m
//  Electricity
//
//  Created by lgl on 2017/6/13.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController () <UIGestureRecognizerDelegate>{
    
}

@property (nonatomic,strong) UIBarButtonItem *leftButton;
@property (nonatomic,strong) UIBarButtonItem *space;

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self topbar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.alpha = 1.0;
    self.navigationController.navigationBar.hidden = NO;
}

- (void)setNavTitle:(NSString *)navTitle{
    if (navTitle.length > 0) {
        _topbarLb.text = navTitle;
    }
}

-(void)topbar{
    _topbarLb = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2-100, 12, 200, 20)];
    _topbarLb.font = [UIFont fontWithName:nil size:kNav_font];
    _topbarLb.textColor = [UIColor colorFromHexString:KNavColor];
    _topbarLb.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = _topbarLb;
    
    if (!_isHideLeftPop) {
        _leftButton = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"topbar-back-btn"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] style: UIBarButtonItemStylePlain target:self action:@selector(leftBtnPop)];
        _space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        _space.width = 0;
    }else{
        _leftButton = nil;
        _space = nil;
    }
    self.navigationItem.leftBarButtonItems = @[_space, _leftButton];
}

- (void)leftBtnPop{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1){//关闭主界面的右滑返回
        return NO;
    }else{
        return YES;
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
}

//- (void)createHUD:(NSString*)textStr{
//    HUD = [[MBProgressHUD alloc] initWithView:self.view];
//    UIWindow *window = [self mainWindow];
//    [window addSubview:HUD];
//    HUD.labelText = textStr;
//    HUD.mode = MBProgressHUDModeText;
//    [HUD showAnimated:YES whileExecutingBlock:^{
//        sleep(2);
//    } completionBlock:^{
//        [HUD removeFromSuperview];
//        HUD = nil;
//    }];
//}

- (void)login{
    LoginAndRegisterViewController *loginVC = [[LoginAndRegisterViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:nav animated:YES completion:^{
    }];
    
}

- (UIWindow *)mainWindow{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)]){
        return [app.delegate window];
    }else{
        return [app keyWindow];
    }
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
