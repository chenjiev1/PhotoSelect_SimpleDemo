//
//  PhotoViewController.m
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/24.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionViewCell.h"

#define iden @"photocell"

@interface PhotoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{

}


@property(nonatomic,strong)UICollectionView *PhotoCollection;
//所有图片（略缩）
@property(nonatomic,strong) NSMutableArray *Allphoto;
//所有图片（高清）
@property(nonatomic,strong) NSMutableArray *Allphoto_H;
//选中图片（略缩）
@property(nonatomic,strong)NSMutableArray *selectPhoto;
//选中图片（高清）
@property(nonatomic,strong)NSMutableArray *selectPhoto_H;
@end


@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化选中数组和图片数组；
    self.view.backgroundColor=[UIColor whiteColor];
    self.Allphoto=[NSMutableArray arrayWithCapacity:0];
    self.selectPhoto=[NSMutableArray arrayWithCapacity:0];
    self.Allphoto_H=[NSMutableArray arrayWithCapacity:0];
    self.selectPhoto_H=[NSMutableArray arrayWithCapacity:0];
    /**
     *  得到全部图片
     */
    [self setUIWithCollection];
    [self setNavigationItem];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //开始获取
        [self getAllPhoto];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //刷新
        [self getAllPhoto];
        [self.PhotoCollection reloadData];
    });

}

-(void)setNavigationItem
{
    UIButton *back_but=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    back_but.frame=CGRectMake(10, 24, 30, 40);
    [back_but setTitle:@"取消" forState:UIControlStateNormal];
    back_but.titleLabel.font=[UIFont systemFontOfSize:13];
    [self.view addSubview:back_but];
    back_but.tag=1;
    [back_but addTarget:self action:@selector(ButtonClike:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *sel_but=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    sel_but.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width)-40, 24, 30, 40);
    [sel_but setTitle:@"确定" forState:UIControlStateNormal];
    sel_but.titleLabel.font=[UIFont systemFontOfSize:13];
    [sel_but addTarget:self action:@selector(ButtonClike:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sel_but];
    sel_but.tag=2;
    
    UIButton *reload_but=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    reload_but.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width)/2-10, 24, 30, 40);
    [reload_but setTitle:@"刷新" forState:UIControlStateNormal];
    reload_but.titleLabel.font=[UIFont systemFontOfSize:13];
    [reload_but addTarget:self action:@selector(ButtonClike:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reload_but];
    reload_but.tag=3;
}

-(void)ButtonClike:(UIButton *)sender
{
    
    switch (sender.tag) {
        case 1:
        {
            [self.PhotoCollection reloadData];
            [self.selectPhoto removeAllObjects];
            [self.selectPhoto_H removeAllObjects];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case 2:
        {
            if (self.savePhoto) {
                self.savePhoto(self.selectPhoto,self.selectPhoto_H);
            }
            [self.PhotoCollection reloadData];
            [self.selectPhoto removeAllObjects];
            [self.selectPhoto_H removeAllObjects];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        case 3:
        {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                [self getAllPhoto];
                [self.selectPhoto removeAllObjects];
                [self.selectPhoto_H removeAllObjects];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.PhotoCollection setContentOffset:CGPointMake(0, 0) animated:YES];
                    [self.PhotoCollection reloadData];
                    
                });
            });
        }
            break;
        default:
            break;
    }
}

-(void)setUIWithCollection
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=CGSizeMake(100, 120);
    
    
    self.PhotoCollection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) collectionViewLayout:layout];
    [self.PhotoCollection registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:iden];
    self.PhotoCollection.dataSource=self;
    self.PhotoCollection.delegate=self;
    self.PhotoCollection.backgroundColor=[UIColor grayColor];
    [self.view addSubview:self.PhotoCollection];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.Allphoto.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell=(PhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:iden forIndexPath:indexPath];
   
    [cell setUI:self.Allphoto[indexPath.row]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell=(PhotoCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [cell YesOrNoSelect];
    if (cell.isslect) {
        [self.selectPhoto addObject:self.Allphoto[indexPath.row]];
        [self.selectPhoto_H addObject:self.Allphoto_H[indexPath.row]];
    }
    else
    {
        [self.selectPhoto removeObject:self.Allphoto[indexPath.row]];
        [self.selectPhoto_H addObject:self.Allphoto_H[indexPath.row]];
    }
}


-(void)getAllPhoto
{
    [self.Allphoto setArray:[[getAllPhoto_Tool sharedGetAllPhoto] getAllPhoto]];
    [self.Allphoto_H setArray:[[getAllPhoto_Tool sharedGetAllPhoto] getAllPhoto_H]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dealloc
{
    NSLog(@"dele");
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
