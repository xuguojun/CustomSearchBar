//
//  ViewController.m
//  CustomSearchBar
//
//  Created by guojun on 7/12/15.
//  Copyright (c) 2015 guojunxu. All rights reserved.
//

#import "ViewController.h"
#import "GJSearchBar.h"

@interface ViewController ()<GJSearchBarDelegate>

@property (nonatomic, weak) IBOutlet GJSearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - GJSearchBarDelegate
- (void)searchBarAudioRecordButtonDidPress:(GJSearchBar *)searchBar{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)searchBarCancelButtonDidPress:(GJSearchBar *)searchBar{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    self.searchBar.keyboardHidden = YES;
}

- (void)searchBarDidBeginEditing:(GJSearchBar *)searchBar{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)searchBarOnEditing:(GJSearchBar *)searchBar{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)searchBarSearchButtonDidPress:(GJSearchBar *)searchBar{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
