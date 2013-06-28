//
//  SCIndexScanner.h
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <Foundation/Foundation.h>

@class SCWordIndex;

@interface SCIndexScanner : NSObject
@property (nonatomic, getter = isCaseSensitive) BOOL caseSensitive;
- (id) initWithWordIndex:(SCWordIndex*)anIndex;

- (NSString*) scanForWord:(NSString*)aWord;
@end
