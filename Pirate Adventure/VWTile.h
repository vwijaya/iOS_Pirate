//
//  VWTile.h
//  Pirate Adventure
//
//  Created by Valerino on 3/24/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VWWeapon.h"
#import "VWArmor.h"

@interface VWTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *buttonName;

@property (strong, nonatomic) VWWeapon *weapon;
@property (strong, nonatomic) VWArmor *armor;
@property (nonatomic) int healthEffect;

@end
