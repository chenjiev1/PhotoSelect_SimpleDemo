//
//  PhotoCollectionViewCell.h
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/25.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionViewCell : UICollectionViewCell
//图片
@property(nonatomic,strong)UIImageView *img;
//被选择的标志
@property(nonatomic,strong)UIImageView *selectImg;
//是否被选中
@property(nonatomic,assign)BOOL isslect;
//载入图片
-(void)setUI:(UIImage *)img;
//
-(void)YesOrNoSelect;
@end
