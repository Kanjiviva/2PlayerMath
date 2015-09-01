//
//  GameModel.h
//  2PlayerMath
//
//  Created by Steve on 2015-08-31.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject

@property (strong, nonatomic) Player *player1;
@property (strong, nonatomic) Player *player2;
@property (strong, nonatomic) Player *currentPlayer;

@property (nonatomic) int x;
@property (nonatomic) int y;

- (void)firstNumber;
- (void)secondNumber;
- (int)sum;
//- (int)newGame;
- (void) nextTurn;
- (BOOL)updateScore:(int)userEnterdResult;

-(NSString *)currentPlayerName;
-(NSString *)operatorString;
- (void)resetGame;

@end
