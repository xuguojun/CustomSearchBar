//
//  GJSearchBar.h
//  CustomSearchBar
//
//  Created by guojun on 7/12/15.
//  Copyright (c) 2015 guojunxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GJSearchBar;

@protocol GJSearchBarDelegate <NSObject>

@required
- (void)searchBarDidBeginEditing:(GJSearchBar *)searchBar;
- (void)searchBarOnEditing:(GJSearchBar *)searchBar;
- (void)searchBarAudioRecordButtonDidPress:(GJSearchBar *)searchBar;
- (void)searchBarCancelButtonDidPress:(GJSearchBar *)searchBar;
- (void)searchBarSearchButtonDidPress:(GJSearchBar *)searchBar;

@end

IB_DESIGNABLE
@interface GJSearchBar : UIView

@property(nonatomic, assign) BOOL keyboardHidden;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) IBOutlet id<GJSearchBarDelegate> delegate;

@end
