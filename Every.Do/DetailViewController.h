//
//  DetailViewController.h
//  Every.Do
//
//  Created by Tye Blackie on 2017-08-08.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) ToDo * toDoInstance;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

