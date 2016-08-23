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

#import "UIColor+JSQMessages.h"
#define UIColorFromRGBA(rgbValue, alphaValue) ([UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((CGFloat)(rgbValue & 0xFF)) / 255.0 \
alpha:alphaValue])
@implementation UIColor (JSQMessages)

#pragma mark - Message bubble colors

+ (UIColor *)jsq_messageBubbleGreenColor
{
    return [UIColor colorWithHue:130.0f / 360.0f
                      saturation:0.68f
                      brightness:0.84f
                           alpha:1.0f];
}

+ (UIColor *)jsq_messageBubbleBlueColor
{
    return [UIColor colorWithHue:210.0f / 360.0f
                      saturation:0.94f
                      brightness:1.0f
                           alpha:1.0f];
}
+ (UIColor *)jsq_messageBubbleLightBlueColor
{
    return [UIColor colorWithRed:113.0f/255.0f green:196.0f/255.0f blue:209.0f/255.0f alpha:1.0f];
}


+ (UIColor *)jsq_systemmessageBGColor
{
    return [UIColor colorWithRed:254.0f/255.0f green:239.0f/255.0f blue:224.0f/255.0f alpha:1.0f];
}

+(UIColor*)jsq_systemmessageTextColor
{
    return [UIColor colorWithRed:190.0f/255.0f green:128.0f/255.0f blue:72.0f/255.0f alpha:1.0f];
}
+(UIColor*)jsq_dateLabelBGColor
{
    return [UIColor colorWithRed:189.0f/255.0f green:233.0f/255.0f blue:240.0f/255.0f alpha:1.0f];
}

+ (UIColor *)jsq_messageBubbleRedColor
{
    return [UIColor colorWithHue:0.0f / 360.0f
                      saturation:0.79f
                      brightness:1.0f
                           alpha:1.0f];
}

+ (UIColor *)jsq_messageBubbleLightGrayColor
{
    return [UIColor colorWithHue:240.0f / 360.0f
                      saturation:0.02f
                      brightness:0.92f
                           alpha:1.0f];
}
+(UIColor *)jsq_recievedMessageBGColor
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"chat_plist" ofType:@"plist"];
    
    NSDictionary *myPropertiesDict = [[NSDictionary alloc]initWithContentsOfFile:path];
    NSDictionary *PropertiesDict =[[NSDictionary alloc]init];
    PropertiesDict=[myPropertiesDict objectForKey:@"ColorCodeScheme"];
    return UIColorFromRGBA([PropertiesDict[@"ChatBubbleReceiver"] integerValue], 1.0);


}
+(UIColor *)jsq_sendMessageBGColor
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"chat_plist" ofType:@"plist"];
    
    NSDictionary *myPropertiesDict = [[NSDictionary alloc]initWithContentsOfFile:path];
    NSDictionary *PropertiesDict =[[NSDictionary alloc]init];
    PropertiesDict=[myPropertiesDict objectForKey:@"ColorCodeScheme"];
    return UIColorFromRGBA([PropertiesDict[@"ChatBubbleSender"] integerValue], 1.0);
    
    
}

#pragma mark - Utilities

- (UIColor *)jsq_colorByDarkeningColorWithValue:(CGFloat)value
{
    NSUInteger totalComponents = CGColorGetNumberOfComponents(self.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    
    CGFloat *oldComponents = (CGFloat *)CGColorGetComponents(self.CGColor);
    CGFloat newComponents[4];
    
    if (isGreyscale) {
        newComponents[0] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[1] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[2] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[3] = oldComponents[1];
    }
    else {
        newComponents[0] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[1] = oldComponents[1] - value < 0.0f ? 0.0f : oldComponents[1] - value;
        newComponents[2] = oldComponents[2] - value < 0.0f ? 0.0f : oldComponents[2] - value;
        newComponents[3] = oldComponents[3];
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
    return retColor;
}

@end