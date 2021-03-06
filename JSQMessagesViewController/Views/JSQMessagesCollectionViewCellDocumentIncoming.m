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

#import "JSQMessagesCollectionViewCellDocumentIncoming.h"
#import "UIImage+JSQMessages.h"
@interface JSQMessagesCollectionViewCellDocumentIncoming ()
@end
@implementation JSQMessagesCollectionViewCellDocumentIncoming

#pragma mark - Overrides

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentLeft;
    self.cellBottomLabel.textAlignment = NSTextAlignmentLeft;
    self.documentIconView.image=[UIImage jsq_bubbleImageFromBundleWithName:@"ic_attached_file"];
    }




@end
