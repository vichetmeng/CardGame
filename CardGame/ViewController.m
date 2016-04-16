//
//  ViewController.m
//  CardGame
//
//  Created by Vichet Meng on 3/6/16.
//  Copyright © 2016 Vichet Meng. All rights reserved.
//

#import "ViewController.h"
#import "CardMatchingGame.h"
#import "StatusHistoryViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameModeLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons; // Array of buttons in the UI
@property (nonatomic, strong) CardMatchingGame *game; // Game model
@property (nonatomic, strong) NSMutableArray *statusHistory;
@property (nonatomic, strong) Card *touchedCard;
@end

@implementation ViewController

- (NSMutableArray *)statusHistory
{
    if(!_statusHistory)
        _statusHistory = [[NSMutableArray alloc] init];
    return _statusHistory;
}

- (CardMatchingGame *) game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck] withNumOfCardToPlayWith:self.numOfCardsToPlayWith];
    return _game;
}


- (Deck *) createDeck // abstract
{
    return nil;
}

- (int)numOfCardsToPlayWith
{
    if (!_numOfCardsToPlayWith) _numOfCardsToPlayWith = 2;
    return _numOfCardsToPlayWith;
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        cardButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal ];
        cardButton.enabled = !card.isMatched;
    }
    self.statusLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.statusLabel.numberOfLines = 0;
    [self.statusLabel setAttributedText: [self statusForCard:self.touchedCard
                                          currentChosenCards:self.game.currentChosenCards
                                           currentMatchScore:self.game.matchScore]];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

- (NSAttributedString *)statusForCard:(Card *)touchedCard
                   currentChosenCards:(NSArray *)currentChosenCards
                    currentMatchScore:(NSInteger)currentMatchScore
{
    NSMutableAttributedString *statusForGame = [[NSMutableAttributedString alloc] init];
    if (touchedCard.chosen)
    {
        [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:@"Picked "]];
        [statusForGame appendAttributedString:[self statusForCard:touchedCard]];
         if ([currentChosenCards count])
         {
             [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:@" to match with "]];
             int i = 0;
             for (Card *card in currentChosenCards)
             {
                 i++;
                 [statusForGame appendAttributedString:[self statusForCard:card]];
                 if (i != [currentChosenCards count])
                 {
                     [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:@" and "]];
                 }
             }
         }
        
        if (currentMatchScore < 0)
        {
            [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\nMismatch penalty: %ld points", (long)currentMatchScore]]];
        }
        else if (currentMatchScore > 0)
        {
            [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\nMatched! Scored: %ld points", (long)currentMatchScore]]];
        }
    }
    else
    {
        [statusForGame appendAttributedString:[[NSAttributedString alloc] initWithString:@"Ready!"]];
    }
    [self.statusHistory addObject:statusForGame];
    return statusForGame;
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    return nil;
}

-(NSAttributedString *)statusForCard:(Card *)card
{
    return nil;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return nil;
}

- (IBAction)redealButton
{
    
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck] withNumOfCardToPlayWith:self.numOfCardsToPlayWith];
    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    self.touchedCard = [self.game cardAtIndex:cardIndex];
    [self updateUI];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PlayingCardHistory"] || [segue.identifier isEqualToString:@"SetCardHistory"])
    {
        if ([segue.destinationViewController isKindOfClass:[StatusHistoryViewController class]])
        {
            StatusHistoryViewController *playingCardHistoryViewController = (StatusHistoryViewController *)segue.destinationViewController;
            playingCardHistoryViewController.statusHistory = self.statusHistory;
        }
    }
}



































@end
