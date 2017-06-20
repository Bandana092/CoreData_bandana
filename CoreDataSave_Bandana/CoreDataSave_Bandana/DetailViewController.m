//
//  DetailViewController.m
//  CoreDataSave_Bandana
//
//  Created by Bandana Choudhury on 18/06/17.
//  Copyright © 2017 Omniroid. All rights reserved.
//

#import "DetailViewController.h"
#import <CoreData/CoreData.h>
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize device;
-(NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.device) {
        [self.nameTF setText:[self.device valueForKey:@"name"]];
        [self.phoneTf setText:[self.device valueForKey:@"phoneno"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.device) {
        [self.device setValue:self.nameTF.text forKey:@"name"];
        [self.device setValue:self.phoneTf.text forKey:@"phoneno"];
            } else {
        
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
        
        [newDevice setValue:self.nameTF.text forKey:@"name"];
        [newDevice setValue:self.phoneTf.text forKey:@"phoneno"];
        
        
    }
    
    
    NSError *error = nil;
    
    if (![context save:&error]) {
        NSLog(@"%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    

}
@end
