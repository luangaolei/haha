//
//  HomeViewController.m
//  Electricity
//
//  Created by lgl on 2017/6/13.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeaderView.h"

@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>{
    UICollectionView *_collectionView;
    NSMutableArray *_dataSource;
    UIView *searchView;
    HomeHeaderView *headerView;
    BOOL isNav;
    
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.isHideLeftPop = YES;
    _dataSource = [NSMutableArray arrayWithCapacity:0];

    [self createNavTitleView];
    [self createCollectView];

    [self.view addSubview:[self createSearchView:YES]];
    
    [self downLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (isNav) {
        self.navigationController.navigationBar.alpha = 1.0;
        self.navigationController.navigationBar.hidden = NO;
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    } else {
        self.navigationController.navigationBar.alpha = 0.0;
        self.navigationController.navigationBar.hidden = YES;
    }
}

- (void)createNavTitleView{
    self.navigationItem.titleView = [self createSearchView:NO];
}

- (UIView *)createSearchView:(BOOL)isView{
    searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 44)];
    if (isView) {
        searchView.frame = CGRectMake(15 * KSizeScale, 20, WIDTH - 23 * KSizeScale, 44);
    }else{
        searchView.frame = CGRectMake(0, 0, WIDTH, 44);
    }
    searchView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];

    UIButton *_searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _searchButton.frame = CGRectMake(1, 9 * KSizeScale, CGRectGetWidth(searchView.frame) - 50 * KSizeScale, 26 * KSizeScale);
    _searchButton.contentHorizontalAlignment = 1;
    _searchButton.backgroundColor = [UIColor whiteColor];
    _searchButton.titleLabel.font = [UIFont fontWithName:nil size:k12Special_font * KSizeScale];
    [_searchButton setTitle:@"搜索帖子、用户、商品" forState:UIControlStateNormal];
    [_searchButton setTitleColor:[UIColor colorFromHexString:K9a9a9a] forState:UIControlStateNormal];
    [_searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [_searchButton addTarget:self action:@selector(seacrhClick:) forControlEvents:UIControlEventTouchUpInside];
    _searchButton.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    _searchButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    _searchButton.layer.borderColor = [UIColor colorFromHexString:K9a9a9a].CGColor;
    _searchButton.layer.borderWidth = 0.5;
    [searchView addSubview:_searchButton];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setFrame:CGRectMake(CGRectGetMaxX(_searchButton.frame) + 20 * KSizeScale, 14.5, 18, 15)];
    [rightBtn setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(messageClick:) forControlEvents:UIControlEventTouchUpInside];
    [searchView addSubview:rightBtn];
    
    return searchView;
}

- (void)createCollectView{
    __weak __typeof(self)weakSelf = self;

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 49) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor colorFromHexString:Kf0f5f5];
    [self.view addSubview:_collectionView];
    _collectionView.contentInset = UIEdgeInsetsMake((WIDTH/2 + 200 * KSizeScale), 0, 0, 0);
    headerView = [[HomeHeaderView alloc]initWithFrame:CGRectMake(0, -(WIDTH/2 + 200 * KSizeScale), WIDTH, (WIDTH/2 + 200 * KSizeScale)) andData:nil andVC:weakSelf];
    [_collectionView addSubview:headerView];

//    [_collectionView registerClass:[MoreColumnCollectionViewCell class] forCellWithReuseIdentifier:@"moreColumn"];
}

- (void)downLoad{
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    PumpkinColumnModel *model = (PumpkinColumnModel *)_dataSource[indexPath.row];
//    MoreColumnCollectionViewCell *cell = (MoreColumnCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"moreColumn" forIndexPath:indexPath];
//    [cell refreshWithModel:model];
    
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(120 * KSizeScale, 100 * KSizeScale);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(7 * KSizeScale, 0 * KSizeScale, 7 * KSizeScale, 0 * KSizeScale);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 7 * KSizeScale;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 7 * KSizeScale;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

- (void)seacrhClick:(UIButton *)button{
    
}

- (void)messageClick:(UIButton *)button{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y >= -64) {
        CGFloat alpha = MIN(1, (WIDTH + scrollView.contentOffset.y)/WIDTH);
        self.navigationController.navigationBar.hidden = NO;
        self.navigationController.navigationBar.alpha = alpha;
        
        isNav = YES;
//        searchView.hidden = NO;
    } else {
        self.navigationController.navigationBar.hidden = YES;
        self.navigationController.navigationBar.alpha = 0.0;
        
        isNav = NO;
//        searchView.hidden = YES;
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
