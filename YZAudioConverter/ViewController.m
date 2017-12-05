//
//  ViewController.m
//  YZAudioConverter
//
//  Created by Shin on 2017/12/5.
//  Copyright © 2017年 Shin. All rights reserved.
//

#import "ViewController.h"

typedef enum : NSUInteger {
    Format_NONE = 0,
    Format_MP3,
    Format_AAC,
    Format_WAV,
} ConverterFormat;

@interface ViewController()<NSOpenSavePanelDelegate>{
    
    NSOpenPanel *_sourceFinder;
    NSOpenPanel *_outFinder;
    
    ConverterFormat _convertFormat;
    
}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sourcePathText.editable = NO;
    _outPathText.editable = NO;
    
    _convertFormat = 0;//默认没格式

  
}
- (IBAction)chooseSource:(id)sender {
    
    _sourceFinder = [NSOpenPanel openPanel];
    _sourceFinder.delegate = self;
    _sourceFinder.canChooseFiles = YES;
    _sourceFinder.canChooseDirectories = NO;
    _sourceFinder.directoryURL = [NSURL URLWithString:@"/Users/yzshin/Documents"];
    [_sourceFinder beginWithCompletionHandler:^(NSModalResponse result) {
        if (result ==1) {
        }
    }];
}
- (IBAction)chooseOut:(id)sender {
    
    _outFinder = [NSOpenPanel openPanel];
    _outFinder.delegate = self;
    _outFinder.canChooseFiles = NO;
    _outFinder.canChooseDirectories = YES;
    _outFinder.directoryURL = [NSURL URLWithString:@"/Users/yzshin/Documents"];
    [_outFinder beginWithCompletionHandler:^(NSModalResponse result) {
        if (result ==1) {
        }
    }];
}

- (IBAction)chooseFormat:(id)sender {
    
    switch ([(NSPopUpButton *)sender selectedItem].tag) {
        case 0:
            _convertFormat = Format_NONE;
            break;
        case 1:
            _convertFormat = Format_MP3;
            break;
        case 2:
            _convertFormat = Format_AAC;
            break;
        case 3:
            _convertFormat = Format_WAV;
            break;
    }
    
}


#pragma mark- NSOpenPanel delegate
- (BOOL)panel:(id)sender shouldEnableURL:(NSURL *)url{
    
    return YES;
}

//open files
- (BOOL)panel:(id)sender validateURL:(NSURL *)url error:(NSError **)outError {
    
    if (url) {
        if ([sender isEqual:_sourceFinder]) {
            _sourcePathText.stringValue = url.absoluteString;
        }else if ([sender isEqual:_outFinder]){
            _outPathText.stringValue = url.absoluteString;
        }
        [sender close];
    }
    return NO;
}

//selected file
- (void)panelSelectionDidChange:(nullable id)sender{
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
