//
//  SCSkipDuplicateCharactersIndexScanner_Tests.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <XCTest/XCTest.h>
#import "SCSkipDuplicateCharactersIndexScanner.h"
#import "SCWordIndexFactory.h"
#import "SCWordIndex.h"

@interface SCSkipDuplicateCharactersIndexScanner_Tests : XCTestCase
@property (nonatomic, strong) SCWordIndex *wordIndex;
@property (nonatomic, strong) SCSkipDuplicateCharactersIndexScanner *indexScanner;
@end

@implementation SCSkipDuplicateCharactersIndexScanner_Tests

- (void)setUp {
  [super setUp];
  self.wordIndex = [SCWordIndexFactory indifferentVowelIndexer];
  [self.wordIndex addToIndex:@"test"];
  [self.wordIndex addToIndex:@"concluded"];
  [self.wordIndex addToIndex:@"applauded"];
  [self.wordIndex addToIndex:@"conspiracy"];
  self.indexScanner = [[SCSkipDuplicateCharactersIndexScanner alloc] initWithWordIndex:self.wordIndex];
}

- (void)tearDown {
  self.indexScanner = nil;
  [super tearDown];
}

- (void) testShouldMatchExactWord {
  NSString *match = [self.indexScanner scanForWord:@"test"];
  XCTAssertEqualObjects(match, @"test", @"Scanner should return exact word when scanned");
}

- (void) testMultipleChoicesItPicksExactMatch {
  [self.wordIndex addToIndex:@"tost"];
  NSString *match = [self.indexScanner scanForWord:@"test"];
  XCTAssertEqualObjects(match, @"test", @"Scanner should return exact word when scanned and there could be multiple matches");
}

- (void) testCanMatchWordWithRunOnConstants {
  NSString *match = [self.indexScanner scanForWord:@"conncluded"];
  XCTAssertEqualObjects(match, @"concluded", @"Scanner should return a match when there are duplicated constants");
}

- (void) testCanMatchWordWithRunOnConstantsAtEnd {
  NSString *match = [self.indexScanner scanForWord:@"testt"];
  XCTAssertEqualObjects(match, @"test", @"Scanner should return a match when there are duplicated constants at the end");
}

- (void) testCanMatchWordWithLotsOfRunOnConstantsAtEnd {
  NSString *match = [self.indexScanner scanForWord:@"testtttttttttt"];
  XCTAssertEqualObjects(match, @"test", @"Scanner should return a match when there are lots duplicated constants at the end");
}

- (void) testCanMatchWordShouldNotPickFirstCharacterAsMatchWithBetterOptions {
  [self.wordIndex addToIndex:@"t"];
  NSString *match = [self.indexScanner scanForWord:@"tost"];
  XCTAssertEqualObjects(match, @"test", @"Scanner should return a match when there are lots duplicated constants at the end");
}

- (void) testRemovesAggresivelyEnough {
  [self.wordIndex addToIndex:@"ta"];
  [self.wordIndex addToIndex:@"taste"];
  NSString *match = [self.indexScanner scanForWord:@"taaste"];
  XCTAssertEqualObjects(match, @"taste", @"Scanner should return the right word");
}

- (void) testMatchWordWithIncorrectVowel {
  NSString *match = [self.indexScanner scanForWord:@"cuncluded"];
  XCTAssertEqualObjects(match, @"concluded", @"Scanner should return a match when a vowel is mixed up");
}

- (void) testMatchWordIgnoresConstantCase {
  NSString *match = [self.indexScanner scanForWord:@"Test"];
  XCTAssertEqualObjects(match, @"test", @"Scanner should return a match when a constant is capitalized");
}

- (void) testEndingVowelsDontMessWithResult {
  [self.wordIndex addToIndex:@"he"];
  [self.wordIndex addToIndex:@"hey"];
  NSString *match = [self.indexScanner scanForWord:@"hey"];
  XCTAssertEqualObjects(match, @"hey", @"Scanner should return the right word");
}
@end
