//
//  getAllPhotos_OS7.h
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/28.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface getAllPhotos_OS7 : NSObject



+(getAllPhotos_OS7 *)sharedGetAllPhoto;

-(NSArray *)getAllPhotos;
-(NSArray*)getAllPhotos_H;
@end
