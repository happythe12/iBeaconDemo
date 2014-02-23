//
//  IBDViewController.h
//  iBeaconDemo
//
//  Created by Benish on 2/22/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>



@interface IBDBroadcastViewController : UIViewController<CBPeripheralManagerDelegate>

@property(weak, nonatomic) IBOutlet UILabel *broadCastLabel;
@property(strong, nonatomic) CLBeaconRegion *beaconRegion;
@property(strong, nonatomic) CBPeripheralManager *peripheralManager;
@property(strong, nonatomic) NSDictionary *beaconDataDictionary;


- (IBAction)broadCastButtuonClicked:(id)sender;

@end
