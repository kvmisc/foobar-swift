//
// Copyright ulvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FBFlowScrollLineView;


@interface FBFlowScrollView : UIScrollView

@property (nonatomic, strong, readonly) UIView *containerView;

@property (nonatomic, strong, readonly) NSArray *lineAry;

- (void)addLine:(FBFlowScrollLineView *)lineView;
- (void)removeLine:(FBFlowScrollLineView *)lineView;

- (void)reloadData;

@end

@interface FBFlowScrollLineView : FBBaseView
@property (nonatomic, assign) CGFloat topMargin;
@property (nonatomic, assign) CGFloat botMargin;
@end

@interface FBFlowScrollLineSeparatorView : FBFlowScrollLineView
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) CGFloat leading;
@property (nonatomic, assign) CGFloat trailing;
@property (nonatomic, assign) BOOL thick;
@end
