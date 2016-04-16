//
//  SetCard.m
//  CardGame
//
//  Created by Vichet Meng on 3/31/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

@synthesize symbol = _symbol;

- (NSString *)contents
{
    return nil;
}

- (void)setNumber:(NSUInteger)number
{
    if ([[SetCard validNumber]containsObject:[NSNumber numberWithInteger:number]])
        _number = number;
}

- (void)setSymbol:(NSString *)symbol
{
    if ([[SetCard validSymbol] containsObject:symbol])
        _symbol = symbol;
}

+ (NSArray *)validColor
{
    return @[@(SetCardGameColorRed), @(SetCardGameColorGreen), @(SetCardGameColorPurple)];
}

+ (NSArray *)validShading
{
    return @[@(SetCardGameShadingSolid), @(SetCardGameShadingOpen), @(SetCardGameShadingShaded)];
}

+(NSInteger)maxNumber
{
    return 3;
}

- (NSString *)symbol
{
    return _symbol ? _symbol : @"?";
}

+ (NSArray *)validSymbol
{
    return @[@"▲", @"●", @"■"];
}

+ (NSArray *)validNumber
{
    return @[@1, @2, @3];
}




@end
