//
//  ViewController.h
//  CardGame
//
//  Created by Vichet Meng on 3/6/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//
// Abstract class. Must implement methods as described below.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

// Protected
// For subclasses
- (Deck *) createDeck; // abstract
- (NSAttributedString *)titleForCard:(Card *)card; // abstract
- (UIImage *)backgroundImageForCard:(Card *)card; // abstract

@property (nonatomic) int numOfCardsToPlayWith;
@end

