//
//  SCIndifferentVowelsWordIndex_Tests.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <XCTest/XCTest.h>
#import "SCIndifferentVowelsWordIndex.h"

@interface SCIndifferentVowelsWordIndex_Tests : XCTestCase
@property (nonatomic, strong) SCIndifferentVowelsWordIndex *wordIndex;
@end

@implementation SCIndifferentVowelsWordIndex_Tests

- (void)setUp {
  [super setUp];
  self.wordIndex = [[SCIndifferentVowelsWordIndex alloc] init];
}

- (void)tearDown {
  self.wordIndex = nil;
  [super tearDown];
}

#pragma mark - Basic match tests
- (void) testMatchesWordAddedToIndex {
  [self.wordIndex addToIndex:@"test"];
  XCTAssertTrue([[self.wordIndex matchesToWord:@"test"] isEqualToArray:@[@"test"]], @"Should return items that do match a words added to the index");
}

- (void) testDoesNotMatchWordAddedToIndex {
  [self.wordIndex addToIndex:@"test"];
  XCTAssertTrue([[self.wordIndex matchesToWord:@"jest"] isEqualToArray:@[]], @"Should not match a word that does not start and end with the same characters");
}

- (void) testCanMatchASingleConstant {
  [self.wordIndex addToIndex:@"c"];
  XCTAssertTrue([[self.wordIndex matchesToWord:@"c"] isEqualToArray:@[@"c"]], @"Should be able to return matches to a single vowel");
}

- (void) testCanMatchASingleVowel {
  [self.wordIndex addToIndex:@"a"];
  XCTAssertTrue([[self.wordIndex matchesToWord:@"a"] isEqualToArray:@[@"a"]], @"Should be able to return matches to a single vowel");
}

- (void) testCanMatchWordWithDifferentMiddle {
  [self.wordIndex addToIndex:@"kick"];
  XCTAssertTrue([[self.wordIndex matchesToWord:@"kcik"] isEqualToArray:@[@"kick"]], @"Should be able to return matches to words with different middles");
}

#pragma mark - Vowel match tests

- (void) testCanMatchWordWithDifferentStartingVowels {
  [self.wordIndex addToIndex:@"about"];
  XCTAssertTrue([[self.wordIndex matchesToWord:@"obout"] isEqualToArray:@[@"about"]], @"Should be able to return matches to words with different starting vowels");
}

- (void) testCanMatchWordWithDifferentEndingVowels {
  [self.wordIndex addToIndex:@"able"];
  XCTAssertTrue([[self.wordIndex matchesToWord:@"abla"] isEqualToArray:@[@"able"]], @"Should be able to return matches to words with different ending vowels");
}

- (void) testCanMatchWordWithDifferentStartingAndEndingVowels {
  [self.wordIndex addToIndex:@"able"];
  XCTAssertTrue([[self.wordIndex matchesToWord:@"ubla"] isEqualToArray:@[@"able"]], @"Should be able to return matches to words with different starting and ending vowels");
}

- (void) testCanMatchWordWithDifferentStartingAndEndingVowelsAndDifferentMiddle {
  [self.wordIndex addToIndex:@"able"];
  XCTAssertTrue([[self.wordIndex matchesToWord:@"ulba"] isEqualToArray:@[@"able"]], @"Should be able to return matches to words with different starting and ending vowels and have a different middle");
}

#pragma mark - Tests with no index or bad input
- (void) testNoMatchesWithNoIndexedWords {
  XCTAssertTrue([[self.wordIndex matchesToWord:@"test"] isEqualToArray:@[]], @"Should not match a word that does not start and end with the same characters");
}

- (void) testNoMatchesWithEmptyString {
  XCTAssertTrue([[self.wordIndex matchesToWord:@""] isEqualToArray:@[]], @"Should have no matches when given an empty string");
}


- (void) testReturnsEmptyArrayWhenMatchingAgainstNil {
  XCTAssertTrue([[self.wordIndex matchesToWord:nil] isEqualToArray:@[]], @"Finding matches against nil should return an empty array");
}

@end
