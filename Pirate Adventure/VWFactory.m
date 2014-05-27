//
//  VWFactory.m
//  Pirate Adventure
//
//  Created by Valerino on 3/24/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import "VWFactory.h"

@implementation VWFactory

-(NSArray *) tiles
{
    // Column 1
    VWTile *tile1 = [[VWTile alloc] init];
    VWTile *tile2 = [[VWTile alloc] init];
    VWTile *tile3 = [[VWTile alloc] init];

    tile1.story = @"1 Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more plunder. Would you like a blunted sword to get started?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.buttonName = @"Take the sword";
    VWWeapon *bluntedSword = [[VWWeapon alloc] init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    
    tile2.story = @"2 You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile2.buttonName = @"Take steel armor";
    VWArmor *steelArmor = [[VWArmor alloc] init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    
    tile3.story = @"3 A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.buttonName = @"Stop at the Dock";
    tile3.healthEffect = 12;
    
    NSMutableArray *Col1 = [[NSMutableArray alloc] init];
    [Col1 addObject:tile1];
    [Col1 addObject:tile2];
    [Col1 addObject:tile3];
    
    // Column 2
    VWTile *tile4 = [[VWTile alloc] init];
    VWTile *tile5 = [[VWTile alloc] init];
    VWTile *tile6 = [[VWTile alloc] init];
    
    tile4.story = @"4 You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile4.buttonName = @"Adopt Parrot";
    VWArmor *parrotArmor = [[VWArmor alloc] init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot Armor";
    tile4.armor = parrotArmor;
    
    tile5.story = @"5 You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile5.buttonName = @"Take pistol";
    VWWeapon *pistolWeapon = [[VWWeapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 17;
    tile5.weapon = pistolWeapon;
    
    tile6.story = @"6 You have been captured by pirates and are ordered to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.buttonName = @"Show no fear!";
    tile6.healthEffect = -22;
    
    NSMutableArray *Col2 = [[NSMutableArray alloc] init];
    [Col2 addObject:tile4];
    [Col2 addObject:tile5];
    [Col2 addObject:tile6];
    
    // Column 3
    VWTile *tile7 = [[VWTile alloc] init];
    VWTile *tile8 = [[VWTile alloc] init];
    VWTile *tile9 = [[VWTile alloc] init];
    
    tile7.story = @"7 You sight a pirate battle off the coast";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.buttonName = @"Fight those scum!";
    tile7.healthEffect = 8;
    
    tile8.story = @"8 The legend of the deep, the mighty kraken appears";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.buttonName = @"Abandon Ship";
    tile8.healthEffect = -46;
    
    tile9.story = @"9 You stumble upon a hidden cave of pirate treasurer";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.buttonName = @"Take Treasurer";
    tile9.healthEffect = 20;
    
    NSMutableArray *Col3 = [[NSMutableArray alloc] init];
    [Col3 addObject:tile7];
    [Col3 addObject:tile8];
    [Col3 addObject:tile9];
    
    // Column 4
    VWTile *tile10 = [[VWTile alloc] init];
    VWTile *tile11 = [[VWTile alloc] init];
    VWTile *tile12 = [[VWTile alloc] init];

    tile10.story = @"10 A group of pirates attempts to board your ship";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.buttonName = @"Repel the invaders";
    tile10.healthEffect = -15;
    
    tile11.story = @"11 In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.buttonName = @"Swim deeper";
    tile11.healthEffect = -7;
    
    tile12.story = @"12 Your final faceoff with the fearsome pirate boss";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.buttonName = @"Fight!";
    tile12.healthEffect = -15;
    
    NSMutableArray *Col4 = [[NSMutableArray alloc] init];
    [Col4 addObject:tile10];
    [Col4 addObject:tile11];
    [Col4 addObject:tile12];
    

    NSArray *tiles = [[NSArray alloc] initWithObjects:Col1, Col2, Col3, Col4, nil];
    
    return tiles;
}

-(VWCharacter *) character
{
    VWCharacter *character = [[VWCharacter alloc] init];
    character.health = 100;
    
    VWArmor *armor = [[VWArmor alloc] init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    
    VWWeapon *weapon = [[VWWeapon alloc] init];
    weapon.name= @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;

    return character;
}

-(VWBoss *) boss
{
    VWBoss *boss = [[VWBoss alloc] init];
    boss.health = 65;
    
    return boss;
}

@end
