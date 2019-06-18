//
//  SecondViewController.h
//  test
//
//  Created by 脉络 on 2018/11/26.
//  Copyright © 2018 脉络. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController

@property (nonatomic,copy) void (^refreshBlock)(void);


@end

NS_ASSUME_NONNULL_END
