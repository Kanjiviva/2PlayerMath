//
//  ViewController.m
//  2PlayerMath
//
//  Created by Steve on 2015-08-31.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *player1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playersTurnLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberEnteredLabel;
@property (weak, nonatomic) IBOutlet UILabel *checkingLabel;
- (IBAction)zero:(UIButton *)sender;
- (IBAction)one:(UIButton *)sender;
- (IBAction)two:(UIButton *)sender;
- (IBAction)three:(UIButton *)sender;
- (IBAction)four:(UIButton *)sender;
- (IBAction)five:(UIButton *)sender;
- (IBAction)six:(UIButton *)sender;
- (IBAction)seven:(UIButton *)sender;
- (IBAction)eight:(UIButton *)sender;
- (IBAction)nine:(UIButton *)sender;

- (IBAction)enter:(UIButton *)sender;

@property (nonatomic) int result;
@property (nonatomic) int x;
@property (nonatomic) int y;

@property (nonatomic) int player1CurrentHealth;
@property (nonatomic) int player2CurrentHealth;

@property (strong, nonatomic) GameModel *game;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.game = [[GameModel alloc] init];
    
    [self updateLabels];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zero:(UIButton *)sender {
    self.numberEnteredLabel.text = [NSString stringWithFormat:@"%@0", self.numberEnteredLabel.text];
}

- (IBAction)one:(UIButton *)sender {
    self.numberEnteredLabel.text = [NSString stringWithFormat:@"%@1", self.numberEnteredLabel.text];
}

- (IBAction)two:(UIButton *)sender {
    self.numberEnteredLabel.text = [NSString stringWithFormat:@"%@2", self.numberEnteredLabel.text];
}

- (IBAction)three:(UIButton *)sender {
    self.numberEnteredLabel.text = [NSString stringWithFormat:@"%@3", self.numberEnteredLabel.text];
}

- (IBAction)four:(UIButton *)sender {
    self.numberEnteredLabel.text = [NSString stringWithFormat:@"%@4", self.numberEnteredLabel.text];
}

- (IBAction)five:(UIButton *)sender {
    self.numberEnteredLabel.text = [NSString stringWithFormat:@"%@5", self.numberEnteredLabel.text];
}

- (IBAction)six:(UIButton *)sender {
    self.numberEnteredLabel.text = [NSString stringWithFormat:@"%@6", self.numberEnteredLabel.text];
}

- (IBAction)seven:(UIButton *)sender {
    self.numberEnteredLabel.text = [NSString stringWithFormat:@"%@7", self.numberEnteredLabel.text];
}

- (IBAction)eight:(UIButton *)sender {
    self.numberEnteredLabel.text = [NSString stringWithFormat:@"%@8", self.numberEnteredLabel.text];
}

- (IBAction)nine:(UIButton *)sender {
    self.numberEnteredLabel.text = [NSString stringWithFormat:@"%@9", self.numberEnteredLabel.text];
}

- (void)updateLabels {
    NSString *name = [self.game currentPlayerName];
    
    self.playersTurnLabel.text = [NSString stringWithFormat:@"Question for %@: %i %@ %i", name, self.game.x, self.game.operatorString, self.game.y];
    
    self.player1ScoreLabel.text = [NSString stringWithFormat:@"Player1 has: %i live", self.game.player1.currentHealth];
    self.player2ScoreLabel.text = [NSString stringWithFormat:@"Player2 has: %i live", self.game.player2.currentHealth];
}

- (IBAction)enter:(UIButton *)sender {
    
    if (![self.game updateScore:[self.numberEnteredLabel.text intValue]]) {
        // make label red
        self.checkingLabel.text = @"Incorrect!";
        self.checkingLabel.backgroundColor = [UIColor redColor];
    } else {
    // make label green
        self.checkingLabel.text = @"Correct";
        self.checkingLabel.backgroundColor = [UIColor greenColor];
    }
    
    if (self.game.player1.currentHealth == 0 || self.game.player2.currentHealth == 0) {
        
        NSString *title = [NSString stringWithFormat:@"%@ has lost the game", self.game.currentPlayerName];
        
        
        // Gameover
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:title
                                                           message:@"Please press OK for a new game"
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
        [alerView show];
        
        [self.game resetGame];
    
    } else {
        [self.game nextTurn];
    }
    
    [self updateLabels];
    
    self.numberEnteredLabel.text = @"";
    
    
    
    
}
@end
