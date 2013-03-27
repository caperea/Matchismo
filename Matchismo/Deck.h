//
//  Deck.h
//  Matchismo
//
//  Created by Simon Liu on 3/26/13.
//  Copyright (c) 2013 Simon Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void)addCard:(Card*) card atTop:(BOOL)atTop;
- (void)clearDeck;
- (Card *)drawRandomCard;
@end
