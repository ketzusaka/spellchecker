//
//  SCIndexScannerSubclass.h
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import "SCIndexScanner.h"

@class SCWordIndex;

@interface SCIndexScanner (Subclass)
@property (nonatomic, strong) SCWordIndex *wordIndex;

- (BOOL) providedCharacter:(unichar)provided matches:(unichar)compared;
@end
