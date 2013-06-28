//
//  SCHelpers.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import "SCHelpers.h"
#import "constants.h"

@implementation SCHelpers
+ (BOOL) isCharacterVowel:(unichar)aCharacter {
  return [SCHelpers isCharacterVowel:aCharacter caseSensitive:NO];
}

+ (BOOL) isCharacterVowel:(unichar)aCharacter caseSensitive:(BOOL)caseSensitive {
  BOOL characterIsVowel = NO;
  unichar character = (caseSensitive) ? aCharacter : tolower(aCharacter);
  
  for (NSUInteger i = 0; i != strlen(SCVowels); i++) {
    if (SCVowels[i] == character) {
      characterIsVowel = YES;
      break;
    }
  }
  
  return characterIsVowel;
}
@end
