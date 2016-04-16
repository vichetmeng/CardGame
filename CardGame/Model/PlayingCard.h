#import "Card.h"
@import Foundation;


@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) int rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end