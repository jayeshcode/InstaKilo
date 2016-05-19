//
//  ViewController.m
//  InstaKilo
//
//  Created by Jayesh Wadhwani on 2016-05-18.
//  Copyright © 2016 Jayesh Wadhwani. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCollectionViewCell.h"

#import "HeaderCollectionReusableView.h"

@interface ViewController ()<UICollectionViewDataSource>
{
    NSArray *twodarray;
    NSArray *imageArray1;
    NSArray *imagearray2;
    NSArray *titleArray;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ((UICollectionViewFlowLayout*)self.myCollectionView.collectionViewLayout).sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);    // Do any additional setup after loading the view, typically from a nib.
    
    imageArray1 = [NSArray arrayWithObjects:@"10404457_839854646067437_5169965704837414960_n.jpg",@"10172693_723221894397380_3030530739270453871_n.jpg",@"1505011_660742217312015_819001551_n.jpg",@"10404457_839854646067437_5169965704837414960_n.jpg",@"10172693_723221894397380_3030530739270453871_n.jpg", nil];
    
    imagearray2 = [NSArray arrayWithObjects:@"319750_396771307042442_1972180169_n.jpg",@"12712_680408408678729_1079717792_n.jpg",@"1451520_639546912764879_1697866209_n.jpg",@"1499519_659731277413109_1870247220_n.jpg", nil];
    [self updateData];
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderCollectionReusableView *header;
    if([kind isEqualToString: UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        NSString *title = titleArray[indexPath.section];
        header.title.text = title;
    }
    return header;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [twodarray count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [twodarray[section]count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.myImageView.image  = [UIImage imageNamed:twodarray[indexPath.section][indexPath.row]];
    return cell;
}

- (IBAction)actionOnSegment:(id)sender {
    [self updateData];
}

- (void)updateData {
    if (self.mySegment.selectedSegmentIndex == 0) {
        twodarray = @[imageArray1, imagearray2];
        titleArray = @[@"Toronto", @"Vancouver"];
    }
    else if(self.mySegment.selectedSegmentIndex == 1) {
        twodarray = @[imagearray2, imageArray1];
        titleArray = @[@"Vancouver", @"Toronto"];
    }
    
    [self.myCollectionView reloadData];
}

@end
