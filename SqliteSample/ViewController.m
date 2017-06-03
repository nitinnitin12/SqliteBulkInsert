//
//  ViewController.m
//  SqliteSample
//
//  Created by Nitin on 05/12/16.
//  Copyright © 2016 AIPL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


//This is a new change


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


-(IBAction)insertRecords:(id)sender{
    
    NSLog(@"Insert Started");
    
    NSDate *start = [NSDate date];
    // do stuff...
//    NSTimeInterval timeInterval = [start timeIntervalSinceNow];
    
    SQLite *sqlObj=[[SQLite alloc] initWithSQLFile:@"adminActivity.sqlite"];
    
    [sqlObj openDb];
    
    for (int i = 0; i<90000; i++) {
        
        NSString *str = [[NSString alloc] initWithFormat:@"%d",i];
        
        NSString *query = [NSString stringWithFormat:@"insert into latestvisiteddates_stockiest (date,contactid,jointwork,stockiestname) VALUES ('10','20','30','%@')",str];
        
        [sqlObj insertDb:query];
    }

    
    [sqlObj closeDb];
    
    NSTimeInterval timeInterval = fabs([start timeIntervalSinceNow]);
    
    NSLog(@"timeInterval = %f",timeInterval);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
