//
//  Spellchecker_Tests.m
//  Spellchecker Tests
//
//  Created by James Richard on 6/27/13.
//
//

#import <XCTest/XCTest.h>
#import "Spellchecker.h"

@interface Spellchecker_Tests : XCTestCase

@end

@implementation Spellchecker_Tests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testInitializeWithValidFilePathSucceeds {
  NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:kSpellcheckerTestDictionaryFile ofType:nil];
  XCTAssertNoThrow([[Spellchecker alloc] initWithDictionaryPath:path], @"Spellchecker raised exception when it shouldn't have");
}

-(void) testInitializeWithInvalidFilePathFails {
  XCTAssertThrows([[Spellchecker alloc] initWithDictionaryPath:@"fake"], @"Spellchecker should not allow a nonexistant dictionary file to be loaded");
}

- (void) testInitializeRaisesException {
  XCTAssertThrows([[Spellchecker alloc] init], @"Spellchecker should not allow init to be called");
}

@end
