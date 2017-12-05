//
//  ViewController.h
//  YZAudioConverter
//
//  Created by Shin on 2017/12/5.
//  Copyright © 2017年 Shin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSButton *chooseSourceBtn;
@property (weak) IBOutlet NSButton *chooseOutBtn;
@property (weak) IBOutlet NSButton *ctartConvertBtn;

////////////////
@property (weak) IBOutlet NSTextField *sourcePathText;
@property (weak) IBOutlet NSTextField *outPathText;
@property (weak) IBOutlet NSTextField *infomationText;

@property (weak) IBOutlet NSPopUpButton *chooseFormat;


@end

