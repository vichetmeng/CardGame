#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit; // Because we implemented both setter AND getter

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    
    for (id otherCard in otherCards) {
        if ([otherCard isKindOfClass:[PlayingCard class]]) {
            PlayingCard *actualOtherCard = (PlayingCard *)otherCard;
            if ([self.suit isEqualToString:actualOtherCard.suit])
            {
                score += 1;
            }
            if (self.rank == actualOtherCard.rank)
            {
                score += 4;
            }
        }
    }
    
    NSMutableArray *otherCardsForComparison = [otherCards mutableCopy];
    for (PlayingCard *otherCard in otherCards)
    {
        [otherCardsForComparison removeObject:otherCard];
        for (PlayingCard *otherCardForComparison in otherCardsForComparison) {
            if (otherCard.rank == otherCardForComparison.rank)
            {
                score += 4;
            }
            else if ([otherCard.suit isEqualToString:otherCardForComparison.suit])
            {
                score += 1;
            }
        }
    }
    return score;
}

- (NSString *) contents
{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)validSuits
{
    return @[@"♠︎", @"♣︎", @"♥︎", @"♦︎"];
}

+(NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSUInteger)maxRank
{
    return [[self rankStrings] count] - 1;
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
        _suit = suit;
}

- (void) setRank:(int)rank
{
    if (rank <= [PlayingCard maxRank])
        _rank = rank;
}


@end