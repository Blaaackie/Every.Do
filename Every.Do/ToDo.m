//
//  ToDo.m
//  Every.Do
//
//  Created by Tye Blackie on 2017-08-08.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

-(instancetype)initWithTitle:(NSString*) title
             toDoDescription:(NSString*) toDoDescription
              priorityNumber:(int) priorityNumber
                 isCompleted:(BOOL) isCompleted{
    self = [super init];
    if(self) {
        _title = title;
        _toDoDescription = toDoDescription;
        _priorityNumber = priorityNumber;
        _isCompleted = isCompleted;
    }
    return self;
}

@end
