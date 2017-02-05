//
//  ViewController.m
//  CurrencyConverter
//
//  Created by cristina on 13/11/16.
//  Copyright © 2016 crisbarreiro. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>
@property (strong, nonatomic) IBOutlet UITextField *initialAmountTextField;
@property (strong, nonatomic) IBOutlet UIButton *convertButton;
@property (strong, nonatomic) IBOutlet UILabel *currency1Label;
@property (strong, nonatomic) IBOutlet UILabel *currency1AmountLabel;
@property (strong, nonatomic) IBOutlet UILabel *currency2Label;
@property (strong, nonatomic) IBOutlet UILabel *currency2AmountLabel;
@property (strong, nonatomic) IBOutlet UILabel *currency3Label;
@property (strong, nonatomic) IBOutlet UILabel *currency3AmountLabel;
@property (nonatomic) CRCurrencyRequest *request;

@end

@implementation ViewController
- (IBAction)onClickConnectButton:(id)sender {
    self.convertButton.enabled = NO;
    
    self.request = [[CRCurrencyRequest alloc] init];
    self.request.delegate = self;
    [self.request start];
    NSLog(@"Convert button was tapped");
    
    

}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies {
    double inputValue = [self.initialAmountTextField.text floatValue];
    
    double euroValue = inputValue * currencies.EUR;
    self.currency1AmountLabel.text = [NSString stringWithFormat:@"%.2f", euroValue];;
    double yenValue = inputValue * currencies.JPY;
    self.currency2AmountLabel.text = [NSString stringWithFormat:@"%.2f", yenValue];
    double gbpValue = inputValue * currencies.GBP;
    self.currency3AmountLabel.text = [NSString stringWithFormat:@"%.2f", gbpValue];
    
    self.convertButton.enabled = YES;
    
}

@end
