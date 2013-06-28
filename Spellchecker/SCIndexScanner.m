//
//  SCIndexScanner.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import "SCIndexScanner.h"
#import "SCPositionableString.h"
#import "SCHelpers.h"

@interface SCIndexScanner ()
@property (nonatomic, strong) SCWordIndex *wordIndex;

- (BOOL) providedCharacter:(unichar)provided matches:(unichar)compared;
@end

@implementation SCIndexScanner
- (id) init {
  if ((self = [super init])) {
    NSAssert(![self isMemberOfClass:[SCIndexScanner class]], @"SCIndexScanner is an abstract class and cannot be initialized directly");
  }
  
  return self;
}

- (id) initWithWordIndex:(SCWordIndex*)anIndex {
  if ((self = [self init])) {
    self.wordIndex = anIndex;
  }
  
  return self;
}

- (NSString*) scanForWord:(NSString*)aWord { return nil; }

- (BOOL) providedCharacter:(unichar)provided matches:(unichar)compared {
  return (provided == compared || ([SCHelpers isCharacterVowel:provided] && [SCHelpers isCharacterVowel:compared]));
}

@end
