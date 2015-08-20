//
//  SpeakHelper.m
//  in-china
//
//  Created by Theesit Konkaew on 8/20/15.
//  Copyright (c) 2015 Pricing. All rights reserved.
//

#import "SpeakHelper.h"
#import <AVFoundation/AVSpeechSynthesis.h>

@implementation SpeakHelper

- (void)speak:(NSString*) textInput {
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:textInput];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    
    utterance.rate = AVSpeechUtteranceMinimumSpeechRate;
    utterance.preUtteranceDelay = 0.2f;
    utterance.postUtteranceDelay = 0.2f;
    
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    [synthesizer speakUtterance:utterance];
}

@end
