//
//  DSViewController.m
//  XBRL
//
//  Created by David Kay on 1/19/12.
//  Copyright (c) 2012 Gargoyle Software. All rights reserved.
//

#import "DSViewController.h"

#import "Company.h"
#import "StatementViewController.h"

@implementation DSViewController

@synthesize companies = _companies;

#pragma mark - Accessor / Mutator Methods

//- (NSArray *)data {
//  return _data;
//}
//
//- (void)setData:(NSArray *)data {
//  [_data release];
//  _data = [data retain];
//}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.

  self.companies = [NSArray arrayWithObjects: 
              [[Company alloc] initWithTicker: @"Mike"],
              [[Company alloc] initWithTicker: @"Liz"],
              [[Company alloc] initWithTicker: @"dan"],
              [[Company alloc] initWithTicker: @"Dave"],
              [[Company alloc] initWithTicker: @"Ken"],
    nil];
  
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Misc Table Methods

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
  //cell.textLabel.text = @"Hello!";
  //cell.textLabel.text = [self.companies objectAtIndex: indexPath.row];
  
  Company *company = [self.companies objectAtIndex: indexPath.row];
  cell.textLabel.text = company.ticker;

}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

// Populate table cells

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  NSInteger count = [self.companies count];
  return count;   
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  static NSString *CellIdentifier = @"Cell";

  // If we have any extra table cells in memory, use that one
  UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

  if (cell == nil) {
    // If we didn't have one, create a new one
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }

  // Then populate it with companies
  [self configureCell: cell
          atIndexPath: indexPath];

  return cell;
}


#pragma mark - Table View Delegate

// Somebody tapped a table cell. What do we do now?

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Navigation logic may go here. Create and push another view controller.
  Company *company = [self.companies objectAtIndex: indexPath.row];
  StatementViewController *vc = [[StatementViewController alloc] initWithCompany: company];

  [self.navigationController pushViewController: vc
                                       animated: YES];

  [vc release];
}


#pragma mark - Cleanup

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached companies, images, etc that aren't in use.
}


@end
