//
//  ECWrongView.h
//  EquityClub
//
//  Created by 董阳阳 on 16/6/15.
//
//

#import <UIKit/UIKit.h>

@interface ECWrongView : UIView

/**
 *  显示加载框
 */
- (void)show;
/**
 *  关闭加载框
 */
- (void)close;
/**
 *  获取LoadingView单例,isLikeSynchro  Yes:类似同步，通过遮盖整个窗体实现 No:异步
 *
 *  @return <#return value description#>
 */
+ (ECWrongView *)shareLoadingView;


@end
