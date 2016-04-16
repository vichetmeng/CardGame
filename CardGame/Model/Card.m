//
//  Card.m
//  CardGame
//
//  Created by Vichet Meng on 3/6/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards)
    {
        if ([card.contents isEqualToString:self.contents])
        {
            score += 1;
        }
    }
    return score;
}

@end
