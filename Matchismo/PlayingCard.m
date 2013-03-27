//
//  PlayingCard.m
//  Matchismo
//
//  Created by Simon Liu on 3/26/13.
//  Copyright (c) 2013 Simon Liu. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;
@synthesize rank = _rank;

+ (NSArray *)validSuits
{
    static NSArray *validSuits = nil;
    if (!validSuits) validSuits = @[@"♠", @"♥", @"♦", @"♣"];
    return validSuits;
}

+ (NSArray *)rankStrings
{
    static NSArray *rankStrings = nil;
    if (!rankStrings) rankStrings = @[@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"A"];
    return rankStrings;
}

+ (NSUInteger)maxRank
{
    return [[[self class] rankStrings] count];
}

- (NSString *)contents
{
    return [[[PlayingCard rankStrings] objectAtIndex:self.rank-1] stringByAppendingString:self.suit];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// rank = [1..13]
- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    } else {
        NSLog(@"rand out of range! (%d)", rank);
    }
}

@end
