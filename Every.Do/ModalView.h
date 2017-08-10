//
//  ModalView.h
//  Every.Do
//
//  Created by Tye Blackie on 2017-08-08.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol addNewTask <NSObject>

- (void)addNewTask:(ToDo*)newToDo;

@end



@interface ModalView : UIViewController

@property (weak, nonatomic) NSArray* toDoItems;
@property (weak) id <addNewTask> delegate;

@end
