//
//  ModalView.m
//  Every.Do
//
//  Created by Tye Blackie on 2017-08-08.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "ModalView.h"
#import "ToDo.h"

@interface ModalView ()
@property (weak, nonatomic) IBOutlet UITextField *tastTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;

@end

@implementation ModalView

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)addTaskToList:(id)sender {
    ToDo *newToDo = [[ToDo alloc] initWithTitle:self.tastTextField.text  toDoDescription:self.descriptionTextField.text priorityNumber:[self.priorityTextField.text intValue] isCompleted:NO];
    [self.delegate addNewTask:newToDo];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
