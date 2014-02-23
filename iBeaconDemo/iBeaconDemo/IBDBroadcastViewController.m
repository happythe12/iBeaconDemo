//
//  IBDViewController.m
//  iBeaconDemo
//
//  Created by Benish on 2/22/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "IBDBroadcastViewController.h"

@interface IBDBroadcastViewController ()

@end

@implementation IBDBroadcastViewController

@synthesize beaconDataDictionary;
@synthesize peripheralManager;
@synthesize beaconRegion;
@synthesize broadCastLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUUID *uuid = [[NSUUID alloc]initWithUUIDString:@""];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:1 minor:1 identifier:@"com.iBeaonDemo"];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)broadCastButtuonClicked:(id)sender {
    
    beaconDataDictionary = [self.beaconRegion peripheralDataWithMeasuredPower:nil];
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        
        self.broadCastLabel.text = @"Broadcasting......";
        [self.peripheralManager startAdvertising:beaconDataDictionary];
    } else if (peripheral.state == CBPeripheralManagerStatePoweredOff)
    {
        // Update our status label
        self.broadCastLabel.text = @"Stopped";
        
        // Bluetooth isn't on. Stop broadcasting
        [self.peripheralManager stopAdvertising];
    }
    else if (peripheral.state == CBPeripheralManagerStateUnsupported)
    {
        self.broadCastLabel.text = @"Unsupported";
    }
}

@end
