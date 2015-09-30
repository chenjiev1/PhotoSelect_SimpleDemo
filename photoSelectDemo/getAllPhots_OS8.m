//
//  getAllPhots_OS8.m
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/28.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import "getAllPhots_OS8.h"


@implementation getAllPhots_OS8
/*
+(NSArray *)getAllPhotos
{
    __block NSMutableArray *bloke_arr=[NSMutableArray arrayWithCapacity:0];
    [bloke_arr removeAllObjects];
    if (([[[UIDevice currentDevice] systemVersion] floatValue])>=8)
    {
        
        // 获取所有资源的集合，并按资源的创建时间排序
        PHFetchOptions *options = [[PHFetchOptions alloc] init];
        options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
        PHFetchResult *assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
        
        // 在资源的集合中获取第一个集合，并获取其中的图片
        PHCachingImageManager *imageManager = [[PHCachingImageManager alloc] init];
        
        for (int i=0; i<assetsFetchResults.count; i++)
        {
            PHAsset *asset = assetsFetchResults[i];
            [imageManager requestImageForAsset:asset
                                    targetSize:PHImageManagerMaximumSize
                                   contentMode:PHImageContentModeAspectFill
                                       options:nil
                                 resultHandler:^(UIImage *result, NSDictionary *info)
             {
                 [bloke_arr addObject:result];
                 
             }];
        }
    }
    return bloke_arr;
}
*/
@end
