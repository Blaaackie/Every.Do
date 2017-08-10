//
//  MasterViewController.m
//  Every.Do
//
//  Created by Tye Blackie on 2017-08-08.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoCell.h"
#import "ModalView.h"

@interface MasterViewController ()

@property NSMutableArray *toDoItems;
@end

@implementation MasterViewController

- (void)addNewTask:(ToDo*)newToDo{
    if (!self.toDoItems) {
        self.toDoItems = [[NSMutableArray alloc] init];
    }
    [self.toDoItems insertObject:newToDo atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0
                                                inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ToDo *toDo1 = [[ToDo alloc]initWithTitle:@"Buy Socks"
                             toDoDescription:@"Go to whatever store you like and just buy some damn socks"
                              priorityNumber:3
                                 isCompleted:NO];
                   
    ToDo *toDo2 = [[ToDo alloc]initWithTitle:@"Garbage"
                             toDoDescription:@"Take the garbage out to the dumpster behind the building, the larger gold key on the Key-chain will unlock the pad lock, be sure to lock it back up so the racoons and Crazy people can't get in"
                              priorityNumber:2
                                 isCompleted:NO];
                   
    ToDo *toDo3 = [[ToDo alloc]initWithTitle:@"Water The Plants"
                             toDoDescription:@"There are several plants on the balcony as well as inside, be sure to water them everyday (about a cup or two each should be just fine)"
                              priorityNumber:4
                                 isCompleted:NO];
                   
    ToDo *toDo4 = [[ToDo alloc]initWithTitle:@"Mow The Lawn"
                             toDoDescription:@"The mower is in the shed against the south wall, if you need any extra gasoline, there's a Jerry-Can in the garage. It should be easy to spot"
                              priorityNumber:1
                                 isCompleted:NO];
                   
    ToDo *toDo5 = [[ToDo alloc]initWithTitle:@"Have Fun"
                             toDoDescription:@"I left 15,000 bucks on the counter incase you get hungry. Feel free to use any left over money to party like its 1969, just stay away from the hard stuff, and if you go full on interplanetary just make sure you've got a friend there to make sure you don't slip bwetween dimensions."
                              priorityNumber:5
                                 isCompleted:NO];
    
    self.toDoItems = [NSMutableArray arrayWithObjects:toDo1,toDo2,toDo3,toDo4,toDo5, nil];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(crossOutItem:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.tableView addGestureRecognizer:swipe];
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)insertNewObject:(id)sender {
    
    ModalView *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"modalView"];
    vc.delegate = self;
    [self presentViewController:vc
                       animated:YES
                     completion:nil];
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        DetailViewController *toDoDetails =  [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo * item = self.toDoItems[indexPath.row];
        toDoDetails.toDoInstance = item;
    }
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.toDoItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    ToDo *object = self.toDoItems[indexPath.row];
    cell.titleLabel.text = object.title;
    cell.priorityNumberLabel.text = [NSString stringWithFormat:@"%d", object.priorityNumber];
    cell.detailPreviewLabel.text = object.toDoDescription;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}

- (IBAction)crossOutItem:(id)sender{
    
    CGPoint swipeLocation = [sender locationInView:self.view];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
    ToDoCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:((ToDo*)self.toDoItems[indexPath.row]).title];
    [titleString addAttribute:NSStrikethroughStyleAttributeName
                        value:@2
                        range:NSMakeRange(0, [titleString length])];
    cell.titleLabel.attributedText = titleString;
}

@end
