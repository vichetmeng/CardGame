#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

-(instancetype) init
{
    self = [super init];
    if (self)
    {
        for (NSString *suit in [PlayingCard validSuits])
        {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *newCard = [[PlayingCard alloc] init];
                [newCard setSuit:suit];
                [newCard setRank:rank];
                [self addCard:newCard];
            }
        }
    }
    return self;
}

@end