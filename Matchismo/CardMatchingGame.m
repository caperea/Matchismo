//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Simon Liu on 3/27/13.
//  Copyright (c) 2013 Simon Liu. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()

@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int cardCount;
@property (nonatomic) Deck *deck;
@end

@implementation CardMatchingGame
@synthesize deck = _deck;
@synthesize cardCount = _cardCount;

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    if (self = [super init]) {
        self.cardCount = cardCount;
        self.deck = deck;
        if (![self resetGame])
            self = nil;
    }
    return self;
}

- (BOOL)resetGame
{
    self.score = 0;
    for (int i = 0; i < self.cardCount; ++i) {
        Card *card = [self.deck drawRandomCard];
        if (card) {
            self.cards[i] = card;
        } else {
            return NO;
        }
    }
    return YES;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *c in self.cards) {
                if (c.isFaceUp && !c.isUnplayable && ![c isEqual:card]) {
                    int matchScore = [card match:@[c]];
                    if (matchScore) {
                        c.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        c.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                }
            }
        }
        card.faceUp = !card.faceUp;
        
    }
}

@end
