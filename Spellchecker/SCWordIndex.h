//
//  SCWordIndex.h
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <Foundation/Foundation.h>

@interface SCWordIndex : NSObject
- (void) addToIndex:(NSString*)aString;
- (NSArray*) matchesToWord:(NSString*)aWord;
@end
