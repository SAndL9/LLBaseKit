//
//  LLBaseConfgurationSceneObject.m
//  LLBaseKit
//
//  Created by LiLei on 5/9/18.
//

#import "LLBaseConfgurationSceneObject.h"
#import <objc/runtime.h>
#import <Aspects/Aspects.h>

@implementation LLBaseConfgurationSceneObject

//+ (void)load{
//    [super load];
//    [LLBaseConfgurationSceneObject sharedInstance];
//}


//+ (instancetype)sharedInstance{
//    static dispatch_once_t onceToken;
//    static LLBaseConfgurationSceneObject *object;
//    dispatch_once(&onceToken, ^{
//        object = [[LLBaseConfgurationSceneObject alloc]init];
//
//    });
//    return object;
//}

//- (instancetype)init{
//    if (self = [super init]) {
//        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo,BOOL animated){
//            id obj = [aspectInfo instance];
//            if ([obj isKindOfClass:[UIViewController class]]) {
//                [self viewWillAppear:animated viewController:[aspectInfo instance]];
//            }
//        } error:NULL];
//    }
//    return self;
//}

//- (void)viewWillAppear:(BOOL)animation viewController:(UIViewController *)viewController{
////    if ([viewController conformsToProtocol:@protocol(LLBaseConfgurationSceneProtocol) ]) {
//        NSLog(@"拦截成功");
//        //设置导航颜色以及大背景颜色
//        viewController.view.backgroundColor = [UIColor lightGrayColor];
//    }
//
//}


@end
