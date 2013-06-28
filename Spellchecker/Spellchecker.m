//
//  Spellchecker.m
//  Spellchecker
//
//  Created by James Richard on 6/27/13.
//
//

#import "Spellchecker.h"
#import "SCWordIndex.h"
#import "SCWordIndexFactory.h"
#import "SCIndexScanner.h"
#import "SCIndexScannerFactory.h"

@interface Spellchecker ()
@property (nonatomic, strong) NSArray *dictionary;
@property (nonatomic, strong) SCWordIndex *wordIndex;
@property (nonatomic, strong) NSFileHandle *input;
@property (nonatomic, strong) NSFileHandle *output;
@property (nonatomic, strong) SCIndexScanner *scanner;

- (void) indexDictionary;
- (void) loadWordDictionaryFromFile:(NSString*)filePath;
@end

@implementation Spellchecker
- (id) init {
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:@"You must initialize Spellchecker with a dictionary path"
                               userInfo:nil];
}

- (id) initWithDictionaryPath:(NSString*)dictionaryPath {
  if ((self = [super init])) {
    [self loadWordDictionaryFromFile:dictionaryPath];
    [self indexDictionary];
  }
  
  return self;
}

- (void) indexDictionary {
  self.wordIndex = [SCWordIndexFactory indifferentVowelIndexer];
  [self.dictionary enumerateObjectsUsingBlock:^(NSString *word, NSUInteger idx, BOOL *stop) {
    if (word.length > 0)
      [self.wordIndex addToIndex:word];
  }];
}

- (void) loadWordDictionaryFromFile:(NSString*)filePath {
  NSError *error;
  NSString *string = [NSString stringWithContentsOfFile:filePath
                      encoding:NSUTF8StringEncoding
                                                  error:&error];
  
  if (error)
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"Could not load the specified dictionary file because: %@", error.localizedFailureReason]  userInfo:@{@"pathGiven":filePath}];
  
  self.dictionary = [string componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

- (void) begin {
  @synchronized(self) {
    self.input = [NSFileHandle fileHandleWithStandardInput];
    self.output = [NSFileHandle fileHandleWithStandardOutput];
    self.scanner = [SCIndexScannerFactory scannerWithIndex:self.wordIndex];
    
    do {
      [self.output writeData:[@"> " dataUsingEncoding:NSUTF8StringEncoding]];
      NSString *userInput = [[[NSString alloc] initWithData:[self.input availableData] encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
      NSString *result = [self.scanner scanForWord:userInput];
      NSString *output;
      
      if (result)
        output = result;
      else
        output = @"NO SUGGESTION";
      
      [self.output writeData:[[output stringByAppendingString:@"\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    } while (YES);
  }
}
@end
