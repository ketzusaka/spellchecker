//
//  SCWordIndex_Tests.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <XCTest/XCTest.h>
#import "SCWordIndex.h"

@interface SCWordIndex_Tests : XCTestCase

@end

@implementation SCWordIndex_Tests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testWordIndexCannotBeInitializedDirectly {
  XCTAssertThrows([SCWordIndex new], @"SCWordIndex should not be allowed to be initialized directly");
}

@end
