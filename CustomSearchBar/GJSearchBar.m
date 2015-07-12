//
//  GJSearchBar.m
//  CustomSearchBar
//
//  Created by guojun on 7/12/15.
//  Copyright (c) 2015 guojunxu. All rights reserved.
//

#import "GJSearchBar.h"
#import "UIColor+GJColor.h"

@interface GJSearchBar()

@property (nonatomic, strong) IBOutlet UIButton *recordButton;
@property (nonatomic, strong) IBOutlet UITextField *searchTextField;
@property (nonatomic, strong) IBOutlet UIButton *cancelButton;

@property (nonatomic, strong) UIImageView *leftMarginView;

@end

@implementation GJSearchBar

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadView];
        [self addTextChangeAction];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadView];
        [self addTextChangeAction];
    }
    
    return self;
}

- (void)loadView{
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"GJSearchBar"
                                                                   owner:self
                                                                 options:nil] firstObject];
    view.frame = self.bounds;
    view.backgroundColor = [UIColor clearColor];
    
    [self addSubview:view];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.backgroundColor = UIColorFromRGB(0x03a9f4);
    
    [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.searchTextField.tintColor = UIColorFromRGB(0x03a9f4);
    
    // add search image
    [self.searchTextField setLeftView:self.leftMarginView];
    [self.searchTextField setLeftViewMode:UITextFieldViewModeAlways];
}

#pragma mark - Private Methods
- (void)addTextChangeAction{
    [self.searchTextField addTarget:self
                             action:@selector(textDidChange:)
                   forControlEvents:UIControlEventEditingChanged];
}

- (void)textDidChange:(UITextField *)textField{
    BOOL isTextEmpty = (textField.text.length == 0);
    if (isTextEmpty) {
        if ([self.delegate respondsToSelector:@selector(searchBarDidBeginEditing:)]) {
            [self.delegate searchBarDidBeginEditing:self];
        }
    } else {
        if ([self.delegate respondsToSelector:@selector(searchBarOnEditing:)]) {
            [self.delegate searchBarOnEditing:self];
        }
    }
}

#pragma mark - IBOutlet Action
- (IBAction)audioRecordButtonDidPress:(id)sender {
    if ([self.delegate respondsToSelector:@selector(searchBarAudioRecordButtonDidPress:)]) {
        [self.delegate searchBarAudioRecordButtonDidPress:self];
    }
}
- (IBAction)cancelButtonDidPress:(id)sender {
    if ([self.delegate respondsToSelector:@selector(searchBarCancelButtonDidPress:)]) {
        [self.delegate searchBarCancelButtonDidPress:self];
    }
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(searchBarDidBeginEditing:)]) {
        [self.delegate searchBarDidBeginEditing:self];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([self.delegate respondsToSelector:@selector(searchBarSearchButtonDidPress:)]) {
        [self.delegate searchBarSearchButtonDidPress:self];
    }
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - Getters
- (UIImageView *)leftMarginView{
    if (!_leftMarginView) {
        _leftMarginView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 26)];
        _leftMarginView.image = [UIImage imageNamed:@"search"];
    }
    
    return _leftMarginView;
}

- (NSString *)text{
    return self.searchTextField.text;
}

- (void)setText:(NSString *)text{
    self.searchTextField.text = text;
}

- (void)setKeyboardHidden:(BOOL)keyboardHidden{
    if (keyboardHidden) {
        [self.searchTextField resignFirstResponder];
    } else {
        [self.searchTextField becomeFirstResponder];
    }
}

@end
