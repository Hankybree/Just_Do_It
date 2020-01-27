//
//  TaskHandler.m
//  TodoList
//
//  Created by Henrik Frank on 2020-01-21.
//  Copyright © 2020 Henrik Frank. All rights reserved.
//

#import "TaskHandler.h"
#import "Task.h"

@implementation TaskHandler

static NSMutableArray *taskList;
static NSMutableArray *dictList;

+ (void)addTask:(NSString*)name completionDate:(NSString*)date {
    
    Task *task = [[Task alloc] initWithName:name andDate:date];
    
    [taskList addObject:task];
}

+ (void)removeTaskAtIndex:(NSInteger)index {
    
    [taskList removeObjectAtIndex:(unsigned int)index];
}

+ (NSMutableArray*)convertToDictArray:(NSMutableArray*)taskList {
    
    NSMutableArray *dictList = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < taskList.count; i++) {
        
        [dictList addObject:[taskList[i] toDict]];
    }
    
    return dictList;
}

+ (NSMutableArray*)convertToTaskArray:(NSMutableArray *)dictList {
    
    NSMutableArray *taskList = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < dictList.count; i++) {
        
        Task *task = [[Task alloc] initWithDict:dictList[i]];
        
        [taskList addObject:task];
    }
    
    return taskList;
}

+ (NSMutableArray*)getTaskList {
    
    if(taskList == nil && dictList == nil) {
        
        taskList = [[NSMutableArray alloc] init];
        
    } else if(taskList == nil) {
        
        taskList = [self convertToTaskArray:dictList];
    }
    
    return taskList;
}

+ (void)setDictList:(NSMutableArray*)dict {
    
    dictList = dict;
}

@end
