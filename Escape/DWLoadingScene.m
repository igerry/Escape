//
//  DWMyScene.m
//  Escape
//
//  Created by dodo on 18/01/2014.
//  Copyright (c) 2014 dodo. All rights reserved.
//

#import "DWLoadingScene.h"

static NSString* const kAnimationDoctorWalkingDownAction = @"kAnimationDoctorWalkingDownAction";
static NSString* const kAnimationDoctorWalkingUpAction = @"kAnimationDoctorWalkingUpAction";
static NSString* const kAnimationDoctorWalkingLeftAction = @"kAnimationDoctorWalkingLeftAction";
static NSString* const kAnimationDoctorWalkingRightAction = @"kAnimationDoctorWalkingRightAction";
static NSString* const kAnimationDoctorVanishingAction = @"kAnimationDoctorVanishingAction";
static float const kAnimationDoctorActionTimePerFrame = 0.25;

typedef NS_ENUM(NSInteger, AnimationDoctor) {
    AnimationDoctorWalkingUp,
    AnimationDoctorWalkingDown,
    AnimationDoctorWalkingLeft,
    AnimationDoctorWalkingRight,
    AnimationDoctorVanishing,
};

@interface DWLoadingScene ()

@property(nonatomic) NSArray        *doctorTextures;
@property(nonatomic) NSDictionary   *doctorActions;
@property(nonatomic) SKSpriteNode   *doctor;

@end

@implementation DWLoadingScene

#pragma mark - Init

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        [self createLoadingLabel];
        [self createRoleDoctor];
    }
    return self;
}

#pragma mark - Render

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */

}

#pragma mark - Touch Events

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
//    UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInNode:self];
    
    // change direction of the walking doctor randomly
    int randomDirection = arc4random() % 4;
    [self animationDoctor:(AnimationDoctor)randomDirection];
}


#pragma mark - Contect Creation

- (void)createLoadingLabel
{
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Escape";
    myLabel.fontSize = 30;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];
}

- (void)createRoleDoctor
{
    self.doctorTextures = [self createDoctorTextures];
    self.doctorActions = [self createDoctorActions];
    SKSpriteNode *doctor = [SKSpriteNode spriteNodeWithTexture:self.doctorTextures[0]];
    doctor.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    self.doctor = doctor;
    [self addChild:doctor];
    
    [self animationDoctor:AnimationDoctorWalkingDown];
}

- (NSArray *)createDoctorTextures
{
    SKTexture *doctorTexture = [SKTexture textureWithImageNamed:@"role_doctor"];
    
    NSMutableArray *textures = [@[] mutableCopy];
    for (int i = 0; i < 20; i++) {
        CGRect rect = CGRectMake(0, 1.0 / 20 * (20 - i - 1), 1.0, 1.0 / 20);
        SKTexture *doctor = [SKTexture textureWithRect:rect inTexture:doctorTexture];
        [textures addObject:doctor];
    }
    return [NSArray arrayWithArray:textures];
}

- (NSDictionary *)createDoctorActions
{
    NSMutableDictionary *actions = [@{} mutableCopy];
    
    // walking up
    NSArray *textures = @[self.doctorTextures[1],
                          self.doctorTextures[2],
                          self.doctorTextures[3],
                          self.doctorTextures[4],
                          ];
    SKAction *walking = [SKAction animateWithTextures:textures timePerFrame:kAnimationDoctorActionTimePerFrame];
    SKAction *repeatWalking = [SKAction repeatActionForever:walking];
    actions[kAnimationDoctorWalkingUpAction] = repeatWalking;

    // walking down
    textures = @[self.doctorTextures[5],
                          self.doctorTextures[6],
                          self.doctorTextures[7],
                          self.doctorTextures[8],
                          ];
    walking = [SKAction animateWithTextures:textures timePerFrame:kAnimationDoctorActionTimePerFrame];
    repeatWalking = [SKAction repeatActionForever:walking];
    actions[kAnimationDoctorWalkingDownAction] = repeatWalking;
    
    // walking left
    textures = @[self.doctorTextures[13],
                          self.doctorTextures[14],
                          self.doctorTextures[15],
                          self.doctorTextures[16],
                          ];
    walking = [SKAction animateWithTextures:textures timePerFrame:kAnimationDoctorActionTimePerFrame];
    repeatWalking = [SKAction repeatActionForever:walking];
    actions[kAnimationDoctorWalkingLeftAction] = repeatWalking;

    // walking right
    textures = @[self.doctorTextures[9],
                 self.doctorTextures[10],
                 self.doctorTextures[11],
                 self.doctorTextures[12],
                 ];
    walking = [SKAction animateWithTextures:textures timePerFrame:kAnimationDoctorActionTimePerFrame];
    repeatWalking = [SKAction repeatActionForever:walking];
    actions[kAnimationDoctorWalkingRightAction] = repeatWalking;
    
    // vanishing
    textures = @[self.doctorTextures[0],
                          self.doctorTextures[17],
                          self.doctorTextures[18],
                          self.doctorTextures[19],
                          ];
    SKAction *vanishing = [SKAction animateWithTextures:textures timePerFrame:kAnimationDoctorActionTimePerFrame];
    SKAction *repeatVanishing = [SKAction repeatActionForever:vanishing];
    actions[kAnimationDoctorVanishingAction] = repeatVanishing;
    
    return [NSDictionary dictionaryWithDictionary:actions];
}

#pragma mark - Role Animation

- (void)animationDoctor:(AnimationDoctor)animation
{
    switch (animation) {
        case AnimationDoctorWalkingUp:
            [self animationDoctorWalkingUp];
            break;
        case AnimationDoctorWalkingDown:
            [self animationDoctorWalkingDown];
            break;
        case AnimationDoctorWalkingLeft:
            [self animationDoctorWalkingLeft];
            break;
        case AnimationDoctorWalkingRight:
            [self animationDoctorWalkingRight];
            break;
        case AnimationDoctorVanishing:
            [self animationDoctorVanishing];
            break;
        default:
            break;
    }
}

- (void)animationDoctorWalkingDown
{
    [self.doctor removeAllActions];
    [self.doctor runAction:self.doctorActions[kAnimationDoctorWalkingDownAction]];
}

- (void)animationDoctorWalkingUp
{
    [self.doctor removeAllActions];
    [self.doctor runAction:self.doctorActions[kAnimationDoctorWalkingUpAction]];
}

- (void)animationDoctorWalkingLeft
{
    [self.doctor removeAllActions];
    [self.doctor runAction:self.doctorActions[kAnimationDoctorWalkingLeftAction]];
}

- (void)animationDoctorWalkingRight
{
    [self.doctor removeAllActions];
    [self.doctor runAction:self.doctorActions[kAnimationDoctorWalkingRightAction]];
}

- (void)animationDoctorVanishing
{
    [self.doctor removeAllActions];
    [self.doctor runAction:self.doctorActions[kAnimationDoctorVanishingAction]];
}

@end
