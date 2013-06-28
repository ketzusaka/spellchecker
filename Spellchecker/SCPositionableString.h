//
//  SCPositionableString.h
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <Foundation/Foundation.h>

@interface SCPositionableString : NSObject
@property (nonatomic, strong, readonly) NSString *string;
@property (nonatomic) NSUInteger position;

- (id) initWithString:(NSString*)aString;
- (void) movePositionToNextDifferentCharacter;
- (void) movePositionToNextDifferentCharacterStrict;
- (BOOL) hasValidPosition;
- (unichar) currentCharacter;
@end
