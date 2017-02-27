//
//  ViewController.m
//  GuitarTuner
//
//  Created by Matthew S. Hill on 2/26/17.
//  Copyright © 2017 Matthew S. Hill. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize pitchLabel;
@synthesize pitchView;

void fiddle_tilde_setup();

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pitchView.centerPitch = 45;
    pitchLabel.text = @"A-String";
    
    dispatcher = [[PdDispatcher alloc] init];
    [dispatcher addListener:self forSource:@"pitch"];
    [PdBase setDelegate:dispatcher];
    fiddle_tilde_setup();
    patch = [PdBase openFile:@"tuner.pd" path:[[NSBundle mainBundle] resourcePath]];
    
    if(!patch){
        NSLog(@"Failed to open patch!");
        //Handle failure
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button callbacks
-(void)playNote:(int)n {
    pitchView.centerPitch = n;
    [PdBase sendFloat:n toReceiver:@"midinote"];
    [PdBase sendBangToReceiver:@"trigger"];
}

-(IBAction)playE:(id)sender {
    pitchLabel.text = @"E-String (low)";
    [self playNote:40];
}
-(IBAction)playA:(id)sender {
    pitchLabel.text = @"A-String";
    [self playNote:45];
}

-(IBAction)playD:(id)sender {
    pitchLabel.text = @"D-String";
    [self playNote:50];
}

-(IBAction)playG:(id)sender {
    pitchLabel.text = @"G-String";
    [self playNote:55];
}

-(IBAction)playB:(id)sender {
    pitchLabel.text = @"B-String";
    [self playNote:59];
}

-(IBAction)playE2:(id)sender {
    pitchLabel.text = @"E-String (high)";
    [self playNote:64];
}

#pragma mark - PdListener callback
-(void)receiveFloat:(float)value fromSource:(NSString *)source{
    pitchView.currentPitch = value;
}
@end
