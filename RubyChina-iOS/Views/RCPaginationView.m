//
//  RCPaginationView.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/28/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCPaginationView.h"

@interface RCPaginationView() <UIGestureRecognizerDelegate>

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) NSInteger previousIndex;
@property (nonatomic, assign) CGSize pageLabelSize;

@end

@implementation RCPaginationView

#pragma mark -
#pragma mark - Initialization

- (void)initProperty {
    
    _minPageNumber = 1;
    _maxPageNumber = 100;
    
    _previousIndex = _minPageNumber;
    _currentIndex = _previousIndex;
    
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.scrollEnabled = YES;
    self.bounces = YES;
    
}

- (void)initSubViews {
    CGFloat height = self.frame.size.height;
    _pageLabelSize = CGSizeMake(height, height);
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _pageLabelSize.width * (_maxPageNumber - _minPageNumber + 1), _pageLabelSize.height)];
    contentView.backgroundColor = [UIColor clearColor];
    
    CGRect aFrame = CGRectMake(0, 0, _pageLabelSize.width, _pageLabelSize.height);
    for (int i = (int)_minPageNumber; i <= (int)_maxPageNumber; i++) {
        
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:aFrame];
        numberLabel.font = [UIFont systemFontOfSize:17];
        numberLabel.text = [NSString stringWithFormat:@"%d", i];
        numberLabel.textAlignment = NSTextAlignmentCenter;
        numberLabel.tag = i;
        
        [contentView addSubview:numberLabel];
        aFrame = CGRectOffset(aFrame, _pageLabelSize.width, 0);
    }
    
   
    [self addSubview:contentView];
    self.contentSize = contentView.frame.size;
}

- (void)initTapGesture {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    tapGesture.delegate = self;
    [self addGestureRecognizer:tapGesture];
}


- (void)setup {
    [self initProperty];
    [self initSubViews];
    [self initTapGesture];
    
    [self selectIndex:_currentIndex];
}

- (void)reloadData {
    [self setup];
}

#pragma mark -
#pragma mark - View management

- (void)awakeFromNib {
    [self setup];
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Delegate

- (void)didTap:(UITapGestureRecognizer *)tapGesture {
    
    CGPoint point = [tapGesture locationInView:self];
    NSInteger index = point.x / _pageLabelSize.width + _minPageNumber;
   
    [self selectIndex:index];
}

- (void)selectIndex:(NSInteger)index {
    
    self.previousIndex = self.currentIndex;
    self.currentIndex = index;
    
    /* get previous selected background image view with tag -1 */
    UIImageView *previousBackgroundView = (UIImageView *)[self viewWithTag:-1];
    if (previousBackgroundView) {
        [previousBackgroundView removeFromSuperview];
    }
    
    /* get current selected label */
    UILabel *label = (UILabel *)[self viewAtIndex:index];
    
    /* add selected background image view for current selected label */
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:label.frame];
    backgroundView.image = _selectedBackgroundImage;
    backgroundView.tag = -1;
    [self insertSubview:backgroundView atIndex:0];
    
    
    /* adjust selected label to make it located in center */
    CGFloat contentOffsetX = self.contentOffset.x;
    
    CGPoint centerPosition = CGPointMake(contentOffsetX + self.frame.size.width / 2, self.contentOffset.y);
    CGPoint selectedLabelCenterPosition = CGPointMake(label.frame.origin.x + label.frame.size.width / 2, 0);
    CGFloat diff = selectedLabelCenterPosition.x - centerPosition.x;
    CGPoint adjustedPostion = CGPointMake(contentOffsetX + diff, 0);
    
    if (adjustedPostion.x > (self.contentSize.width - self.frame.size.width)) {
        
        adjustedPostion = CGPointMake((self.contentSize.width - self.frame.size.width), 0);
        NSLog(@"RCPaginationView #adjustedPostion: %@", NSStringFromCGPoint(adjustedPostion));
        [self setContentOffset:adjustedPostion animated:YES];
        
    } else if (adjustedPostion.x > 0) {
        
        [self setContentOffset:adjustedPostion animated:YES];
    } else {
        
        [self setContentOffset:CGPointZero animated:YES];
    }
    
}


- (UIView *)viewAtIndex:(NSInteger)index {
    return [self viewWithTag:index];
}



@end
