//
//  SetCardDeck.m
//  CardGame
//
//  Created by Vichet Meng on 3/31/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//

#import "SetCardDeck.h"

@implementation SetCardDeck

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        for (int num = 1; num <= [SetCard maxNumber]; num++) {
            for (NSNumber *shading in [SetCard validShading]) {
                for (NSNumber *color in [SetCard validColor]) {
                    for (NSString *symbol in [SetCard validSymbol]) {
                        SetCard *card = [[SetCard alloc] init];
                        [card setSymbol:symbol];
                        [card setShading:[shading integerValue]];
                        [card setNumber:num];
                        [card setColor:[color integerValue]];
                        [self addCard:card];
                    }
                }
            }
        }
    }
    
    return self;
}

@end
