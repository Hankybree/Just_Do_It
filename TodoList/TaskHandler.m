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

+ (void)addTask:(NSString*)name completionDate:(NSString*)date {
    
    if(taskList == nil) {
        
        taskList = [[NSMutableArray alloc] init];
    }
    
    Task *task = [[Task alloc] initWithName:name andDate:date];
    
    [taskList addObject:task];
}

+ (NSMutableArray*)getTaskList {
    
    return taskList;
}

@end
