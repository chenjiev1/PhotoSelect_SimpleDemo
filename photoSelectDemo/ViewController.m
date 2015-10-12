//
//  ViewController.m
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/24.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoSelectTools.h"

#define iden @"cell"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,photoSelectProtocol>

@property(nonatomic,strong)NSMutableArray *pho;
@property(nonatomic,strong)UICollectionView *PhotoCollection;

@end

@implementation ViewController

@synthesize pho = _pho;


-(NSMutableArray *)pho
{
    if (!_pho) {
        _pho=[[NSMutableArray alloc]init];
    }
    return _pho;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%g",[[[UIDevice currentDevice] systemVersion] floatValue]);
    self.view.backgroundColor=[UIColor blueColor];
    UIButton *but=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame=CGRectMake(140, 70, 60, 80);
    [self.view addSubview:but];
    but.backgroundColor=[UIColor yellowColor];
    [but addTarget:self action:@selector(logingPhoto) forControlEvents:UIControlEventTouchUpInside];
    [self setUIWithCollection];
}

-(void)setUIWithCollection
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=CGSizeMake(60, 80);
    
    self.PhotoCollection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 200, 200, 200) collectionViewLayout:layout];
    [self.PhotoCollection registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:iden];
    self.PhotoCollection.dataSource=self;
    self.PhotoCollection.delegate=self;
    self.PhotoCollection.backgroundColor=[UIColor grayColor];
    [self.view addSubview:self.PhotoCollection];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (!self.pho.count) {
        return 0;
    }
    else
    {
        return self.pho.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell=(PhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:iden forIndexPath:indexPath];

    [cell setUI:[self.pho objectAtIndex:indexPath.row]];
    return cell;
}

-(void)logingPhoto
{
    NSLog(@"进入");
    //跳入图片选择
    [[PhotoSelectTools sharedPhotoPhotoSelect] LoadingPhoto:^(PhotoViewController *pho) {
        [self presentViewController:pho animated:YES completion:nil];
        pho.delegate=self;
    }];
}
/**
 *  协议代理方法 返回取得的图片
 *
 */
-(void)returnPhotos:(NSArray *)Photos and:(NSArray *)Photos_H
{
    if (self.pho) {
        [self.pho removeAllObjects];
        [_pho setArray:Photos];
    }
    if (self.pho.count)
    {
        [self.PhotoCollection reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
