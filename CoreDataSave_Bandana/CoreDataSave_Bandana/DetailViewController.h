//
//  DetailViewController.h
//  CoreDataSave_Bandana
//
//  Created by Bandana Choudhury on 18/06/17.
//  Copyright © 2017 Omniroid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTf;
@property (weak, nonatomic) IBOutlet UIButton *save;
@property (strong) NSManagedObjectModel *device;
- (IBAction)save:(id)sender;
@end
