//
//  ECLoadingView.m
//  EquityClub
//
//  Created by 董阳阳 on 16/6/3.
//
//

#import "ECLoadingView.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width


@implementation ECLoadingView

static ECLoadingView *mLoadingView = nil;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}


//Combined Shape@1x

//loading_line@1x

///初始化加载框，这个函数是表示LoadingView的大小，如果是Yes，则loadView的大小为整个窗体，在这种情况下网络请求的时候会遮盖整个窗体，用户其他操作都是无效的相当于同步，如果是No，则loadView的大小为为150*80，用户的其他操作是有效的，这种情况相下需要保证loadingView唯一；

- (id)initIsLikeSynchro:(BOOL)isLikeSynchro {
    if (isLikeSynchro) {
        self = [super initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    }
    else {
        
        self = [super initWithFrame:CGRectMake((kScreenWidth-150)/2, (kScreenHeight-80)/2, 150, 80)];
    }
    if (self) {
        self.isLikeSynchro = isLikeSynchro;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        UIView *conerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        conerView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self addSubview:conerView];
        CGFloat bgW = 156;
        CGFloat bgH = 128;
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, bgW, bgH)];
        bgView.center = conerView.center;
        bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:bgView];
        
        circleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading_line"]];
        CGFloat circleW = 72;
        CGFloat circleX = (bgW - circleW)/2.0;
        CGFloat circleY = 18;
        circleView.frame = CGRectMake(circleX, circleY, circleW, circleW);
        [bgView addSubview:circleView];
        
        UIImageView *shapeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Combined Shape"]];
        shapeView.frame = CGRectMake(0, 0, 36, 21);
        shapeView.center = circleView.center;
        [bgView addSubview:shapeView];
        
        
        UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, circleY+circleW+5, bgW, 20)];
        lblTitle.backgroundColor = [UIColor clearColor];
        lblTitle.textColor = [UIColor grayColor];
        lblTitle.textAlignment = NSTextAlignmentCenter;
        lblTitle.text = @"加载中...";
        lblTitle.font = [UIFont systemFontOfSize:15];
        [bgView addSubview:lblTitle];
    }
    return self;
}

- (void)show{
    if ([UIApplication sharedApplication].keyWindow.rootViewController.navigationController) {
        [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController.view addSubview:self];
    }
    else {
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    
    [self circleViewRun];
}

- (void)close {
    [self circleViewStop];
    [self removeFromSuperview];
    [UIApplication sharedApplication].keyWindow.userInteractionEnabled = YES;
}

- (void)circleViewRun
{
    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [spin setFromValue:[NSNumber numberWithFloat:0]];
    [spin setToValue:[NSNumber numberWithFloat:-M_PI * 2.0]];
    [spin setDuration:3];
    [spin setDelegate:self];//设置代理，可以相应animationDidStop:finished:函数，用以弹出提醒框
    //速度控制器
    [spin setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    spin.repeatCount = 10;
    //添加动画
    [circleView.layer addAnimation:spin forKey:@"circleRun"];
//    //锁定结束位置
//    self.luckyButton.transform = CGAffineTransformMakeRotation(M_PI * (10.0+random+orign));
}

- (void)circleViewStop
{
    [circleView.layer removeAnimationForKey:@"circleRun"];
}

+ (ECLoadingView *)shareLoadingView {
    @synchronized(self){
        if (mLoadingView == nil) {
            /**
             *  修改此处yes no 判断是全屏加载还是小框加载
             */
            mLoadingView = [[self alloc] initIsLikeSynchro:YES];
        }
    }
    return mLoadingView;
}

+ (id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (mLoadingView==nil) {
            mLoadingView = [super allocWithZone:zone];
            return mLoadingView;
        }
    }
    return  nil;
}

///设置子View在父View中居中

- (void)setCenter:(UIView *)child withParentRect:(CGRect)parentRect{
    CGRect rect = child.frame;
    rect.origin.x = (parentRect.size.width - child.frame.size.width)/2;
    rect.origin.y = (parentRect.size.height - child.frame.size.height)/2;
    child.frame = rect;
}

@end
