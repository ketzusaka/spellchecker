//
//  SCHelpers_Tests.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <XCTest/XCTest.h>
#import "SCHelpers.h"

@interface SCHelpers_Tests : XCTestCase

@end

@implementation SCHelpers_Tests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testIdentifiesVowelsAsAVowel {
  XCTAssertTrue([SCHelpers isCharacterVowel:'a'], @"a is a vowel");
  XCTAssertTrue([SCHelpers isCharacterVowel:'e'], @"e is a vowel");
  XCTAssertTrue([SCHelpers isCharacterVowel:'i'], @"i is a vowel");
  XCTAssertTrue([SCHelpers isCharacterVowel:'o'], @"o is a vowel");
  XCTAssertTrue([SCHelpers isCharacterVowel:'u'], @"u is a vowel");
  XCTAssertTrue([SCHelpers isCharacterVowel:'y'], @"y is a vowel");
}

- (void)testIdentifiesUppercaseVowelsAsAVowel {
  XCTAssertTrue([SCHelpers isCharacterVowel:'A'], @"A is a vowel");
  XCTAssertTrue([SCHelpers isCharacterVowel:'E'], @"E is a vowel");
  XCTAssertTrue([SCHelpers isCharacterVowel:'I'], @"I is a vowel");
  XCTAssertTrue([SCHelpers isCharacterVowel:'O'], @"O is a vowel");
  XCTAssertTrue([SCHelpers isCharacterVowel:'U'], @"U is a vowel");
  XCTAssertTrue([SCHelpers isCharacterVowel:'Y'], @"Y is a vowel");
}

- (void)testIdentifiesConstantsAsNotAVowel {
  XCTAssertFalse([SCHelpers isCharacterVowel:'t'], @"t is a vowel");
  XCTAssertFalse([SCHelpers isCharacterVowel:'c'], @"c is a vowel");
  XCTAssertFalse([SCHelpers isCharacterVowel:'v'], @"v is a vowel");
  XCTAssertFalse([SCHelpers isCharacterVowel:'n'], @"n is a vowel");
}
@end
