//
//  ViewController.m
//  InstaKilo
//
//  Created by Jeff Eom on 2016-07-13.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "MyImage.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property NSMutableArray *photoArray;
@property NSMutableDictionary *groupByLocation;
@property NSMutableDictionary *groupBySubject;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyImage *image1 = [[MyImage alloc] initWithImage:[UIImage imageNamed:@"photo1.jpg"] subject:@"Family" andLocation:@"Vancouver"];
    MyImage *image2 = [[MyImage alloc] initWithImage:[UIImage imageNamed:@"photo2.jpg"] subject:@"Friends" andLocation:@"Vancouver"];
    MyImage *image3 = [[MyImage alloc] initWithImage:[UIImage imageNamed:@"photo3.jpg"] subject:@"Food" andLocation:@"Toronto"];
    MyImage *image4 = [[MyImage alloc] initWithImage:[UIImage imageNamed:@"photo4.jpg"] subject:@"Friends" andLocation:@"Toronto"];
    MyImage *image5 = [[MyImage alloc] initWithImage:[UIImage imageNamed:@"photo5.jpg"] subject:@"Family" andLocation:@"Edmonton"];
    MyImage *image6 = [[MyImage alloc] initWithImage:[UIImage imageNamed:@"photo6.jpg"] subject:@"Food" andLocation:@"Edmonton"];
    MyImage *image7 = [[MyImage alloc] initWithImage:[UIImage imageNamed:@"photo7.jpg"] subject:@"Family" andLocation:@"Seoul"];
    MyImage *image8 = [[MyImage alloc] initWithImage:[UIImage imageNamed:@"photo8.jpg"] subject:@"Friends" andLocation:@"Seoul"];
    MyImage *image9 = [[MyImage alloc] initWithImage:[UIImage imageNamed:@"photo9.jpg"] subject:@"Food" andLocation:@"Tokyo"];
    MyImage *image10 = [[MyImage alloc] initWithImage:[UIImage imageNamed:@"photo10.jpg"] subject:@"Food" andLocation:@"Tokyo"];
    
    self.photoArray = [@[image1,
                       image2,
                       image3,
                       image4,
                       image5,
                       image6,
                       image7,
                       image8,
                       image9,
                       image10] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.photoArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.myImage.image = self.photoArray[indexPath.row];
    
    return cell;
    
}



@end
