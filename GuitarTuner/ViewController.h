//
//  ViewController.h
//  GuitarTuner
//
//  Created by Matthew S. Hill on 2/26/17.
//  Copyright © 2017 Matthew S. Hill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdDispatcher.h"
#import "PitchView.h"

@interface ViewController : UIViewController<PdListener> {

PdDispatcher *dispatcher;
void *patch;

}

@property (strong, nonatomic) IBOutlet UILabel *pitchLabel;
@property (strong, nonatomic) IBOutlet PitchView *pitchView;

-(IBAction)playE:(id)sender;
-(IBAction)playA:(id)sender;
-(IBAction)playD:(id)sender;
-(IBAction)playG:(id)sender;
-(IBAction)playB:(id)sender;
-(IBAction)playE2:(id)sender;

-(void)receiveFloat:(float)value fromSource:(NSString *)source;

@end

