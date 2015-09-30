//
//  PhotoCollectionViewCell.m
//  photoSelectDemo
//
//  Created by 陈捷 on 15/9/25.
//  Copyright © 2015年 陈捷. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell


-(void)setUI:(UIImage *)img
{
    
    self.img=[[UIImageView alloc]initWithFrame:self.contentView.bounds];
    self.selectImg=[[UIImageView alloc]initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:self.img];
    [self.contentView addSubview:self.selectImg];
    self.selectImg.hidden=YES;
    self.selectImg.alpha=0.6;
    self.selectImg.frame=self.contentView.bounds;
    self.selectImg.backgroundColor=[UIColor blueColor];
    
    self.img.image=img;
    
    
    self.isslect=NO;
    

    
}

-(void)YesOrNoSelect
{
    self.isslect=!(self.isslect);
    if (self.isslect) {
        self.selectImg.hidden=NO;
    }
    else
    {
        self.selectImg.hidden=YES;
    }
}

@end
