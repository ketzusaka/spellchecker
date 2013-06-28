//
//  SCWordIndex.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import "SCWordIndex.h"

@interface SCWordIndex ()
@property (nonatomic, strong) NSDictionary *wordIndex;
@end

@implementation SCWordIndex
- (id) init {
  if ((self = [super init])) {
    NSAssert(![self isMemberOfClass:[SCWordIndex class]], @"SCWordIndex is an abstract class and cannot be initialized directly");
  }
  
  return self;
}

- (void) addToIndex:(NSString *)aString { }
- (NSArray*) matchesToWord:(NSString *)aWord { return nil; }
@end
