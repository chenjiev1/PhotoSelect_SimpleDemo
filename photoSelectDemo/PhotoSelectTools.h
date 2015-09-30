//
//  PhotoSelectTools.h
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/25.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoViewController.h"


@interface PhotoSelectTools : NSObject

+(PhotoSelectTools *)sharedPhotoPhotoSelect;
/**
 *  进入图片选择
 *
 *  @param load 中PhotoViewController *pho 为图片控制器
 */
-(void)LoadingPhoto:(void(^)(PhotoViewController *pho))load;

//返回所选图片
-(NSArray *)getSelectPhoto;


@end
