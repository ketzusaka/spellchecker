//
//  SCHelpers.h
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <Foundation/Foundation.h>

@interface SCHelpers : NSObject
+ (BOOL) isCharacterVowel:(unichar)aCharacter;
+ (BOOL) isCharacterVowel:(unichar)aCharacter caseSensitive:(BOOL)caseSensitive;
@end
