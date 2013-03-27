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
@property (nonatomic) int score;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < cardCount; ++i) {
            Card *card = [deck drawRandomCard];
            if (card) {
                self.cards[i] = card;
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
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
                        NSLog(@"match found. %@ %d.", c.contents, matchScore);
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
