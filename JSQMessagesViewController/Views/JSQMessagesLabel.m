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

#import "JSQMessagesLabel.h"
#import <CoreText/CoreText.h>

@interface JSQMessagesLabel ()

- (void)jsq_configureLabel;

@end


@implementation JSQMessagesLabel

#pragma mark - Initialization

- (void)jsq_configureLabel
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.textInsets = UIEdgeInsetsZero;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self jsq_configureLabel];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self jsq_configureLabel];
}

#pragma mark - Setters

- (void)setTextInsets:(UIEdgeInsets)textInsets
{
    if (UIEdgeInsetsEqualToEdgeInsets(_textInsets, textInsets)) {
        return;
    }
    
    _textInsets = textInsets;
    [self setNeedsDisplay];
}

#pragma mark - Drawing

- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:CGRectMake(CGRectGetMinX(rect) + self.textInsets.left,
                                     CGRectGetMinY(rect) + self.textInsets.top,
                                     CGRectGetWidth(rect) - self.textInsets.right,
                                     CGRectGetHeight(rect) - self.textInsets.bottom)];
}

@end

@implementation MyLabel



- (void)drawRect:(CGRect)rect
{
    //[super drawRect:rect];
   
    if (self.attributedText) {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
        
        CTFontRef aFont = CTFontCreateWithName((__bridge CFStringRef)[self.font fontName], [self.font pointSize], NULL);
        
        [string addAttribute:(__bridge NSString *)kCTFontAttributeName
                       value:(__bridge id)aFont
                       range:NSMakeRange(0, [string length])];
        
        [string addAttribute:(__bridge NSString *)kCTForegroundColorAttributeName
                       value:(id)[self textColor].CGColor
                       range:NSMakeRange(0, [string length])];
        
        CFRelease(aFont);
        
        
        
        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)string);
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, NULL, CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
        
        CTFrameRef totalFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetTextMatrix(context, CGAffineTransformIdentity);
        CGContextTranslateCTM(context, 0, self.bounds.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        
        NSArray* lines = (__bridge NSArray*)CTFrameGetLines(totalFrame);
        CFIndex lineCount = [lines count];
        
        CGPoint origins[lineCount];
        CTFrameGetLineOrigins(totalFrame, CFRangeMake(0, 0), origins);
        
        for(CFIndex index = 0; index < lineCount; index++)
        {
            CTLineRef line = CFArrayGetValueAtIndex((CFArrayRef)lines, index);
            
            CFArrayRef glyphRuns = CTLineGetGlyphRuns(line);
            CFIndex glyphCount = CFArrayGetCount(glyphRuns);
            
            for (int i = 0; i < glyphCount; ++i)    {
                CTRunRef run = CFArrayGetValueAtIndex(glyphRuns, i);
                
                NSDictionary *attributes = (__bridge NSDictionary*)CTRunGetAttributes(run);
                
                if ([attributes objectForKey:NSBackgroundColorAttributeName]){
                    CGRect runBounds;
                    CGFloat ascent, descent;
                    
                    runBounds.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &descent, NULL);
                    runBounds.size.height = ascent + descent;
                    
                    runBounds.origin.x = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
                    runBounds.origin.y = self.frame.size.height - origins[lineCount - index].y - runBounds.size.height;
                    
                    UIColor *highlightColor =  [attributes objectForKey:NSBackgroundColorAttributeName];
                    
                    UIColor *fillColor = highlightColor;
                    [fillColor setFill];
                    UIColor *strokeColor = highlightColor;
                    [strokeColor setStroke];
                    
                    UIBezierPath *pathToDraw = [UIBezierPath bezierPathWithRoundedRect:runBounds
                                                                     byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight|UIRectCornerTopLeft|UIRectCornerTopRight)
                                                                           cornerRadii:CGSizeMake(4, 4)];
                    
                    //[pathToDraw closePath];
                    [pathToDraw fill]; // this will fill a closed path
                    [pathToDraw stroke];
                    
                    
//                    CGColorRef highlightColor = highlightColour.CGColor;
//                    CGContextSetFillColorWithColor(context, highlightColor);
//                    CGContextSetStrokeColorWithColor(context, highlightColor);
//                    CGContextStrokePath(context);
//                    CGContextFillRect(context, runBounds);
                    
                }
            }
        }
        
        CTFrameDraw(totalFrame, context);
        
        CFRelease(totalFrame);
        CGPathRelease(path);
        CFRelease(framesetter);
    }
    
    
}



@end
