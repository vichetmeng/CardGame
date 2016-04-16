//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Vichet Meng on 3/12/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject


// Designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck withNumOfCardToPlayWith:(int)mode;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSMutableArray *currentChosenCards;
@property (nonatomic) NSInteger matchScore;

@end
