//
//  AppDelegate.h
//  GuitarTuner
//
//  Created by Matthew S. Hill on 2/26/17.
//  Copyright © 2017 Matthew S. Hill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdAudioController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;

@property (strong, nonatomic, readonly) PdAudioController *audioController;



@end

