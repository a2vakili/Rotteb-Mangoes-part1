//
//  DetailViewController.h
//  MovieViewController
//
//  Created by Arsalan Vakili on 2015-07-01.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "detailMovieViewCell.h"

@interface DetailViewController : UICollectionViewController

@property(nonatomic,strong) Movie *movie;

//
//-(void)setMovie:(Movie *)movie;
//-(Movie *)movie;
////
//
//Movie *movie = [self movie];
//Movie *movie2 = self.movie;


@end
