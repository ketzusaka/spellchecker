//
//  Spellchecker.h
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import <Foundation/Foundation.h>

@interface Spellchecker : NSObject
@property (nonatomic, strong, readonly) NSArray *dictionary;

- (id) initWithDictionaryPath:(NSString*)dictionaryPath;
- (void) begin;
@end
