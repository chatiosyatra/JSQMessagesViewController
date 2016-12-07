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

#import "UIImage+JSQMessages.h"

#import "NSBundle+JSQMessages.h"


@implementation UIImage (JSQMessages)

- (UIImage *)jsq_imageMaskedWithColor:(UIColor *)maskColor
{
    NSParameterAssert(maskColor != nil);
    
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextScaleCTM(context, 1.0f, -1.0f);
        CGContextTranslateCTM(context, 0.0f, -(imageRect.size.height));
        
        CGContextClipToMask(context, imageRect, self.CGImage);
        CGContextSetFillColorWithColor(context, maskColor.CGColor);
        CGContextFillRect(context, imageRect);
        
        newImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)jsq_bubbleImageFromBundleWithName:(NSString *)name
{
    NSBundle *bundle = [NSBundle jsq_messagesAssetBundle];
    NSString *path = [bundle pathForResource:name ofType:@"png" inDirectory:@"Images"];
    return [UIImage imageWithContentsOfFile:path];
}


+ (UIImage *)ytchat_bubbleImageFromBundleWithName:(NSString *)name
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:name ofType:@"png"];
    return [UIImage imageWithContentsOfFile:path];
    
}

+ (UIImage *)jsq_bubbleRegularImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_regular"];
}

+ (UIImage *)jsq_bubbleRegularTaillessImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_tailless"];
}

+ (UIImage *)jsq_bubbleRegularStrokedImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_stroked"];
}

+ (UIImage *)jsq_bubbleRegularStrokedTaillessImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_stroked_tailless"];
}

+ (UIImage *)jsq_bubbleCompactImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_min"];
}

+ (UIImage *)jsq_bubbleCompactTaillessImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_min_tailless"];
}

+ (UIImage *)jsq_defaultAccessoryImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"clip"];
}

+ (UIImage *)jsq_defaultTypingIndicatorImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"typing"];
}

+ (UIImage *)jsq_defaultPlayImage
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"play"];
}

+ (UIImage *)yt_first_bubble
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"img_chat_bubble_outgoing_first"];
}

+ (UIImage *)yt_system_bubble
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_System Message (1)"];//img_chat_bubble_system.9
}
+ (UIImage *)yt_middle_bubble
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"img_chat_bubble_outgoing_middle"];
}
+ (UIImage *)yt_last_bubble
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"img_chat_bubble_outgoing_last"];
}
+ (UIImage *)yt_single_bubble
{
    return [UIImage jsq_bubbleImageFromBundleWithName:@"bubble_blue (1)"];//img_chat_bubble_outgoing_single.9
}

+ (UIImage *)yt_back_image
{
    NSLog(@"yt_back_image");
    return [UIImage jsq_bubbleImageFromBundleWithName:@"Previous"];}

+ (UIImage *)yt_call_connect_image
{
    NSLog(@"yt_back_image");
    return [UIImage jsq_bubbleImageFromBundleWithName:@"ic_call_white"];
}

+ (UIImage *)yt_menu_image
{
    NSLog(@"yt_menu_image");
    return [UIImage jsq_bubbleImageFromBundleWithName:@"menu_filled"];
}

+ (UIImage *)yt_send_icon
{
   
    return [UIImage jsq_bubbleImageFromBundleWithName:@"ic_send_blue"];
}

+ (UIImage *)yt_clip_icon
{
    
    return [UIImage jsq_bubbleImageFromBundleWithName:@"ic_attach_file_blue"];
}



@end
