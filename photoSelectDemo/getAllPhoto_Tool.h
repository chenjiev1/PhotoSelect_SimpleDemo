//
//  getAllPhoto_Tool.h
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/28.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "getAllPhotos_OS7.h"
//#import "getAllPhots_OS8.h"
@interface getAllPhoto_Tool : NSObject



+(getAllPhoto_Tool *)sharedGetAllPhoto;

@property(nonatomic,strong)NSMutableArray *photo;
@property(nonatomic,strong)NSMutableArray *photo_h;

-(NSArray *)getAllPhoto;

-(NSArray *)getAllPhoto_H;

@end
