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

#import "JSQMessagesToolbarButtonFactory.h"

#import "UIColor+JSQMessages.h"
#import "UIImage+JSQMessages.h"
#import "NSBundle+JSQMessages.h"


@implementation JSQMessagesToolbarButtonFactory

+ (UIButton *)defaultAccessoryButtonItem
{
    UIImage *accessoryImage = [UIImage yt_clip_icon];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"chat_plist" ofType:@"plist"];
    
    NSDictionary *myPropertiesDict = [[NSDictionary alloc]initWithContentsOfFile:path];
    NSDictionary *PropertiesDict =[[NSDictionary alloc]init];
    PropertiesDict=[myPropertiesDict objectForKey:@"ColorCodeScheme"];
    UIColor *bgColor = UIColorFromRGBA([PropertiesDict[@"TOOLBAR_CLIP_COLOR"] integerValue], 1.0);
    
    
    
    UIImage *normalImage = [accessoryImage jsq_imageMaskedWithColor:bgColor];
    //UIImage *highlightedImage = [accessoryImage jsq_imageMaskedWithColor:[UIColor darkGrayColor]];

    UIButton *accessoryButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 30, 40.0f)];
    [accessoryButton setImage:normalImage forState:UIControlStateNormal];
   // [accessoryButton setImage:highlightedImage forState:UIControlStateHighlighted];
    accessoryButton.imageEdgeInsets = UIEdgeInsetsMake(2.0f,7.5f,2.0f,7.5f);

    accessoryButton.contentMode = UIViewContentModeScaleToFill;
    accessoryButton.backgroundColor = [UIColor clearColor];
    accessoryButton.tintColor = [UIColor lightGrayColor];

    return accessoryButton;
}
+ (UIButton *)defaultSendButtonItem
{
    UIImage *accessoryImage = [UIImage yt_send_icon];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"chat_plist" ofType:@"plist"];
    
    NSDictionary *myPropertiesDict = [[NSDictionary alloc]initWithContentsOfFile:path];
    NSDictionary *PropertiesDict =[[NSDictionary alloc]init];
    PropertiesDict=[myPropertiesDict objectForKey:@"ColorCodeScheme"];
    UIColor *bgColor = UIColorFromRGBA([PropertiesDict[@"TOOLBAR_SEND_COLOR"] integerValue], 1.0);
    
    UIImage *normalImage = [accessoryImage jsq_imageMaskedWithColor:bgColor];
    //UIImage *highlightedImage = [accessoryImage jsq_imageMaskedWithColor:[UIColor darkGrayColor]];
    
    UIButton *accessoryButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 40, 40.0f)];//30,20
    accessoryButton.imageEdgeInsets = UIEdgeInsetsMake(5.0f, 5.0f, 5.0f, 5.0f);
    [accessoryButton setImage:normalImage forState:UIControlStateNormal];
    accessoryButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    accessoryButton.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    //[accessoryButton setImage:highlightedImage forState:UIControlStateHighlighted];
    
    accessoryButton.contentMode = UIViewContentModeScaleAspectFit;
    accessoryButton.backgroundColor = [UIColor clearColor];
    accessoryButton.tintColor = [UIColor lightGrayColor];
    
    return accessoryButton;
}
//+ (UIButton *)defaultSendButtonItem
//{
//    NSString *sendTitle = [NSBundle jsq_localizedStringForKey:@"send"];
//
//    UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectZero];
//    [sendButton setTitle:sendTitle forState:UIControlStateNormal];
//    [sendButton setTitleColor:[UIColor jsq_messageBubbleBlueColor] forState:UIControlStateNormal];
//    [sendButton setTitleColor:[[UIColor jsq_messageBubbleBlueColor] jsq_colorByDarkeningColorWithValue:0.1f] forState:UIControlStateHighlighted];
//    [sendButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
//
//    sendButton.titleLabel.font = [UIFont boldSystemFontOfSize:17.0f];
//    sendButton.titleLabel.adjustsFontSizeToFitWidth = YES;
//    sendButton.titleLabel.minimumScaleFactor = 0.85f;
//    sendButton.contentMode = UIViewContentModeCenter;
//    sendButton.backgroundColor = [UIColor clearColor];
//    sendButton.tintColor = [UIColor jsq_messageBubbleBlueColor];
//
//    CGFloat maxHeight = 32.0f;
//
//    CGRect sendTitleRect = [sendTitle boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, maxHeight)
//                                                   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
//                                                attributes:@{ NSFontAttributeName : sendButton.titleLabel.font }
//                                                   context:nil];
//
//    sendButton.frame = CGRectMake(0.0f,
//                                  0.0f,
//                                  CGRectGetWidth(CGRectIntegral(sendTitleRect)),
//                                  maxHeight);
//
//    return sendButton;
//}

@end
