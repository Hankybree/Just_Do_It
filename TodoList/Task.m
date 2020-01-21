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
        
        self.name = name;
        self.date = date;
    }
    
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    
    if(self) {
        
        self.name = dict[@"name"];
        self.date = dict[@"date"];
    }
    
    return self;
}

- (NSDictionary*)toDict {
    
    NSDictionary *taskDict = @{@"name":self.name, @"date":self.date};
    
    return taskDict;
}

@end
