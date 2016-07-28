//
//  ECWrongView.m
//  EquityClub
//
//  Created by 董阳阳 on 16/6/15.
//
//

#import "ECWrongView.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width


static ECWrongView *mWrongView = nil;


@implementation ECWrongView

- (void)show
{
    if ([UIApplication sharedApplication].keyWindow.rootViewController.navigationController) {
        [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController.view addSubview:self];
    }
    else {
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    
    [self performSelector:@selector(close) withObject:nil afterDelay:2];
}
- (void)close
{
    [self removeFromSuperview];
    [UIApplication sharedApplication].keyWindow.userInteractionEnabled = YES;
    
}
+ (ECWrongView *)shareLoadingView
{
    @synchronized(self){
        if (mWrongView == nil) {
            /**
             *  修改此处yes no 判断是全屏加载还是小框加载
             */
            mWrongView = [[self alloc] init];
        }
    }
    return mWrongView;
}

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake((kScreenWidth-150)/2, (kScreenHeight-80)/2, 150, 120)];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *imgeView = [[UIImageView alloc] initWithFrame:CGRectMake(52, 28, 48, 48)];
        imgeView.image = [UIImage imageNamed:@"Fill 1"];
        [self addSubview:imgeView];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 28+48+10, 150, 25)];
        title.text = @"发生错误！";
        title.textColor = [UIColor lightGrayColor];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont systemFontOfSize:16];
        [self addSubview:title];
        
        
    }
    return self;
}

@end
