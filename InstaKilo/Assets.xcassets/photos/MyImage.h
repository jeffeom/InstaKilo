//
//  MyImage.h
//  InstaKilo
//
//  Created by Jeff Eom on 2016-07-13.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyImage : NSObject

@property UIImage* image;
@property NSString *subject;
@property NSString *location;

- (instancetype)initWithImage:(UIImage *)image subject:(NSString *)subject andLocation:(NSString *)location;

@end
