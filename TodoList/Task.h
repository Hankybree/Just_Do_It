//
//  Task.h
//  TodoList
//
//  Created by Henrik Frank on 2020-01-21.
//  Copyright © 2020 Henrik Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *date;
@property (nonatomic) int completed;

- (instancetype)initWithName:(NSString*)name andDate:(NSString*)date;
- (instancetype)initWithDict:(NSDictionary*)dict;
- (NSDictionary*)toDict;

@end

NS_ASSUME_NONNULL_END
