//
//  ViewController.m
//  KeyValueObservingDemo
//
//  Created by DongMeiliang on 1/9/16.
//  Copyright © 2016 Meiliang Dong. All rights reserved.
//

#import "ViewController.h"
#import "DMLKVOArray.h"

static int PrivateKVOContext;

@interface ViewController ()

@property (nonatomic, assign) NSUInteger count;
@property (nonatomic) NSMutableArray *collection;
@property (nonatomic) DMLKVOArray *KVOArray;

@end

@implementation ViewController

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"count"];
    [self removeObserver:self forKeyPath:@"collection"];
    [self.KVOArray removeObserver:self forKeyPath:@"KVOArray"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collection = [[NSMutableArray alloc] initWithCapacity:128];
    self.KVOArray = [DMLKVOArray new];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(handleCount) userInfo:nil repeats:YES];
    
    [self addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew context:&PrivateKVOContext];
    [self addObserver:self forKeyPath:@"collection" options:NSKeyValueObservingOptionNew context:&PrivateKVOContext];
    [self.KVOArray addObserver:self forKeyPath:@"KVOArray" options:NSKeyValueObservingOptionNew context:&PrivateKVOContext];
}

#pragma mark - Change Notification

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (context == &PrivateKVOContext) {        
        NSLog(@"observeValueForKeyPath:%@", keyPath);
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - Private Method

- (void)handleCount
{
    static NSUInteger i = 0;
    static BOOL increment = YES;
    
    if (increment) {
        i ++;
        if (i > 127) {
            increment = NO;
        }
    }
    else {
        i --;
        if (!i) {
            increment = YES;
        }
    }
//    NSLog(@"count:%ld", i);

    if (increment) {
        NSObject *anObject = [NSObject new];
        [self.collection addObject:anObject];
        
        NSMutableArray *array = [self.KVOArray mutableArrayValueForKey:@"KVOArray"];
        
        [array addObject:anObject];
    }
    else {
        [self.collection removeLastObject];
        NSMutableArray *array = [self.KVOArray mutableArrayValueForKey:@"KVOArray"];
        
        if (array.count > 0) {
            [array removeLastObject];
        }
    }
    
    self.count = self.collection.count;
}

@end
