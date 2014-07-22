//
//  MSMHorzListView.h
//  MMHorizontalListView
//
//  Created by Chenchen Zheng on 7/21/14.
//  Copyright (c) 2014 Manuele Maggi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,AppType) {
  MSMRisky,
  MSMAggressive,
  MSMBenign,
  MSMAnalyzing
};

@interface MSMHorzListView : UIView

- (id)initWithFrame:(CGRect)frame withData: (NSArray *)appList andType: (AppType) appType;

@end
