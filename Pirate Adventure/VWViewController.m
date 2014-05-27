//
//  VWViewController.m
//  Pirate Adventure
//
//  Created by Valerino on 3/24/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import "VWViewController.h"

@interface VWViewController ()

@end

@implementation VWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    VWFactory *factory = [[VWFactory alloc] init];
    self.tiles = [factory tiles];
    //NSLog(@"%@", self.tiles);
    self.character = [factory character];
    self.boss = [factory boss];
    self.currentPoint = CGPointMake(0,0);
    //NSLog(@"Current point %f %f", self.currentPoint.x, self.currentPoint.y);
    
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
}
                            
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    VWTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    [self updateCharacterStatsForArmor:tileModel.armor
                           withWeapons:tileModel.weapon
                      withHealthEffect:tileModel.healthEffect];
    
    if(tileModel.healthEffect == -15) {
        self.boss.health = self.boss.health - self.character.damage;

        if (self.boss.health <= 0) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory Message" message:@"You have defeated the evil pirate boss!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            //tileModel.story = @"You've Won!";
        } else if (self.character.health <= 0) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died. Please restart." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            //tileModel.story = @"You've Lost!";
        } else {
            tileModel.story = [NSString stringWithFormat:@"Boss health: %i", self.boss.health];
        }
    }
    
    [self updateTile];
}

- (IBAction)northButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)restartButtonPressed:(UIButton *)sender {
    
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

#pragma mark - helper methods

- (void)updateTile
{
    VWTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.storyLabel.text = tileModel.story;
    
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = [NSString stringWithFormat:@"%@", self.character.armor.name];
    self.weaponLabel.text = [NSString stringWithFormat:@"%@", self.character.weapon.name];
    
    [self.actionLabel setTitle:tileModel.buttonName forState:UIControlStateNormal];
}

- (void)updateButtons
{
    self.northButton.hidden = [self hideTile:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self hideTile:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
    self.westButton.hidden = [self hideTile:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self hideTile:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
}

- (BOOL)hideTile:(CGPoint) point
{
    if(point.x >= 0 && point.y >= 0 &&
       point.x < [self.tiles count] &&
       point.y < [[self.tiles objectAtIndex:point.x] count])
    {
        return NO;
    } else {
        //NSLog(@"Hello... %f %f", point.x, point.y);
        return YES;
    }
}

- (void) updateCharacterStatsForArmor:(VWArmor *) armor withWeapons:(VWWeapon *) weapon withHealthEffect:(int)healthEffect
{
    if(armor != nil) {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if(weapon != nil) {
        //NSLog(@"%i, %i, %i", self.character.damage, self.character.weapon.damage, weapon.damage);
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if(healthEffect != 0) {
        self.character.health = self.character.health + healthEffect;
    }
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}


@end
