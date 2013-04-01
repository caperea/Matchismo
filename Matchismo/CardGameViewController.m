//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Simon Liu on 3/26/13.
//  Copyright (c) 2013 Simon Liu. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation CardGameViewController
//@synthesize cardButtons = _cardButtons;

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    // this is now done in updateUI method
    /*
     for (UIButton *cb in cardButtons) {
     Card *c = [self.deck drawRandomCard];
     [cb setTitle:c.contents forState:UIControlStateSelected];
     }
     */
}
- (void)updateUI
{
    for (int i = 0; i<self.cardButtons.count; i++) {
        Card *card = [self.game cardAtIndex:i];
        UIButton * cb = self.cardButtons[i];
        [cb setTitle:card.contents forState:UIControlStateSelected];
        [cb setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        
        cb.selected = card.faceUp;
        cb.enabled = !card.isUnplayable;
        
        self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
    
}
- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

- (IBAction)resetGame:(UIButton *)sender
{
    [self.game resetGame];
    self.flipCount = 0;
    [self updateUI];
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
