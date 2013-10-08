//
//  TempCalcViewController.h
//  FeorlenTempCalc
//
//  Created by Feorlen on 10/4/13.
//  Copyright (c) 2013 Feorlen.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempCalcViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *degCfield;
@property (nonatomic, strong) IBOutlet UITextField *degFfield;


@end
