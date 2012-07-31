//
//  NSDate+helpers.m
//  insta-tableview
//
// Created by Joshua Kendall on 6/12/11.
// Copyright 2011 JoshuaKendall.com. All rights reserved.
// 
// Modified by Xuan Li 2012 
// Edited to be default ARC compliant and made into a helper and format to be instagram like

#import "NSDate+helpers.h"
#import "NSDate-Utilities.h"

@implementation NSDate (helpers)

+ (NSString *)fuzzyTime:(NSString *)datetime
{
    NSString *formatted;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[datetime intValue]];    
    NSDate *today = [NSDate date];

    NSInteger seconds = fabs([today secondsAfterDate:date]);
    NSInteger minutes = [today minutesAfterDate:date];
    NSInteger hours = [today hoursAfterDate:date];
    NSInteger days = [today daysAfterDate:date];
    
    if(days >= 365) {
        formatted = [NSString stringWithFormat:@"%dy", days/365];
    } else if(days < 365 && days >= 30) {
        formatted = [NSString stringWithFormat:@"%dw", days/7];
    } else if(days >= 1) {
        formatted = [NSString stringWithFormat:@"%dd", days];
    } else if(minutes >= 60) {
        formatted = [NSString stringWithFormat:@"%dh", hours];
    } else if(minutes >= 1 && minutes < 60) {
        formatted = [NSString stringWithFormat:@"%dm", minutes];
    } else {
        formatted = [NSString stringWithFormat:@"%ds", seconds];
    }
    
    return formatted;
}

@end
