//
//  GalleryViewController.m
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GalleryViewController.h"
#import "GalleryCell.h"
#import "DetailViewController.h"
#import "TableHeaderView.h"
#import "TableFooterView.h"
#import "AFNetworking.h"

#define kNUMTHUMB_PER_CELL 4

@implementation GalleryViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //This is actually the correct value of rows, but instagram only shows complete rows, whereas below will also show incomplete rows
    //return (int)ceilf([(NSArray *)[self.data valueForKey:@"entries"] count]/(float)kNUMTHUMB_PER_CELL);
    return ([(NSArray *)[self.data valueForKey:@"entries"] count]/kNUMTHUMB_PER_CELL);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    GalleryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[GalleryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];  
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    //Clear out all nested views in the cell - 
    [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //Variables to cacluate the the starting point and ending point of the loop
    int total = [(NSArray *) [self.data valueForKey:@"entries"] count];
    int offset = indexPath.row * kNUMTHUMB_PER_CELL;
    int num_cells = (total - offset >= kNUMTHUMB_PER_CELL) ? kNUMTHUMB_PER_CELL : total - offset;
    
    //Set the images inside the cells
    for(int i = offset; i < (offset + num_cells); i++){
        NSMutableArray *entry = [[self.data valueForKey:@"entries"] objectAtIndex:i];
        NSURL *url = [[NSURL alloc] initWithString: [[[entry valueForKey:@"images"] valueForKey:@"thumbnail"] valueForKey:@"url"]];
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake((i - offset) * 79 + 4, 2, 75, 75);
        [imgView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"thumbnail-loading"]];
        [imgView setTag:i];
        
        [cell.contentView addSubview:imgView];
        
        //Add a tap gesture, alternatively you can use a button instead
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
        [imgView addGestureRecognizer:tap];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}


- (void) imageTapped:(UIGestureRecognizer *)sender{
    UIImageView *imageView = (UIImageView *)[sender view];
    [self.delegate loadDetail: imageView.tag];
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Nothing
}

@end
