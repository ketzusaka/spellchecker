//
//  main.m
//  Spellchecker
//
//  Created by James Richard on 6/26/13.
//
//

#import <Foundation/Foundation.h>
#import "Spellchecker.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Spellchecker *spellchecker = [[Spellchecker alloc] initWithDictionaryPath:@"/usr/share/dict/words"];
    [spellchecker begin];
  }
  
  return 0;
}

