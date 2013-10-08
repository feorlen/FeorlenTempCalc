//
//  TempCalcViewController.m
//  FeorlenTempCalc
//
//  Created by Feorlen on 10/4/13.
//  Copyright (c) 2013 Feorlen.org. All rights reserved.
//

#import "TempCalcViewController.h"

@interface TempCalcViewController ()

- (void)convertValue;
- (void)convertCtoF;
- (void)convertFtoC;
- (void)onDoneButton;

@end

@implementation TempCalcViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature Convertor";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.degCfield.delegate = self;
    self.degFfield.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
        action:@selector(onDoneButton)];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    return YES;
}

#pragma mark - Private methods


// conversion methods - result rounded to nearest integer

- (void)convertValue {
    // determine which field was edited last
    // call correct convert method
    
    // for test, convert c to f
    [self convertCtoF];
}

- (void)convertCtoF {
    float cValue = [self.degCfield.text floatValue];
    float fValue = (cValue * (9.0/5.0)) + 32.0;
    self.degFfield.text = [NSString stringWithFormat:@"%0.0f", fValue];
}

- (void)convertFtoC {
    float fValue = [self.degFfield.text floatValue];
    float cValue = (fValue - 32.0) * (5.0/9.0);
    self.degCfield.text = [NSString stringWithFormat:@"%0.0f", cValue];

}

- (void)onDoneButton {
    [self.view endEditing:YES];
    [self convertValue];
}

@end
