//
//  SCIndexScannerFactory.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import "SCIndexScannerFactory.h"
#import "SCSkipDuplicateCharactersIndexScanner.h"

@implementation SCIndexScannerFactory
+ (SCIndexScanner*) scannerWithIndex:(SCWordIndex*)anIndex {
  return [[SCSkipDuplicateCharactersIndexScanner alloc] initWithWordIndex:anIndex];
}
@end
