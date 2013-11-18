//
//  RJCell.m
//  TableViewController
//
//  Created by Kevin Muldoon & Tyler Fox on 10/5/13.
//  Copyright (c) 2013 RobotJackalope. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "RJTableViewCell.h"

@interface RJTableViewCell ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation RJTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.titleLabel = [[UILabel alloc] init];
        [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.titleLabel setNumberOfLines:1];
        [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
        [self.titleLabel setTextColor:[UIColor blackColor]];
        [self.titleLabel setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.titleLabel];
        
        
        self.bodyButton = [[UIButton alloc] init];
        for (UIView *subview in self.bodyButton.subviews)
        {
            [subview removeFromSuperview];
        }
        self.bodyButton.backgroundColor = [UIColor lightGrayColor];
        self.bodyButton.layer.cornerRadius = 8;
        self.bodyButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.bodyButton.layer.borderWidth = 0.5;
        [self.bodyButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.bodyButton];
        
        
        // Add this label to the button
        self.bodyLabel = [[UILabel alloc] init];
        [self.bodyLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.bodyLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [self.bodyLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.bodyLabel setNumberOfLines:0];
        [self.bodyLabel setTextAlignment:NSTextAlignmentLeft];
        [self.bodyLabel setTextColor:[UIColor darkGrayColor]];
        [self.bodyLabel setBackgroundColor:[UIColor clearColor]];
        [self.bodyButton addSubview:self.bodyLabel];
        
        [self updateFonts];
    }
    
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    
    if (self.didSetupConstraints) return;

//    [self.contentView addConstraint:[NSLayoutConstraint
//                                     constraintWithItem:self.titleLabel
//                                     attribute:NSLayoutAttributeLeading
//                                     relatedBy:NSLayoutRelationEqual
//                                     toItem:self.contentView
//                                     attribute:NSLayoutAttributeLeading
//                                     multiplier:1.0f
//                                     constant:kLabelHorizontalInsets]];
//    
//    [self.contentView addConstraint:[NSLayoutConstraint
//                                     constraintWithItem:self.titleLabel
//                                     attribute:NSLayoutAttributeTop
//                                     relatedBy:NSLayoutRelationEqual
//                                     toItem:self.contentView
//                                     attribute:NSLayoutAttributeTop
//                                     multiplier:1.0f
//                                     constant:(kLabelHorizontalInsets / 2)]];
//    
//    [self.contentView addConstraint:[NSLayoutConstraint
//                                     constraintWithItem:self.titleLabel
//                                     attribute:NSLayoutAttributeTrailing
//                                     relatedBy:NSLayoutRelationEqual
//                                     toItem:self.contentView
//                                     attribute:NSLayoutAttributeTrailing
//                                     multiplier:1.0f
//                                     constant:-kLabelHorizontalInsets]];
//    
//    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    
//    [self.contentView  addConstraint:[NSLayoutConstraint
//                                      constraintWithItem:self.bodyLabel
//                                      attribute:NSLayoutAttributeLeading
//                                      relatedBy:NSLayoutRelationEqual
//                                      toItem:self.contentView
//                                      attribute:NSLayoutAttributeLeading
//                                      multiplier:1.0f
//                                      constant:kLabelHorizontalInsets]];
//    
//    [self.contentView  addConstraint:[NSLayoutConstraint
//                                      constraintWithItem:self.bodyLabel
//                                      attribute:NSLayoutAttributeTop
//                                      relatedBy:NSLayoutRelationEqual
//                                      toItem:self.titleLabel
//                                      attribute:NSLayoutAttributeBottom
//                                      multiplier:1.0f
//                                      constant:(kLabelHorizontalInsets / 4)]];
//    
//    [self.contentView  addConstraint:[NSLayoutConstraint
//                                      constraintWithItem:self.bodyLabel
//                                      attribute:NSLayoutAttributeTrailing
//                                      relatedBy:NSLayoutRelationEqual
//                                      toItem:self.contentView
//                                      attribute:NSLayoutAttributeTrailing
//                                      multiplier:1.0f
//                                      constant:-kLabelHorizontalInsets]];
//    
//    [self.contentView  addConstraint:[NSLayoutConstraint
//                                      constraintWithItem:self.bodyLabel
//                                      attribute:NSLayoutAttributeBottom
//                                      relatedBy:NSLayoutRelationEqual
//                                      toItem:self.contentView
//                                      attribute:NSLayoutAttributeBottom
//                                      multiplier:1.0f
//                                      constant:-(kLabelHorizontalInsets / 2)]];
    
    // Get the views dictionary
    NSDictionary *viewsDictionary =
        @{
            @"titleLabel" : self.titleLabel,
            @"bodyButton" : self.bodyButton,
            @"bodyLabel" : self.bodyLabel
        };
    
    NSString *format;
    NSArray *constraintsArray;
    
    //Create the constraints using the visual language format
    format = @"V:|-10-[titleLabel]-10-[bodyButton]-10-|";
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:format options:nil metrics:nil views:viewsDictionary];
    [self.contentView addConstraints:constraintsArray];
    
    format = @"|-10-[titleLabel]-10-|";
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:format options:nil metrics:nil views:viewsDictionary];
    [self.contentView addConstraints:constraintsArray];
    
    format = @"|-10-[bodyButton]-10-|";
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:format options:nil metrics:nil views:viewsDictionary];
    [self.contentView addConstraints:constraintsArray];
    
    format = @"V:|-10-[bodyLabel]-10-|";
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:format options:nil metrics:nil views:viewsDictionary];
    [self.contentView addConstraints:constraintsArray];
    
    format = @"|-10-[bodyLabel]-10-|";
    constraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:format options:nil metrics:nil views:viewsDictionary];
    [self.contentView addConstraints:constraintsArray];
    
    
    
    self.didSetupConstraints = YES;
}

- (void)updateFonts
{
    self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.bodyLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
