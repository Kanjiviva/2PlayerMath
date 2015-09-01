//
//  GameModel.m
//  2PlayerMath
//
//  Created by Steve on 2015-08-31.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "GameModel.h"

@interface GameModel ()

@property (assign, nonatomic) NSInteger operator;

@end


@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self resetGame];

    }
    return self;
}

- (void)firstNumber {
    self.x = arc4random_uniform(20) + 1;
}

- (void)secondNumber {
    self.y = arc4random_uniform(20) + 1;
}

- (int)sum {
    
    //self.randomResult = self.x + self.y;
    if (self.operator == 0) {
        return self.x + self.y;
    } else if (self.operator == 1) {
        return self.x - self.y;
    } else {
        return self.x * self.y;
    }
}

- (void)nextTurn {
    
    if (self.currentPlayer == self.player1) {
        self.currentPlayer = self.player2;
    } else {
        self.currentPlayer = self.player1;
    }
    
    [self firstNumber];
    [self secondNumber];
    
    self.operator = arc4random_uniform(3);
    
}

- (BOOL)updateScore:(int)userEnterdResult {
    
    if ([self sum] != userEnterdResult) {
        self.currentPlayer.currentHealth--;
        return NO;
    }
    return YES;
}


- (NSString *)operatorString {
    NSArray *ops = @[@"+",@"-",@"*", @"/"];
    return ops[self.operator];
    
}

- (NSString *)currentPlayerName {
    if (self.currentPlayer == self.player1) {
        return @"Player 1";
    } else {
        return @"Player 2";
    }

}

- (void)resetGame {
    _player1 = [[Player alloc] init];
    _player2 = [[Player alloc] init];
    _currentPlayer = _player1;
    
    [self firstNumber];
    [self secondNumber];

    
    
    [self sum];
}

@end
