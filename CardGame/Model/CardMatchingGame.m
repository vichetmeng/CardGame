//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Vichet Meng on 3/12/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic) int numOfCardsToPlayWith;
@end
@implementation CardMatchingGame

- (NSString *)status{
    if (!_status) {
        _status = @"Ready!";
    }
    return _status;
}

-(NSMutableArray *)currentChosenCards
{
    _currentChosenCards = [[NSMutableArray alloc] init];
    for(Card *card in self.cards)
        if(card.isChosen && !card.isMatched)
            [_currentChosenCards addObject:card];
    
    return _currentChosenCards;
}

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck withNumOfCardToPlayWith:(int)num
{
    self = [super init];
    if (self)
    {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card)
            {
                [self.cards addObject:card];
            }
            else
            {
                self = nil;
                break;
            }
        }
        self.numOfCardsToPlayWith = num;
    }
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *currentCard = [self.cards objectAtIndex:index];
    if (!currentCard.matched)
    {
        if (currentCard.isChosen)
        {
            currentCard.chosen = NO;
        }
        else
        {
            
            NSMutableString *currentChosenCardsStatus = [[NSMutableString alloc] init];
            for (Card *currentCard in self.cards) {
                if (currentCard.isChosen && !currentCard.isMatched) {
                    [self.currentChosenCards addObject:currentCard];
                    [currentChosenCardsStatus appendFormat:@"%@ ", currentCard.contents];
                }
            }
            if ([self.currentChosenCards count])
            {
                self.status = [[NSString alloc] initWithFormat:@"Chose %@ to match with: %@", currentCard.contents, currentChosenCardsStatus];
            } else
            {
                self.status = [[NSString alloc] initWithFormat:@"Chose %@", currentCard.contents];
            }
            if ([self.currentChosenCards count] == self.numOfCardsToPlayWith - 1) {
                self.matchScore = [currentCard match:self.currentChosenCards];
                if (self.matchScore) {
                    // They are matched, so update all of the cards
                    self.score += self.matchScore * MATCH_BONUS;
                    for (Card *otherCard in self.currentChosenCards)
                    {
                        otherCard.matched = YES;
                    }
                    self.status = [NSString stringWithFormat:@"Scored: %ld. Matched %@ %@", self.matchScore * MATCH_BONUS, currentCard.contents, currentChosenCardsStatus];
                    currentCard.matched = YES;
                }
                else
                {
                    // They are not matched (matchScore == 0), so change all chosen to NO
                    self.score -= MISMATCH_PENALTY;
                    for (Card *otherCard in self.currentChosenCards) {
                        otherCard.chosen = NO;
                    }
                    self.status = [NSString stringWithFormat:@"Penalty: %d. Unable to match %@ %@", MISMATCH_PENALTY, currentCard.contents, currentChosenCardsStatus];
                }
            }
            self.score -= COST_TO_CHOOSE;
            currentCard.chosen = YES;
        }
        
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
