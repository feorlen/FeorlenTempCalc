//
//  TempCalcViewController.m
//  FeorlenTempCalc
//
//  Created by Feorlen on 10/4/13.
//  Copyright (c) 2013 Feorlen.org. All rights reserved.
//

#import "TempCalcViewController.h"

@interface TempCalcViewController ()

- (void)celsiusWithFahrenheit;
- (void)fahrenheitWithCelsius;

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
    
    // make the Done button appear
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
        action:@selector(onDoneButton)];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    
    // call the correct conversion for the field being edited
    
    if (textField == self.degCfield) {
        [self celsiusWithFahrenheit];
    }
    else if (textField == self.degFfield) {
        [self fahrenheitWithCelsius];
    }
    else {
        // shouldn't happen
        // there could be some error handling here
    }
    return YES;
}


#pragma mark - Private methods

// conversions:
// read the field, calculate the result, update other field (rounded to int)

- (void)celsiusWithFahrenheit {
    float cValue = [self.degCfield.text floatValue];
    float fValue = (cValue * (9.0/5.0)) + 32.0;
    self.degFfield.text = [NSString stringWithFormat:@"%0.0f", fValue];
}

- (void)fahrenheitWithCelsius {
    float fValue = [self.degFfield.text floatValue];
    float cValue = (fValue - 32.0) * (5.0/9.0);
    self.degCfield.text = [NSString stringWithFormat:@"%0.0f", cValue];

}

- (void)onDoneButton {
    // remove the done button when editing is finished
    [self.view endEditing:YES];
}

@end
