//
// Copyright ulvin. All rights reserved.
//

#import "FBFlowScrollView.h"

@implementation FBFlowScrollView

- (void)addLine:(FBFlowScrollLineView *)lineView
{
  if ( !lineView ) { return; }
  if ( !_containerView ) {
    _containerView = [[UIView alloc] init];
    _containerView.backgroundColor = [UIColor clearColor];
    [self addSubview:_containerView];
  }
  if ( !_lineAry ) {
    _lineAry = [[NSMutableArray alloc] init];
  }
  [(NSMutableArray *)_lineAry addObject:lineView];
  [_containerView addSubview:lineView];
  [self setNeedsUpdateConstraints];
}

- (void)removeLine:(FBFlowScrollLineView *)lineView
{
}

- (void)reloadData
{
  [self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  @weakify(self);
  [_containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
    @strongify(self);
    make.edges.equalTo(self);
    make.width.equalTo(self);
  }];

  FBFlowScrollLineView *prevLineView = nil;
  for ( int i=0; i<_lineAry.count; ++i ) {
    FBFlowScrollLineView *lineView = [_lineAry objectAtIndex:i];
    if ( prevLineView ) {
      @weakify(lineView, prevLineView);
      [lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        @strongify(self, lineView, prevLineView);
        make.top.equalTo(prevLineView.mas_bottom).offset(lineView.topMargin+prevLineView.botMargin);
        make.left.equalTo(self);
        make.right.equalTo(self);
      }];
    } else {
      @weakify(lineView);
      [lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        @strongify(self, lineView);
        make.top.equalTo(self).offset(lineView.topMargin);
        make.left.equalTo(self);
        make.right.equalTo(self);
      }];
    }
    prevLineView = lineView;
  }

  if ( prevLineView ) {
    @weakify(prevLineView);
    [_containerView mas_updateConstraints:^(MASConstraintMaker *make) {
      @strongify(prevLineView);
      make.bottom.equalTo(prevLineView.mas_bottom).offset(prevLineView.botMargin);
    }];
  } else {
    // ...
  }

  [super updateConstraints];
}

@end

@implementation FBFlowScrollLineView
- (void)setup
{
  [super setup];
  self.backgroundColor = [UIColor whiteColor];
}
@end

@implementation FBFlowScrollLineSeparatorView {
  CALayer *_lineLayer;
}
- (void)setup
{
  [super setup];
  self.backgroundColor = [UIColor whiteColor];

  _lineLayer = [CALayer layer];
  [self.layer addSublayer:_lineLayer];
  _lineLayer.backgroundColor = [FBColorHex(0xebebebff) CGColor];
  _lineLayer.zPosition = 1000.0;
}
- (void)layoutSubviews
{
  [super layoutSubviews];
  _lineLayer.frame = CGRectMake(_leading,
                                floor(_contentHeight/2.0),
                                self.bounds.size.width-_leading-_trailing,
                                (_thick)?(1.0):(1.0/[[UIScreen mainScreen] scale]));
}
- (CGSize)intrinsicContentSize
{
  return CGSizeMake(UIViewNoIntrinsicMetric, _contentHeight);
}
@end
