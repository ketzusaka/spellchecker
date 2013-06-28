//
//  SCPositionableString_Tests.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <XCTest/XCTest.h>
#import "SCPositionableString.h"

@interface SCPositionableString_Tests : XCTestCase

@end

@implementation SCPositionableString_Tests

- (void)setUp {
  [super setUp];
}

- (void)tearDown {
  [super tearDown];
}

- (void) testCannotBeInitializedWithoutString {
  XCTAssertThrows([SCPositionableString new], @"SCPositionableString should not be allowed to be initialized without a string");
}

- (void) testHasValidPosition {
  SCPositionableString *positionableString = [[SCPositionableString alloc] initWithString:@"test"];
  XCTAssertTrue([positionableString hasValidPosition], @"Should be able to identify when it's position is valid");
}

- (void) testHasInvalidPosition {
  SCPositionableString *positionableString = [[SCPositionableString alloc] initWithString:@"test"];
  positionableString.position = 4;
  XCTAssertFalse([positionableString hasValidPosition], @"Should be able to identify when it's position is invalid");
}

- (void) testProvidesCurrentCharacter {
  SCPositionableString *positionableString = [[SCPositionableString alloc] initWithString:@"test"];
  XCTAssertTrue([positionableString currentCharacter] == 't', @"Should be able to provide the current character");
}

- (void) testMovesPositionToOnePastStringLengthFromLastCharacterOfString {
  SCPositionableString *positionableString = [[SCPositionableString alloc] initWithString:@"test"];
  positionableString.position = 3;
  [positionableString movePositionToNextDifferentCharacter];
  XCTAssertTrue(positionableString.position == 4, @"Should not be able to move to the next different character if we are at the final character");
}

- (void) testMovePositionToNextDifferentCharacterMovesOneWhenNextCharacterIsDifferent {
  SCPositionableString *positionableString = [[SCPositionableString alloc] initWithString:@"test"];
  [positionableString movePositionToNextDifferentCharacter];
  XCTAssertTrue(positionableString.position == 1, @"Position indicator did not move as expected");
}

- (void) testMovePositionToNextDifferentCharacterMovesToNextDifferentCharacter {
  SCPositionableString *positionableString = [[SCPositionableString alloc] initWithString:@"ttest"];
  [positionableString movePositionToNextDifferentCharacter];
  XCTAssertTrue(positionableString.position == 2, @"Position indicator did not move as expected");
}

- (void) testMovePositionToNextDifferentCharacterIgnoresCase {
  SCPositionableString *positionableString = [[SCPositionableString alloc] initWithString:@"tTest"];
  [positionableString movePositionToNextDifferentCharacter];
  XCTAssertTrue(positionableString.position == 2, @"Position indicator did not move as expected");
}

- (void) testInvalidatesPositionWhenMultipleCharactersAreAtEnd {
  SCPositionableString *positionableString = [[SCPositionableString alloc] initWithString:@"testt"];
  [positionableString movePositionToNextDifferentCharacter];
  [positionableString movePositionToNextDifferentCharacter];
  [positionableString movePositionToNextDifferentCharacter];
  [positionableString movePositionToNextDifferentCharacter];
  XCTAssertTrue(positionableString.position == 5, @"Position indicator did not move as expected");
}
@end
