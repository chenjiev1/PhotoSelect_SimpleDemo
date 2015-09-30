//
//  PhotoViewController.h
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/24.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "getAllPhoto_Tool.h"

@interface PhotoViewController : UIViewController

@property(nonatomic,assign)CGSize *photosize;

@property(nonatomic,copy)void(^savePhoto)(NSArray *photo,NSArray *photo_H);


@end
