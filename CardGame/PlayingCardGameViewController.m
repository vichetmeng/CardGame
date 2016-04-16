//
//  PlayingCardGameViewController.m
//  CardGame
//
//  Created by Vichet Meng on 3/30/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController



- (int)numOfCardsToPlayWith
{
    return 2;
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    return [[NSAttributedString alloc] initWithString: card.isChosen ? card.contents : @""];
}

- (NSAttributedString *)statusForCard:(Card *)card
{
    return [[NSAttributedString alloc] initWithString:card.contents];
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}


- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
