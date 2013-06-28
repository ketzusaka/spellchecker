//
//  SCWordIndexFactory.h
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <Foundation/Foundation.h>

@class SCWordIndex;

@interface SCWordIndexFactory : NSObject
+ (SCWordIndex*) indifferentVowelIndexer;
@end
