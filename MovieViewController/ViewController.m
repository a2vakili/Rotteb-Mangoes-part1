//
//  ViewController.m
//  MovieViewController
//
//  Created by Arsalan Vakili on 2015-07-01.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"
#import "MovieViewCell.h"

@interface ViewController ()

@property NSMutableArray *movies;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self collectionView] setDataSource:self];
    [[self collectionView] setDelegate:self];
    
    //NSString *urlString= @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=kts883tcrfnpqrxgzqzjmmfk"; // my api key
    
    NSString *urlString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=sr9tdu3checdyayjz85mff8j"; // older api key
    
    NSURL *url= [NSURL URLWithString:urlString];
    
    NSLog(@"url is %@",url);
    
    NSURLSessionDataTask *task= [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
       
        
        
        
        NSError *jsonError;
        
        NSDictionary *moviesJSON= [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *listOfMovies = moviesJSON[@"movies"];
        
        
      //  NSLog(@"%@",movies);
        
        if(!listOfMovies){
            NSLog(@"There was an error : %@",error);
        }
        else{
            NSMutableArray *movieInfo= [NSMutableArray array];
            
            for (NSDictionary *movieDict in listOfMovies) {
                Movie *newMovie= [[Movie alloc]init];
                newMovie.title= movieDict[@"title"];
                
                NSURL *thumnailURL= [NSURL URLWithString:movieDict[@"posters"][@"thumbnail"]];
                
                NSData *dataOfImage= [NSData dataWithContentsOfURL:thumnailURL];
                UIImage *img= [[UIImage alloc]initWithData:dataOfImage];
                
                newMovie.thumbnail= img;
                
                [movieInfo addObject:newMovie];
                
            }
            
            dispatch_async(dispatch_get_main_queue(),^{
                self.movies= movieInfo;
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


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.movies.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MovieViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath ];
    
    Movie *movie= self.movies[indexPath.item];
  
    
    cell.movieImageView.image= movie.thumbnail;
    
    return cell;
    
}






@end
