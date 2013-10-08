//
//  main.m
//  Euler
//
//  Created by Matt Jackson on 08/10/2013.
//  Copyright (c) 2013 Matt Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation NSArray (RangeArray)

+ (NSArray *) arrayWithNumbersInRange: (NSRange) range {
    NSMutableArray *retRange = [NSMutableArray array];
    for (NSUInteger i = range.location; i <= range.location + range.length; i++) {
        [retRange addObject:[NSNumber numberWithUnsignedInteger:i]];
    }
    return retRange;
}

+ (NSArray *) arrayWithNumbersInRange: (NSRange) range multiplesOf: (NSArray *) multiples {
    return [[NSArray arrayWithNumbersInRange:range] filteredArrayUsingPredicate:
                [NSPredicate predicateWithBlock:^BOOL(NSNumber *arrayValue, NSDictionary *bindings) {
                    for (NSNumber *multiple in multiples) {
                        if ([arrayValue intValue] % [multiple intValue] == 0)
                            return YES;
                    }
                    return NO;
            }]];
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSNumber *sumMultiples = @0;
        for (NSNumber *factor in [NSArray arrayWithNumbersInRange:NSMakeRange(1,1000) multiplesOf:@[@3, @5]]) {
            sumMultiples = [NSNumber numberWithInt:[sumMultiples intValue] + [factor intValue]];
        };
        
        NSLog(@"%@", sumMultiples);
    }
    return 0;
}

