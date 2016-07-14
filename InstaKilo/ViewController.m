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
#import "HeaderCollectionReuseableView.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property NSMutableArray *photoArray;
@property NSMutableDictionary *groupByLocation;
@property NSMutableDictionary *groupBySubject;

@property NSMutableArray *possibleLocation;
@property NSMutableArray *possibleSubject;

@property NSMutableArray *locationArray;
@property NSMutableArray *subjectArray;

@property (nonatomic) BOOL isLocation;
@property NSString *status;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.photoArray = [[NSMutableArray alloc] init];
    self.groupByLocation = [[NSMutableDictionary alloc] init];
    self.groupBySubject = [[NSMutableDictionary alloc] init];
    
    self.possibleLocation = [[NSMutableArray alloc] init];
    self.possibleSubject = [[NSMutableArray alloc] init];
    
    self.locationArray = [[NSMutableArray alloc] init];
    self.subjectArray = [[NSMutableArray alloc] init];
    
    self.status = @"subject";
    
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
    
    for(MyImage *pic in self.photoArray){
        if(![self.possibleLocation containsObject:pic.location]){
            [self.possibleLocation addObject:pic.location];
        }
        
        if(![self.possibleSubject containsObject:pic.subject]){
            [self.possibleSubject addObject:pic.subject];
        }
    }
    
    for (NSString * aLocation in self.possibleLocation) {
        NSMutableArray * imagesByLocation = [NSMutableArray array];
        for (MyImage * pic in self.photoArray) {
            if ([pic.location isEqualToString:aLocation]) {
                [imagesByLocation addObject:pic];
            }
        }
        [self.groupByLocation setValue:imagesByLocation
                                forKey:aLocation];
    }
    
    for (NSString * aSubject in self.possibleSubject) {
        NSMutableArray * imagesBySubject = [NSMutableArray array];
        for (MyImage * pic in self.photoArray) {
            if ([pic.subject isEqualToString:aSubject]) {
                [imagesBySubject addObject:pic];
            }
        }
        [self.groupBySubject setValue:imagesBySubject
                               forKey:aSubject];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    if([self isLocation]){
        return [self.possibleLocation count];
    }else{
        return [self.possibleSubject count];
    }
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if([self isLocation]){
        NSString *stringSection = [self.groupByLocation allKeys][section];
        NSArray *imagesInSection = self.groupByLocation[stringSection];
        
        return [imagesInSection count];
    }else{
        NSString *stringSection = [self.groupBySubject allKeys][section];
        NSArray *imagesInSection = self.groupBySubject[stringSection];
        
        return [imagesInSection count];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if([self isLocation]){
        NSString *section = [self.groupByLocation allKeys][indexPath.section];
        NSArray *imagesInSection = self.groupByLocation[section];
        
        MyImage *image = imagesInSection[indexPath.item];
        cell.myImage.image = image.image;
        
        return cell;
    }else{
        NSString *section = [self.groupBySubject allKeys][indexPath.section];
        NSArray *imagesInSection = self.groupBySubject[section];
        
        MyImage *image = imagesInSection[indexPath.item];
        cell.myImage.image = image.image;
        
        return cell;
    }
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        HeaderCollectionReuseableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        
        if([self isLocation]){
            NSString *section = [self.groupByLocation allKeys][indexPath.section];
            headerView.sectionLabel.text = section;
            return headerView;
        }else{
            NSString *section = [self.groupBySubject allKeys][indexPath.section];
            headerView.sectionLabel.text = section;
            return headerView;
        }
    }
    return nil;
}

- (BOOL)isLocation{
    if([self.status containsString:@"location"]){
        return TRUE;
    }else{
        return FALSE;
    }
}

- (IBAction)buttonPressed:(id)sender {
    
    NSLog(@"Pressed");
    if([self isLocation]){
        [self.collectionView reloadData];
        self.status = @"subject";
    }else{
        [self.collectionView reloadData];
        self.status = @"location";
    }
}


@end
