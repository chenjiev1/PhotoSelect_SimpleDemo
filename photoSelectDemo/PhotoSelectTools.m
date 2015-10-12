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
    if (load)
    {
        load(self.photoVC);
    }
    
}




-(void)dealloc
{
    
}

@end
