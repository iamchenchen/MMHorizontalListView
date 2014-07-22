//
//  MSMHorzListView.m
//  MMHorizontalListView
//
//  Created by Chenchen Zheng on 7/21/14.
//  Copyright (c) 2014 Manuele Maggi. All rights reserved.
//

#import "MSMHorzListView.h"
#import "MMHorizontalListView.h"

#define kHeaderListRatio 0.2
#define kCellWidth 40.0f



@interface MSMHorzListView()<MMHorizontalListViewDataSource, MMHorizontalListViewDelegate>

@property (strong, nonatomic) MMHorizontalListView *horizontalView;
@property (strong, nonatomic) UIButton *header;
@property (nonatomic, strong) NSArray *appList;

@end


//this class includes an UIButton
@implementation MSMHorzListView


- (id)initWithFrame:(CGRect)frame withData: (NSArray *)appList andType: (AppType) appType {
  self = [super initWithFrame:frame];
  if (self) {
    self.appList = appList;
    self.header = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width*kHeaderListRatio, frame.size.height)];
    [self.header addTarget:self action:@selector(headerClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self setType:appType];
    self.horizontalView = [[MMHorizontalListView alloc] initWithFrame:CGRectMake(frame.size.width*kHeaderListRatio, 0, frame.size.width*(1-kHeaderListRatio), frame.size.height)];
    self.horizontalView.cellSpacing = 10.0;
    self.horizontalView.dataSource = self;
    self.horizontalView.delegate = self;
    self.horizontalView.backgroundColor = [UIColor blueColor];
    [self addSubview:self.header];
    [self addSubview:self.horizontalView];
    [self.horizontalView reloadData];
  }
  return self;
}



- (void) headerClicked:(id)sender {
  NSLog(@"button clicked");
}
- (void) setType:(AppType) appType {
  switch (appType) {
    case MSMRisky:
      [self.header setBackgroundColor:[UIColor redColor]];
//      [self.header setImage:@"" forState:UIControlStateNormal];
      break;
    case MSMAggressive:
      [self.header setBackgroundColor:[UIColor yellowColor]];
      break;
    case MSMBenign:
      [self.header setBackgroundColor:[UIColor blueColor]];
      break;
    case MSMAnalyzing:
      [self.header setBackgroundColor:[UIColor whiteColor]];
      break;
    default:
      [self.header setBackgroundColor:[UIColor clearColor]];
      break;
  }
}
/**
 *  Method to get the number of cells to display in the datasource
 *
 *  @param horizontalListView - the MMHorizontalListView asking for the number if cells to diplay
 *
 *  @return NSInteger the number of cells to display
 */
- (NSInteger)MMHorizontalListViewNumberOfCells:(MMHorizontalListView*)horizontalListView {
  return 100;
}

/**
 *  Method to get the width of cell to display at a specific index
 *
 *  @param horizontalListView - the MMHorizontalListView asking for the width of the cell to diplay
 *  @param index - the given index of the cell asking for the width
 *
 *  @return CGFloat the width of the cell to display
 */
- (CGFloat)MMHorizontalListView:(MMHorizontalListView*)horizontalListView widthForCellAtIndex:(NSInteger)index {
  return kCellWidth;
  
}

/**
 *  Method to get the width MMHorizontalListViewCell view to display at a specific index
 *
 *  @param horizontalListView - the MMHorizontalListView asking for the MMHorizontalListViewCell view to diplay
 *  @param index - the given index of the cell asking for the view to display
 *
 *  @return MMHorizontalListViewCell the cell to display
 */
- (MMHorizontalListViewCell*)MMHorizontalListView:(MMHorizontalListView*)horizontalListView cellAtIndex:(NSInteger)index {
  MMHorizontalListViewCell *cell = [horizontalListView dequeueCellWithReusableIdentifier:@"test"];
  
  if (!cell) {
    cell = [[MMHorizontalListViewCell alloc] initWithFrame:CGRectMake(0, 0, kCellWidth, kCellWidth)];
    cell.reusableIdentifier = @"test";
  }
  
  [cell setBackgroundColor:[UIColor colorWithRed:(arc4random() % 255)/255.0 green:(arc4random() % 255)/255.0 blue:(arc4random() % 255)/255.0 alpha:1.0]];
  
  return cell;
}

/**
 *  Method called when a cell is selected at a specific index
 *
 *  @param horizontalListView - the MMHorizontalListView of the selected cell
 *  @param index - the given index of the selected cell
 */
- (void)MMHorizontalListView:(MMHorizontalListView*)horizontalListView didSelectCellAtIndex:(NSInteger)index {
  
}



@end
