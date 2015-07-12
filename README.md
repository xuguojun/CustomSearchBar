# CustomSearchBar

Click the image to view video on YouTube.com


[![ScreenShot](https://github.com/xuguojun/CustomSearchBar/blob/master/CustomSearchBar/Screen%20Shot%202015-07-12%20at%2023.17.20.png)](https://youtu.be/hzI4codK68g)

# Using
Just add it to your .xib file or storyboard like a naviate control, or add it programatically.

# Delegate method
you need to implement these delegate methods according to your needs.

# searchBarAudioRecordButtonDidPress:
- (void)searchBarAudioRecordButtonDidPress:(GJSearchBar *)searchBar{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

# searchBarCancelButtonDidPress:
- (void)searchBarCancelButtonDidPress:(GJSearchBar *)searchBar{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    self.searchBar.keyboardHidden = YES;
}

# searchBarDidBeginEditing:
- (void)searchBarDidBeginEditing:(GJSearchBar *)searchBar{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

# searchBarOnEditing:
- (void)searchBarOnEditing:(GJSearchBar *)searchBar{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

# searchBarSearchButtonDidPress:
- (void)searchBarSearchButtonDidPress:(GJSearchBar *)searchBar{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}
