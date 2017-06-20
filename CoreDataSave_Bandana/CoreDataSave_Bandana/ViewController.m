//
//  ViewController.m
//  CoreDataSave_Bandana
//
//  Created by Bandana Choudhury on 18/06/17.
//  Copyright © 2017 Omniroid. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import <CoreData/CoreData.h>
#import "CollectionViewCell.h"

@interface ViewController ()
@property (strong) NSMutableArray *devices;
@end

@implementation ViewController
-(NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
}

-(void)viewDidAppear:(BOOL)animated {
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.collectionview reloadData];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.collectionview.dataSource = self;
    self.collectionview.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.devices.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSManagedObjectModel *device = [self.devices objectAtIndex:indexPath.row];
    
    [cell.nameLabel setText:[device valueForKey:@"name"]];
    [cell.phonenoLabel setText:[device valueForKey:@"phoneno"]];
    

    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"Update"]) {
        
        NSManagedObjectModel *SelectedDevice = [self.devices objectAtIndex:[self.collectionview indexPathsForSelectedItems].lastObject ];
        DetailViewController *addView = segue.destinationViewController;
        addView.device = SelectedDevice;
    }
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
