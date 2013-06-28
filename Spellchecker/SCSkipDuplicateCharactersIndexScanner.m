//
//  SCSkipDuplicateCharactersIndexScanner.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import "SCSkipDuplicateCharactersIndexScanner.h"
#import "SCWordIndex.h"
#import "SCPositionableString.h"

@implementation SCSkipDuplicateCharactersIndexScanner
- (NSString*) scanForWord:(NSString*)aWord {
  NSArray *indexMatchers = [self.wordIndex matchesToWord:aWord];

  if (indexMatchers.count == 0)
    return nil;

  NSString *inputWord = (self.isCaseSensitive) ? aWord : [aWord lowercaseString];

  NSMutableArray *matches = [NSMutableArray array];
  
  [indexMatchers enumerateObjectsUsingBlock:^(NSString *word, NSUInteger idx, BOOL *stop) {
    NSString *compareWord = (self.isCaseSensitive) ? word : [word lowercaseString];
    
    if ([inputWord isEqualToString:compareWord]) {
      *stop = YES;
      [matches addObject:compareWord];

      return;
    }
    
    if (inputWord.length < compareWord.length) {
      return;
    }
    
    SCPositionableString *positionableWord = [[SCPositionableString alloc] initWithString:inputWord];
    SCPositionableString *testWord = [[SCPositionableString alloc] initWithString:compareWord];

    while ([positionableWord hasValidPosition]) {
      if (![testWord hasValidPosition]) {
        return;
      }
      
      unichar provided = [positionableWord currentCharacter];
      unichar comparing = [testWord currentCharacter];
      if (![self providedCharacter:provided matches:comparing]) {
        return;
      }
      
      [positionableWord movePositionToNextDifferentCharacter];
      [testWord movePositionToNextDifferentCharacter];
    }
    
    [matches addObject:compareWord];
  }];

  if (matches.count == 0)
    return nil;
  else if (matches.count > 1)
    return [self bestMatchForWord:inputWord withinArray:matches];

  return [matches objectAtIndex:0];
}

- (NSString*) bestMatchForWord:(NSString*)aWord withinArray:(NSArray*)anArray {
  NSMutableArray *pointLog = [NSMutableArray array];
  
  [anArray enumerateObjectsUsingBlock:^(NSString *checkWord, NSUInteger idx, BOOL *stop) {
    NSUInteger points = 0;
    SCPositionableString *positionableWord = [[SCPositionableString alloc] initWithString:aWord];
    SCPositionableString *testWord = [[SCPositionableString alloc] initWithString:checkWord];
    
    while ([positionableWord hasValidPosition]) {
      if (![testWord hasValidPosition]) {
        break;
      }
      
      unichar provided = [positionableWord currentCharacter];
      unichar comparing = [testWord currentCharacter];

      if (provided == comparing) {
        points += 1;
      }
      
      [positionableWord movePositionToNextDifferentCharacterStrict];
      [testWord movePositionToNextDifferentCharacterStrict];
    }

    
    [pointLog addObject:[NSNumber numberWithInteger:points]];
  }];
  
  __block NSUInteger topPointIndex = 0;
  __block NSUInteger topPoints = 0;
  [pointLog enumerateObjectsUsingBlock:^(NSNumber *points, NSUInteger idx, BOOL *stop) {
    if (points.integerValue > topPoints) {
      topPointIndex = idx;
      topPoints = points.integerValue;
    }
  }];

  return [anArray objectAtIndex:topPointIndex];
}
@end
