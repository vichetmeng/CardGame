
@import Foundation;
#import "Card.h"

@interface Deck : NSObject
// Public methods and properties

- (void)addCard: (Card *)card atTop:(BOOL)atTop;
- (void)addCard: (Card *)card;

- (Card *)drawRandomCard;

@end
