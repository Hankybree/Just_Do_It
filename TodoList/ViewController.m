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

NSUserDefaults *settings;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    settings = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *dictList = [settings objectForKey:@"tasks"];
    
    if (dictList != nil) {
        
        [TaskHandler setDictList:dictList];
        
        taskList = [TaskHandler getTaskList];
    } else {
        
        taskList = [TaskHandler getTaskList];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

- (IBAction)addButton:(id)sender {
    
    UIAlertController *taskInput = [UIAlertController alertControllerWithTitle:@"Add task" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [taskInput addTextFieldWithConfigurationHandler:^(UITextField *taskField) {
        
        taskField.placeholder = @"Task";
        taskField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    
    [taskInput addTextFieldWithConfigurationHandler:^(UITextField *dateField) {
       
        dateField.placeholder = @"Due date";
        dateField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * action) {
        
        [TaskHandler addTask:taskInput.textFields[0].text completionDate:taskInput.textFields[1].text];
        
        [self.tableView reloadData];
    }];
    
    [taskInput addAction:defaultAction];
    [self presentViewController:taskInput animated:YES completion:nil];
}

- (IBAction)removeButton:(id)sender {
    
    if(self.tableView.indexPathForSelectedRow != nil) {
        
        [TaskHandler removeTaskAtIndex:(unsigned int)self.tableView.indexPathForSelectedRow.row];
        
        [self.tableView reloadData];
    }
}

- (IBAction)markCompleteButton:(id)sender {
    
    if(self.tableView.indexPathForSelectedRow != nil) {
        
        Task *task = [TaskHandler getTaskList][self.tableView.indexPathForSelectedRow.row];
        
        if(task.completed == 0) {
            
            task.completed = 1;
            
        } else {
            
            task.completed = 0;
        }
        
        [self.tableView reloadData];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    
    NSMutableArray *dictList = [TaskHandler convertToDictArray:taskList];
    
    [settings setObject:dictList forKey:@"tasks"];
    
    [settings synchronize];
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
    
    Task *task = taskList[indexPath.row];
    
    cell.textLabel.text = task.name;
    cell.detailTextLabel.text = task.date;
    
    if(task.completed == 1) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    } else {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}
@end
