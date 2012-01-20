//
//  StatementViewController.h
//  XBRL
//
//  Created by David Kay on 1/19/12.
//  Copyright (c) 2012 Gargoyle Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Company;

@interface StatementViewController : UITableViewController

@property (retain) NSArray *data;
@property (retain) Company *company;

- (id)initWithCompany:(Company *)company;

@end
