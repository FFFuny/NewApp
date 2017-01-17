//
//  ViewController.m
//  demo33333
//
//  Created by JianXin on 15/12/23.
//  Copyright © 2015年 JianXin. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    MyScrollView *scroll = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    scroll.showsVerticalScrollIndicator = NO;
    scroll.showsHorizontalScrollIndicator = NO;
//    scroll.scrollEnabled = YES;
    scroll.alwaysBounceVertical = YES;
    scroll.alwaysBounceHorizontal = YES;
//    scroll.delegate = self;
//    scroll.contentSize = CGSizeMake(0, 1000);
//    scroll.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scroll];
    
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    aView.backgroundColor = [UIColor redColor];
    [scroll addSubview:aView];
    
    UIButton *bbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [bbtn setTitle:@"btn" forState:UIControlStateNormal];
    [bbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [bbtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [aView addSubview:bbtn];

//    UIImageView *imag = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    imag.backgroundColor = [UIColor blueColor];
//    [scroll addSubview:imag];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    view1.backgroundColor = [UIColor blackColor];
    view1.alpha = 0.5;
    [[UIApplication sharedApplication].keyWindow addSubview:view1];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 50, 50)];
    [btn setTitle:@"+" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addcount:) forControlEvents:UIControlEventTouchUpInside];
    [[UIApplication sharedApplication].keyWindow addSubview:btn];
}

- (void)addcount:(UIButton *)sender
{
    int a = [sender.titleLabel.text intValue];
    a ++;
    [sender setTitle:[NSString stringWithFormat:@"%d", a] forState:UIControlStateNormal];
    
    NSLog(@"aaa = %d", a);
}
//-(void)createScrollView{
//    //将scrollview,pagecontrollview视图添加到根视图
//    instrumentScroll = [[InstrumentScrollView alloc]init];
//    instrumentScroll.delegate = self;//滚动视图代理为当前
//    [self.view addSubview:instrumentScroll];
//    [instrumentScroll mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(bgView.mas_bottom);
//        make.left.right.equalTo(self.view);
//        make.bottom.equalTo(self.view.mas_bottom);
//    }];
//}

- (void)click:(UIButton *)sender
{
    NSLog(@"ddddd");
    sender.titleLabel.font = [UIFont systemFontOfSize:30];
    if (sender.state == UIControlEventTouchUpInside) {
        sender.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    int a = [sender.titleLabel.text intValue];
    a ++;
    [sender setTitle:[NSString stringWithFormat:@"%d", a] forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
