//
//  TaskHandler.h
//  TodoList
//
//  Created by Henrik Frank on 2020-01-21.
//  Copyright © 2020 Henrik Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaskHandler : NSObject

@property (nonatomic) NSMutableArray *taskList;
@property (nonatomic) NSMutableArray *dictList;

+ (void)addTask:(NSString*)name completionDate:(NSString*)date;
+ (NSMutableArray*)getTaskList;

@end

NS_ASSUME_NONNULL_END
