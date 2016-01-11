//
//  DMLKVOArray.m
//  KeyValueObservingDemo
//
//  Created by DongMeiliang on 1/11/16.
//  Copyright © 2016 Meiliang Dong. All rights reserved.
//

#import "DMLKVOArray.h"

@interface DMLKVOArray ()

@property (nonatomic) NSMutableArray *KVOBackedArray;

@end

@implementation DMLKVOArray

- (instancetype)init
{
    self = [super init];
    if (self) {
        _KVOBackedArray = [NSMutableArray arrayWithCapacity:1];
    }
    return self;
}

- (NSMutableArray *)KVOArray
{
    return self.KVOBackedArray;
}

- (void)insertObject:(NSObject *)object inKVOArrayAtIndex:(NSUInteger)index
{
    [self.KVOBackedArray insertObject:object atIndex:index];
}

- (void)removeObjectFromKVOArrayAtIndex:(NSUInteger)index
{
    [self.KVOBackedArray removeObjectAtIndex:index];
}

@end
