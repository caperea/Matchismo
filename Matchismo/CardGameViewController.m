//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Simon Liu on 3/26/13.
//  Copyright (c) 2013 Simon Liu. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *deck;
@end

@implementation CardGameViewController
@synthesize deck = _deck;

- (PlayingCardDeck *)deck
{
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    for (UIButton *cb in cardButtons) {
        Card *c = [self.deck drawRandomCard];
        [cb setTitle:c.contents forState:UIControlStateSelected];
    }
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount updated to %d.", self.flipCount);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)flipCard:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    if (sender.isSelected) {
        self.flipCount += 1;
//        PlayingCard *thisCard = (PlayingCard *)[self.deck drawRandomCard];
//        if (thisCard) {
//            [self.card setTitle:thisCard.contents forState:UIControlStateSelected];
//        } else {
//            self.card.enabled = NO;
//        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
