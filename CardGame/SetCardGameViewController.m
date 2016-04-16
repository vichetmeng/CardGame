//
//  SetCardGameViewController.m
//  CardGame
//
//  Created by Vichet Meng on 3/31/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//

#import "SetCardGameViewController.h"

@interface SetCardGameViewController ()


@end

@implementation SetCardGameViewController

- (Deck *)createDeck
{
    return [[SetCardDeck alloc] init];
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    SetCard *setCard = (SetCard *)card;
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[self symbolForSetCard:setCard withSeperator:@"\n"]
                                                                 attributes:@{NSStrokeWidthAttributeName: [self shadingForCardContent:setCard],
                                                                              NSStrokeColorAttributeName: [self strokeColorForCard:setCard],
                                                                              NSForegroundColorAttributeName: [self foregroundColorForSetCard:setCard]}];
    return string;
}

- (NSAttributedString *)statusForCard:(Card *)card
{
    SetCard *setCard = (SetCard *)card;
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[self symbolForSetCard:setCard withSeperator:@""]
                                                                 attributes:@{NSStrokeWidthAttributeName: [self shadingForCardContent:setCard],
                                                                              NSStrokeColorAttributeName: [self strokeColorForCard:setCard],
                                                                              NSForegroundColorAttributeName: [self foregroundColorForSetCard:setCard]}];
    return string;
}

-(UIColor *)strokeColorForCard:(SetCard *)card
{
    UIColor *color;
    switch (card.color) {
        case SetCardGameColorRed:
            color = [UIColor redColor];
            break;
        case SetCardGameColorGreen:
            color = [UIColor greenColor];
            break;
        case SetCardGameColorPurple:
            color = [UIColor purpleColor];
            break;
    }
    return color;
}


// Return a string with the correct number of symbols seperated by new line character
- (NSString *)symbolForSetCard:(SetCard *)card withSeperator:(NSString *)seperator
{
    NSString *symbol = card.symbol;
    
    NSMutableArray *symbols = [[NSMutableArray alloc] init];
    for(int i = 0; i < card.number; i++)
        [symbols addObject:symbol];
    
    
    NSString *symbolForCard = [symbols componentsJoinedByString:seperator];
    
    return symbolForCard;
}

- (UIColor *)foregroundColorForSetCard:(SetCard *)card
{
    UIColor *foregroundColor;
    if (card.shading == SetCardGameShadingShaded)
    {
        switch (card.color) {
            case SetCardGameColorRed:
                foregroundColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:0.33];
                break;
            case SetCardGameColorGreen:
                foregroundColor = [UIColor colorWithRed:0 green:255 blue:0 alpha:0.33];
                break;
            case SetCardGameColorPurple:
                foregroundColor = [UIColor colorWithRed:128 green:0 blue:128 alpha:0.33];
                break;
        }
    }
    else{
        foregroundColor = [self strokeColorForCard:card];
    }
    return foregroundColor;
}

- (NSNumber *)shadingForCardContent:(SetCard *)card
{
    SetCardGameShading cardShading = card.shading;
    switch (cardShading) {
        case SetCardGameShadingOpen:
            return @10;
            break;
        case SetCardGameShadingShaded:
            return @-10; // - means filled
            break;
        case SetCardGameShadingSolid:
            return @-10;
            break;
    }
}

- (int) numOfCardsToPlayWith
{
    return 3;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"setcardselected" : @"cardfront"];
}


@end
