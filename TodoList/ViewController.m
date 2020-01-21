//
//  ViewController.m
//  TodoList
//
//  Created by Henrik Frank on 2020-01-21.
//  Copyright © 2020 Henrik Frank. All rights reserved.
//

#import "ViewController.h"
#import "TaskHandler.h"
#import "Task.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

NSMutableArray *taskList;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [TaskHandler addTask:@"sopa golvet" completionDate:@"22/1/20"];
    
    taskList = [TaskHandler getTaskList];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return taskList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Här skickas data in i cellen.
    
    Task *task = taskList[indexPath.row];
    
    cell.textLabel.text = task.name;
    cell.detailTextLabel.text = task.date;
    
    return cell;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    
}

@end
