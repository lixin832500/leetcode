//
//  main.m
//  twoSumII
//
//  Created by Tianji Li on 2015-01-07.
//  Copyright (c) 2015 Tianji Li. All rights reserved.
//

/**
 Question:
 Given an array of integers, find two numbers such that they add up to a specific target number.
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
 You may assume that each input would have exactly one solution.
 
 Similar to Question [1. Two Sum], except that the input array is already sorted in ascending order.
 */
#import <Foundation/Foundation.h>

NSArray *twoSumII(NSArray *intArray,  NSNumber *target)
{
    NSInteger i = 0;
    NSInteger j = intArray.count - 1;
    while ( i < j ){
        
        NSNumber *firstNumber = (NSNumber *)[intArray objectAtIndex:i];
        NSNumber *secondNumber = (NSNumber *)[intArray objectAtIndex:(j - i)];

        NSInteger currentSum = [firstNumber integerValue] + [secondNumber integerValue];
        NSInteger targetValue = [target integerValue];
        
        if (currentSum == targetValue)
        {
            // find it, return index in hash first as it is smaller than current index
            return @[[NSNumber numberWithInteger:(i + 1)], [NSNumber numberWithInteger:(j + 1)]];
        } else if ( currentSum > targetValue)
        {
            j = j - 1;
        } else if (currentSum < targetValue)
        {
            i = i + 1;
        }

    };

    // did not find the target
    return nil;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *intArray = @[[NSNumber numberWithInteger:55], [NSNumber numberWithInteger:66], [NSNumber numberWithInteger:77]];
        NSNumber *target = @1321;
        NSArray *indices = twoSumII(intArray, target);
        if (indices.count == 2)
            NSLog(@"\n\n %s, found index1 = %@, index2 = %@, for target = %lu in array = %@",
                  __func__, [indices objectAtIndex:0], [indices objectAtIndex:1], [target integerValue], intArray);
        else
            NSLog(@"\n\n %s, did not find the two sum!", __func__);
    }
    return 0;
}
