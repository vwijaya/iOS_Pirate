//
//  VWCharacter.h
//  Pirate Adventure
//
//  Created by Valerino on 3/25/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VWArmor.h"
#import "VWWeapon.h"

@interface VWCharacter : NSObject

@property (strong, nonatomic) VWArmor *armor;
@property (strong, nonatomic) VWWeapon *weapon;

@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
