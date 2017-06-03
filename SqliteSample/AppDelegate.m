//
//  AppDelegate.m
//  SqliteSample
//
//  Created by Nitin on 05/12/16.
//  Copyright © 2016 AIPL. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self createEditableCopyOfDatabaseIfNeeded];
    
    return YES;
}


- (void)createEditableCopyOfDatabaseIfNeeded {
    
    // First, test for existence.
    
    BOOL success;
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"adminActivity.sqlite"];
    
    success = [fileManager fileExistsAtPath:writableDBPath];
    NSLog(@"Writable path%@",writableDBPath);
    
    NSString  *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    
    if (success)
    {
//        if(![appVersion isEqualToString:@"2.0.2"])
//        {
//            [fileManager removeItemAtPath:writableDBPath error:&error];
//        }

        NSLog(@"File Exists");
    }
    else
    {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"adminActivity.sqlite"];
        
        NSLog(@"Default DB : %@",defaultDBPath);
        
        success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        
        if (!success) {
            
            NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
            
        }
        else
        {
            NSLog(@"DB copy success");
        }
        
    }
    
    
    
    // The writable database does not exist, so copy the default to the appropriate location.
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
