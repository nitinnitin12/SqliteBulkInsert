//
//  SQLite.h
//  MylanData
//
//  Created by Akshay Kunila on 14/09/13.
//  Copyright (c) 2013 Karbens. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SQLite : NSObject {
	NSString *SQLFilePath;
	sqlite3 *rdb;
	int success;
	int rowid;
}

-(id) initWithSQLFile:(NSString *)sqlfile;
-(void) openDb;
-(void) readDb:(NSString *)sqlQuery;
-(void) insertDb:(NSString *)sqlQuery;
-(NSString *) getColumn:(int)colnum type:(NSString *)text_or_int;
-(BOOL) hasNextRow;
-(BOOL) stepQuery;
-(int) getRowId;
-(void) closeDb;
-(void) updateDb:(NSString *)sqlQuery;
- (NSArray *)executeQuery:(NSString *)query;

@end
