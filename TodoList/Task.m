//
//  Task.m
//  TodoList
//
//  Created by Henrik Frank on 2020-01-21.
//  Copyright © 2020 Henrik Frank. All rights reserved.
//

#import "Task.h"

@implementation Task

- (instancetype)initWithName:(NSString *)name andDate:(NSString *)date {
    
    self = [super init];
    
    if(self) {
        
        NSString *appendedDate = [[NSString alloc] initWithFormat:@"Due: %@", date];
        
        self.name = name;
        self.date = appendedDate;
        self.completed = 0;
    }
    
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    
    if(self) {
        
        NSNumber *completedUnpackaged = dict[@"completed"];
        
        self.name = dict[@"name"];
        self.date = dict[@"date"];
        self.completed = completedUnpackaged.intValue;
    }
    
    return self;
}

- (NSDictionary*)toDict {
    
    NSNumber *completedPackage = [[NSNumber alloc] initWithInt:self.completed];
    
    NSDictionary *taskDict = @{@"name":self.name, @"date":self.date, @"completed":completedPackage};
    
    return taskDict;
}

@end
