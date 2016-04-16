//
//  SetCard.h
//  CardGame
//
//  Created by Vichet Meng on 3/31/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//
@import Foundation;
@import UIKit;
#import "Card.h"

@interface SetCard : Card

typedef NS_ENUM(NSUInteger, SetCardGameShading)
{
    SetCardGameShadingSolid,
    SetCardGameShadingOpen,
    SetCardGameShadingShaded
};

typedef NS_ENUM(NSUInteger, SetCardGameColor)
{
    SetCardGameColorRed,
    SetCardGameColorGreen,
    SetCardGameColorPurple
};

@property (nonatomic) NSUInteger number;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic) SetCardGameColor color;
@property (nonatomic) SetCardGameShading shading; // 1 solid 2 striped 3 opened


+ (NSArray *)validSymbol;
+ (NSInteger)maxNumber;
+ (NSArray *)validColor; // Array of SetCardGameColor
+ (NSArray *)validShading; // Array of SetCardGameShading


@end
