//
//  SCIndexScanner.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <XCTest/XCTest.h>
#import "SCIndexScanner.h"

@interface SCIndexScanner_Tests : XCTestCase

@end

@implementation SCIndexScanner_Tests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testCannotBeInitializedDirectly {
    XCTAssertThrows([SCIndexScanner new], @"SCIndexScanner should not be allowed to be initialized directly");
}

@end
