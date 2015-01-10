//
//  main.m
//  ReverseWordsInString
//
//  Created by Tianji Li on 2015-01-10.
//  Copyright (c) 2015 Tianji Li. All rights reserved.
//

/**
 Question:
 Given an input string s, reverse the string word by word.
 For example, given s = "the sky is blue", return "blue is sky the".
 
 NOTE: defination of a word is "A sequence of non-space characters constitutes a word". Weired? Yes, it is. But who cares.
 */

#import <Foundation/Foundation.h>


NSString *reversedString(NSString *s)
{
    NSUInteger strSize = [s length];
    NSMutableString *rs = @"".mutableCopy;
    NSMutableString *aWord = @"".mutableCopy;
    NSUInteger i = 0;
    
    while ( i < strSize ) {
        unichar c = [s characterAtIndex:i];
        if ( c != ' ' )
            [aWord appendFormat:@"%c", c];
        
        if ( c == ' ' || i == strSize - 1 ) {
            if ([aWord length] > 0) {
                [rs insertString:aWord atIndex:0];
                [rs insertString:@" " atIndex:aWord.length];
                aWord = @"". mutableCopy;
            }
        }
            
        i++;
    }
    
    return rs;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *s = @" ! the sky is blue ? ";
        NSLog(@"s=%@, reversed s=%@", s, reversedString(s));
    }
    return 0;
}
