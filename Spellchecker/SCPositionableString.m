//
//  SCPositionableString.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import "SCPositionableString.h"
#import "SCHelpers.h"

@interface SCPositionableString ()
@property (nonatomic, strong) NSString *string;
@end

@implementation SCPositionableString

- (id) init {
  if ((self = [super init])) {
    NSAssert(![self isMemberOfClass:[SCPositionableString class]], @"SCPositionableString must be initalized with a string to work with");
  }
  
  return self;
}

- (id) initWithString:(NSString *)aString {
  if ((self = [super init])) {
    NSAssert(aString != nil, @"Cannot initalize a positionable string with a nil string");
    NSAssert(aString.length != 0, @"Cannot initalize a positionable string with an empty string");
    self.string = aString;
  }
  
  return self;
}

- (void) movePositionToNextDifferentCharacter {
  if (self.position == (self.string.length-1)) {
    self.position = self.string.length;
    return;
  }
  
  if (self.position == self.string.length) {
    return;
  }
  
  NSUInteger pos = self.position;
  NSString *lowercasedString = [self.string lowercaseString];
  unichar originalCharacter = [lowercasedString characterAtIndex:pos];
  unichar c = originalCharacter;
  
  while ((c == originalCharacter || ([SCHelpers isCharacterVowel:c] && [SCHelpers isCharacterVowel:originalCharacter])) && pos < self.string.length) {
    pos += 1;
    if (pos != lowercasedString.length)
      c = [lowercasedString characterAtIndex:pos];
  }

  self.position = pos;
}

- (void) movePositionToNextDifferentCharacterStrict {
  if (self.position == (self.string.length-1)) {
    self.position = self.string.length;
    return;
  }
  
  if (self.position == self.string.length) {
    return;
  }
  
  NSUInteger pos = self.position;
  NSString *lowercasedString = [self.string lowercaseString];
  unichar originalCharacter = [lowercasedString characterAtIndex:pos];
  unichar c = originalCharacter;
  
  while (c == originalCharacter && pos < self.string.length) {
    pos += 1;
    if (pos != lowercasedString.length)
      c = [lowercasedString characterAtIndex:pos];
  }
  
  self.position = pos;
}

- (BOOL) hasValidPosition {
  return (self.position < self.string.length);
}

- (unichar) currentCharacter {
  return [self.string characterAtIndex:self.position];
}
@end
