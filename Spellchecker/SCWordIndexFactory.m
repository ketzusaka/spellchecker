//
//  SCWordIndexFactory.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import "SCWordIndexFactory.h"
#import "SCIndifferentVowelsWordIndex.h"

@implementation SCWordIndexFactory
+ (SCWordIndex*) indifferentVowelIndexer {
  return [SCIndifferentVowelsWordIndex new];
}
@end
