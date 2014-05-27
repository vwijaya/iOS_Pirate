//
//  VWFactory.h
//  Pirate Adventure
//
//  Created by Valerino on 3/24/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VWTile.h"
#import "VWCharacter.h"
#import "VWBoss.h"

@interface VWFactory : NSObject

-(NSArray *) tiles;

-(VWCharacter *) character;

-(VWBoss *) boss;


@end
