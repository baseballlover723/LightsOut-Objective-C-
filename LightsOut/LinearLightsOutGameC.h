//
//  LinearLightsOutGameC.h
//  LightsOut
//
//  Created by Philip Ross on 1/27/15.
//  Copyright (c) 2015 CSSE Department. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MAX_NUM_LIGHTS 100

@interface LinearLightsOutGameC : NSObject {
    BOOL lightStates[MAX_NUM_LIGHTS];
    int numbOfLights;
}
@property (nonatomic) NSInteger movesTaken;
@property (nonatomic) BOOL won;

-(id) initWithNumLights:(NSInteger) numLights;
-(BOOL) pressedLightAtIndex:(NSInteger) lightIndex;
-(BOOL) isLightOnAtIndex:(NSInteger) lightIndex;
-(BOOL) checkForWin;
-(NSString*) outputGameState;


@end
