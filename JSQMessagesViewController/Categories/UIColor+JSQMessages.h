//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import <UIKit/UIKit.h>

@interface UIColor (JSQMessages)
#define BGCOLOR [UIColor colorWithRed:255.0f/255.0f green:251.0f/255.0f blue:237/255.0f alpha:1]
#define UIColorFromRGBA(rgbValue, alphaValue) ([UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((CGFloat)(rgbValue & 0xFF)) / 255.0 \
alpha:alphaValue])
#pragma mark - Message bubble colors

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app green bubble color.
 */
+ (UIColor *)jsq_messageBubbleGreenColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app blue bubble color.
 */
+ (UIColor *)jsq_messageBubbleLightBlueColor;


+ (UIColor *)jsq_messageBubbleBlueColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 red color.
 */
+ (UIColor *)jsq_messageBubbleRedColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app light gray bubble color.
 */
+ (UIColor *)jsq_messageBubbleLightGrayColor;


+ (UIColor *)jsq_systemmessageBGColor;


+(UIColor*)jsq_systemmessageTextColor;

+(UIColor*)jsq_dateLabelBGColor;
+(UIColor*)jsq_recievedMessageBGColor;

+(UIColor*)jsq_sendMessageBGColor;

#pragma mark - Utilities

/**
 *  Creates and returns a new color object whose brightness component is decreased by the given value, using the initial color values of the receiver.
 *
 *  @param value A floating point value describing the amount by which to decrease the brightness of the receiver.
 *
 *  @return A new color object whose brightness is decreased by the given values. The other color values remain the same as the receiver.
 */
- (UIColor *)jsq_colorByDarkeningColorWithValue:(CGFloat)value;

@end