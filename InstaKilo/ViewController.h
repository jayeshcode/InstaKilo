//
//  ViewController.h
//  InstaKilo
//
//  Created by Jayesh Wadhwani on 2016-05-18.
//  Copyright © 2016 Jayesh Wadhwani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (strong, nonatomic) UIImage *myImage;

@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegment;
- (IBAction)actionOnSegment:(id)sender;


@end

