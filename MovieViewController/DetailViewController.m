//
//  DetailViewController.m
//  MovieViewController
//
//  Created by Arsalan Vakili on 2015-07-01.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "DetailViewController.h"
#import "detailMovieViewCell.h"

@interface DetailViewController ()

@property NSMutableArray *objects;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *reviewURL= [NSURL URLWithString:self.movie.review];
    
    NSURLSessionDataTask *task= [[NSURLSession sharedSession] dataTaskWithURL:reviewURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *jsonError;
        
        NSDictionary *reviews= [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (! reviews) {
            NSLog(@"There was an error: %@",error);
            
        }
        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                self.objects = reviews[@"reviews"];
                [self.collectionView reloadData];
            });
        }
        
    }];
    
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.objects count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    detailMovieViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"reviewCell" forIndexPath:indexPath ];
    NSDictionary *reviews= self.objects[indexPath.item];
    
    cell.reviewNameLabel.text= reviews[@"critic"];
    cell.reviewDescreiptionTextView.text= reviews[@"quote"];
    cell.reviewStarLabel.text= reviews[@"date"];
    
    
    // make thar a dictionary
    
    return cell;
}


@end
