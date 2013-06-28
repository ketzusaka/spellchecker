//
//  SCIndexScannerFactory.h
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <Foundation/Foundation.h>
@class SCIndexScanner;
@class SCWordIndex;

@interface SCIndexScannerFactory : NSObject
+ (SCIndexScanner*) scannerWithIndex:(SCWordIndex*)anIndex;
@end
