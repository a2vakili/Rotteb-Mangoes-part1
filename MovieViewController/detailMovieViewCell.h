//
//  detailMovieViewCell.h
//  MovieViewController
//
//  Created by Arsalan Vakili on 2015-07-02.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailMovieViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *reviewNameLabel;

@property (weak, nonatomic) IBOutlet UITextView *reviewDescreiptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *reviewStarLabel;
@end
