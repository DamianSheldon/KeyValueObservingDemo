//
//  DMLKVOArray.h
//  KeyValueObservingDemo
//
//  Created by DongMeiliang on 1/11/16.
//  Copyright © 2016 Meiliang Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMLKVOArray : NSObject

- (NSMutableArray *)KVOArray;
- (void)insertObject:(NSObject *)object inKVOArrayAtIndex:(NSUInteger)index;
- (void)removeObjectFromKVOArrayAtIndex:(NSUInteger)index;

@end
