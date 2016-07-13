//
//  MyImage.m
//  InstaKilo
//
//  Created by Jeff Eom on 2016-07-13.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import "MyImage.h"

@implementation MyImage

- (instancetype)initWithImage:(UIImage *)image subject:(NSString *)subject andLocation:(NSString *)location
{
    self = [super init];
    if (self) {
        _image = image;
        _subject = subject;
        _location = location;
    }
    return self;
}

@end
