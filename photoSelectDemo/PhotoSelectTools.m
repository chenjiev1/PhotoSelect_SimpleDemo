//
//  PhotoSelectTools.m
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/25.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import "PhotoSelectTools.h"


@interface PhotoSelectTools ()
@property(nonatomic,strong)PhotoViewController *photoVC;
@property(nonatomic,strong)NSMutableArray *photo;
@property(nonatomic,strong)NSMutableArray *photo_H;
@end

@implementation PhotoSelectTools

+(PhotoSelectTools *)sharedPhotoPhotoSelect
{
    static PhotoSelectTools *sharedPhotoPhotoSelectTools=nil;
    @synchronized(sharedPhotoPhotoSelectTools) {
        if (!sharedPhotoPhotoSelectTools) {
            sharedPhotoPhotoSelectTools=[[PhotoSelectTools alloc]init];
        }
    }
    return sharedPhotoPhotoSelectTools;
}

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.photoVC=[[PhotoViewController alloc]init];
        self.photo=[NSMutableArray arrayWithCapacity:0];
        self.photo_H=[NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

-(void)LoadingPhoto:(void (^)(PhotoViewController *pho))load
{
    
    __block NSMutableArray *arr=self.photo;
    __block NSMutableArray *arr_h=self.photo_H;
    self.photoVC.savePhoto=^(NSArray *photo,NSArray *photo_H)
    {
        if (arr.count) {
            [arr removeAllObjects];
            [arr_h removeAllObjects];
        }
        if (photo.count) {
            [arr addObjectsFromArray:photo];
            [arr_h addObjectsFromArray:photo_H];
        }
    };
    if (load)
    {
        load(self.photoVC);
    }
    
}
/**
 *  得到所有图片数组 有2个元素 0：略缩图数组 1：高清图数组
 *
 *  @return 图片数组
 */
-(NSArray*)getSelectPhoto
{
    NSArray *Arr=[NSArray arrayWithObjects:self.photo,self.photo_H, nil];
    return Arr;
}
-(void)dealloc
{
}

@end
