//
//  LinearLightsOutGameC.m
//  LightsOut
//
//  Created by Philip Ross on 1/27/15.
//  Copyright (c) 2015 CSSE Department. All rights reserved.
//

#import "LinearLightsOutGameC.h"

@implementation LinearLightsOutGameC

-(id) initWithNumLights:(NSInteger) numLights {
    self = [super init];
    self.movesTaken = 0;
    self.won = NO;
    numbOfLights = numLights;
    for (int k=0; k<numLights; k++) {
        lightStates[k] = arc4random_uniform(2) == 1;
    }
    return self;
}

-(BOOL) pressedLightAtIndex:(NSInteger) lightIndex {
//    NSLog([NSString stringWithFormat: @"you've pressed light numb %d, which is %d", lightIndex, lightStates[lightIndex]]);
    if (self.won) {
        return YES;
    }
    self.movesTaken++;
    [self tryToFlipLight:lightIndex-1];
    [self tryToFlipLight:lightIndex];
    [self tryToFlipLight:lightIndex+1];
    [self printDescription];
    return [self checkForWin];
}
-(void) printDescription {
    NSString* str = @"";
    for (int k=0; k<numbOfLights; k++) {
        BOOL light = lightStates[k];
        str = [str stringByAppendingString:light ? @"1" : @"0"];
        NSLog([NSString stringWithFormat: @"str = %@", str]);
    }
    NSLog([NSString stringWithFormat: @"Lights: %@ Moves: %d", str, self.movesTaken]);
}

- (BOOL) tryToFlipLight: (NSInteger) lightIndex {
    if (lightIndex < 0 || lightIndex >= numbOfLights) {
        return NO;
    }
    lightStates[lightIndex] = !lightStates[lightIndex];
    return YES;
}


-(BOOL) isLightOnAtIndex:(NSInteger) lightIndex {
    return lightStates[lightIndex];
}

-(BOOL) checkForWin {
    for (int k=0; k<numbOfLights; k++) {
        bool light = lightStates[k];
        if (light) {
            self.won = NO;
            return NO;
        }
    }
    self.won = YES;
    return YES;
}

-(NSString*) outputGameState {
    if (self.won) {
        return [NSString stringWithFormat: @"You've won in %d moves", self.movesTaken];
    }
    return [NSString stringWithFormat: @"Move #%d", self.movesTaken+1];
}

@end
