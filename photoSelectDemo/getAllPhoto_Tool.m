//
//  getAllPhoto_Tool.m
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/28.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import "getAllPhoto_Tool.h"

@implementation getAllPhoto_Tool

+(getAllPhoto_Tool *)sharedGetAllPhoto
{
    static getAllPhoto_Tool *sharedsharedGetAllPhotoTools=nil;
    @synchronized(sharedsharedGetAllPhotoTools) {
        if (!sharedsharedGetAllPhotoTools) {
            sharedsharedGetAllPhotoTools=[[getAllPhoto_Tool alloc]init];
        }
    }
    return sharedsharedGetAllPhotoTools;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.photo=[NSMutableArray arrayWithCapacity:0];
        self.photo_h=[NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

-(NSArray *)getAllPhoto
{  
    if (!(self.photo.count)) {
        [self.photo setArray:[[getAllPhotos_OS7 sharedGetAllPhoto] getAllPhotos]];
    }
    return self.photo;
}

-(NSArray *)getAllPhoto_H
{
    if (!(self.photo_h.count)) {
        [self.photo_h setArray:[[getAllPhotos_OS7 sharedGetAllPhoto] getAllPhotos_H]];
    }
    return self.photo_h;
}
@end
