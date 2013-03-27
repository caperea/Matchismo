//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Simon Liu on 3/26/13.
//  Copyright (c) 2013 Simon Liu. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

- (id)init
{
    self = [super init];
    
    if (self) {
        [self resetDeck];
    }

    return self;
}

- (void)resetDeck
{
    [self clearDeck];
    for (NSString *suit in [PlayingCard validSuits]) {
        for (NSUInteger rank = 1; rank<= [PlayingCard maxRank]; rank++) {
            PlayingCard *card = [[PlayingCard alloc] init];
            card.rank = rank;
            card.suit = suit;
            [self addCard:card atTop:YES];
         }
    }
    
}

@end
