//
//  Card.m
//  Matchismo
//
//  Created by Simon Liu on 3/26/13.
//  Copyright (c) 2013 Simon Liu. All rights reserved.
//

#import "Card.h"

@implementation Card
@synthesize faceUp = _faceUp;
@synthesize unplayable = _unplayable;
@synthesize contents = _contents;

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    
    }
    
    return score;
}

@end
