//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Simon Liu on 3/27/13.
//  Copyright (c) 2013 Simon Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;
- (void)flipCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@end
