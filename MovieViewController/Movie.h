//
//  Movie.h
//  MovieViewController
//
//  Created by Arsalan Vakili on 2015-07-01.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Movie : NSObject

@property(nonatomic,strong) NSString *title;

@property(nonatomic,strong) NSString *review;

@property(nonatomic,strong) UIImage *thumbnail;

//@property(nonatomic,strong) NSURL *movieUrl;

@property(nonatomic,strong) NSString *synopsis;

@end
