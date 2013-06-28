//
//  SCIndifferentVowelsWordIndex.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import "SCIndifferentVowelsWordIndex.h"
#import "SCHelpers.h"
#import "constants.h"

@interface SCIndifferentVowelsWordIndex ()
- (NSString*) keyForWord:(NSString*)aWord;
- (void) buildInitialIndex;
@end

@implementation SCIndifferentVowelsWordIndex
- (id) init {
  if ((self = [super init])) {
    [self buildInitialIndex];
  }
  
  return self;
}

- (void) addToIndex:(NSString *)aString {
  NSAssert(aString != nil, @"You cannot add a nil word to an index");
  NSString *indexKey = [self keyForWord:aString];
  [[self.wordIndex objectForKey:indexKey] addObject:aString];
}

- (NSArray*) matchesToWord:(NSString*)aWord {
  if (aWord == nil || aWord.length == 0)
    return @[];
  
  NSString *indexKey = [self keyForWord:aWord];
  
  return [self.wordIndex objectForKey:indexKey];
}

- (NSString*) keyForWord:(NSString *)aWord {
  NSString *lowercasedWord = [aWord lowercaseString];
  unichar firstCharacter = [lowercasedWord characterAtIndex:0];
  unichar lastCharacter = [lowercasedWord characterAtIndex:aWord.length-1];
  BOOL isFirstCharacterVowel = [SCHelpers isCharacterVowel:firstCharacter];
  BOOL isLastCharacterVowel = [SCHelpers isCharacterVowel:lastCharacter];
  
  return [NSString stringWithFormat:@"%c%c", isFirstCharacterVowel ? SCIndifferentVowelCharacter : firstCharacter, isLastCharacterVowel ? SCIndifferentVowelCharacter : lastCharacter];
}

- (void) buildInitialIndex {
  NSMutableDictionary *tmpWordIndex = [NSMutableDictionary dictionary];
  const char *constants = "bcdfghjklmnpqrstvwxz";
  
  for (NSUInteger i = 0; i != strlen(constants); i++) {
    for (NSUInteger x = 0; x != strlen(SCVowels); x++) {
      [tmpWordIndex setObject:[NSMutableArray array] forKey:[NSString stringWithFormat:@"%c%c", constants[i], SCIndifferentVowelCharacter]];
    }
    
    for (NSUInteger x = 0; x != strlen(constants); x++) {
      [tmpWordIndex setObject:[NSMutableArray array] forKey:[NSString stringWithFormat:@"%c%c", constants[i], constants[x]]];
    }
  }
  
  for (NSUInteger i = 0; i != strlen(SCVowels); i++) {
    for (NSUInteger x = 0; x != strlen(SCVowels); x++) {
      [tmpWordIndex setObject:[NSMutableArray array] forKey:[NSString stringWithFormat:@"%c%c", SCIndifferentVowelCharacter, SCIndifferentVowelCharacter]];
    }
    
    for (NSUInteger x = 0; x != strlen(constants); x++) {
      [tmpWordIndex setObject:[NSMutableArray array] forKey:[NSString stringWithFormat:@"%c%c", SCIndifferentVowelCharacter, constants[x]]];
    }
  }
  
  self.wordIndex = [NSDictionary dictionaryWithDictionary:tmpWordIndex];
}
@end
