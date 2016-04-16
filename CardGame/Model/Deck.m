//
//  Deck.m
//  CardGame
//
//  Created by Vichet Meng on 3/7/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//

#import "Deck.h"


// Private
@interface Deck ()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck


// Initialize the array if it does not exist yet
// This is the getter of the cards array (It is already created for us but we overriding the default getter we get from @propery
- (NSMutableArray *)cards
{
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}


// Adding card either to top or bottom
- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop)
        [self.cards insertObject:card atIndex:0];
    else
        [self.cards addObject:card];
}


// Default add card (at the bottom)
- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    // Check to see make sure that the array has at least 1 element
    // because if the array is empty, index will be 0, and trying to access self.card at index 0 when the array is empty will crash the program (Index out of bound)
    if ([self.cards count] != 0)
    {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end
