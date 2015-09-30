//
//  getAllPhotos_OS7.m
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/28.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import "getAllPhotos_OS7.h"

@interface getAllPhotos_OS7 ()
@property(nonatomic,strong) NSMutableArray *pho_1;
@property(nonatomic,strong) NSMutableArray *pho_2;

@property(nonatomic,strong)ALAssetsLibrary *assetsLibrary;
@end

@implementation getAllPhotos_OS7

+(getAllPhotos_OS7 *)sharedGetAllPhoto
{
    static getAllPhotos_OS7 *haredGetAllPhoto=nil;
    @synchronized(haredGetAllPhoto) {
        if (!haredGetAllPhoto) {
            haredGetAllPhoto=[[getAllPhotos_OS7 alloc]init];
        }
    }
    return haredGetAllPhoto;
}

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.pho_1=[NSMutableArray arrayWithCapacity:0];
        self.pho_2=[NSMutableArray arrayWithCapacity:0];
        self.assetsLibrary=[[ALAssetsLibrary alloc]init];
    }
    return self;
}

-(NSArray*)getAllPhotos
{
    
    __block NSMutableArray *photo_arr=self.pho_1;
    
    [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if (result) {
                UIImage *image= [UIImage imageWithCGImage:result.thumbnail];
                if ([photo_arr indexOfObject:image]) {
                    [photo_arr addObject:image];
                }
            }
        }];
    } failureBlock:^(NSError *error) {
        NSLog(@"获取略缩图片失败");
    }];
    return photo_arr;
}
-(NSArray*)getAllPhotos_H
{
    __block NSMutableArray *photo_arr_H=self.pho_2;
    [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if (result) {
                ALAssetRepresentation *representation = result.defaultRepresentation;
                UIImage *img2=[UIImage imageWithCGImage:[representation fullResolutionImage]];
                if ([photo_arr_H indexOfObject:img2]) {
                    [photo_arr_H addObject:img2];
                }
            }
        }];
    } failureBlock:^(NSError *error) {
        NSLog(@"获取高清图片失败");
    }];
    return photo_arr_H;
}
@end
