//
//	 ______    ______    ______
//	/\  __ \  /\  ___\  /\  ___\
//	\ \  __<  \ \  __\_ \ \  __\_
//	 \ \_____\ \ \_____\ \ \_____\
//	  \/_____/  \/_____/  \/_____/
//
//
//	Copyright (c) 2013-2014, {Bee} open source community
//	http://www.bee-framework.com
//
//
//	Permission is hereby granted, free of charge, to any person obtaining a
//	copy of this software and associated documentation files (the "Software"),
//	to deal in the Software without restriction, including without limitation
//	the rights to use, copy, modify, merge, publish, distribute, sublicense,
//	and/or sell copies of the Software, and to permit persons to whom the
//	Software is furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//	IN THE SOFTWARE.
//

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "UIButton+BeeUIStyle.h"
#import "UIImage+BeeExtension.h"
#import "UIColor+BeeExtension.h"
#import "UIFont+BeeExtension.h"
#import "UIView+Background.h"

#import "Bee_UIStyleParser.h"

#pragma mark -

@implementation UIImage(bee)

- (void)release
{
	[super release];
}

@end

@implementation UIButton(BeeUIStyle)

+ (BOOL)supportForUIStyling
{
	return YES;
}

- (void)applyButtonBackground:(NSMutableDictionary *)properties
{
	NSString * relativePath = [properties objectForKey:@"package"];
	
	UIImage * imageNormal = [[properties parseImageWithKeys:@[@"background-image", @"button-background", @"button-background-normal"] relativePath:relativePath] stretched];
	UIImage * imageHighlighted = [properties parseImageWithKeys:@[@"background-image-highlighted", @"button-background-highlighted"] relativePath:relativePath defaultValue:imageNormal];
	UIImage * imageDisabled = [properties parseImageWithKeys:@[@"background-image-disabled", @"button-background-disabled"] relativePath:relativePath defaultValue:imageNormal];
	UIImage * imageSelected = [properties parseImageWithKeys:@[@"background-image-selected", @"button-background-selected"] relativePath:relativePath defaultValue:imageNormal];

//	if ( imageNormal )
	{
		[self setBackgroundImage:imageNormal forState:UIControlStateNormal];
	}
	
//	if ( imageHighlighted )
	{
		[self setBackgroundImage:imageHighlighted forState:UIControlStateHighlighted];
	}
	
//	if ( imageDisabled )
	{
		[self setBackgroundImage:imageDisabled forState:UIControlStateDisabled];
	}
	
//	if ( imageSelected )
	{
		[self setBackgroundImage:imageSelected forState:UIControlStateSelected];
	}
}

- (void)applyButtonImage:(NSMutableDictionary *)properties
{
	NSString * relativePath = [properties objectForKey:@"package"];

	UIImage * imageNormal = [[properties parseImageWithKeys:@[@"image", @"image-src", @"button-image", @"button-image-normal"] relativePath:relativePath] stretched];
	UIImage * imageHighlighted = [properties parseImageWithKeys:@[@"image-highlighted", @"button-image-highlighted"] relativePath:relativePath defaultValue:imageNormal];
	UIImage * imageDisabled = [properties parseImageWithKeys:@[@"image-disabled", @"button-image-disabled"] relativePath:relativePath defaultValue:imageNormal];
	UIImage * imageSelected = [properties parseImageWithKeys:@[@"image-selected", @"button-image-selected"] relativePath:relativePath defaultValue:imageNormal];

//	if ( imageNormal )
	{
		[self setImage:imageNormal forState:UIControlStateNormal];
	}
	
//	if ( imageHighlighted )
	{
		[self setImage:imageHighlighted forState:UIControlStateHighlighted];
	}
	
//	if ( imageDisabled )
	{
		[self setImage:imageDisabled forState:UIControlStateDisabled];
	}
	
//	if ( imageSelected )
	{
		[self setImage:imageSelected forState:UIControlStateSelected];
	}
}

- (void)applyButtonTitle:(NSMutableDictionary *)properties
{
    NSString * titleNormal = [properties parseTextWithKeys:@[@"content", @"text", @"button-title"] defaultValue:nil];
    NSString * titleHighlighted = [properties parseTextWithKeys:@[@"text-highlighted", @"button-title-highlighted"] defaultValue:titleNormal];
    NSString * titleDisabled = [properties parseTextWithKeys:@[@"text-disabled", @"button-title-disabled"] defaultValue:titleNormal];
    NSString * titleSelected = [properties parseTextWithKeys:@[@"text-selected", @"button-title-selected"] defaultValue:titleNormal];

//	if ( titleNormal )
	{
		[self setTitle:titleNormal forState:UIControlStateNormal];
	}
	
//	if ( titleHighlighted )
	{
		[self setTitle:titleHighlighted forState:UIControlStateHighlighted];
	}
	
//	if ( titleDisabled )
	{
		[self setTitle:titleDisabled forState:UIControlStateDisabled];
	}
	
//	if ( titleSelected )
	{
		[self setTitle:titleSelected forState:UIControlStateSelected];
	}
	
	NSString * textShadow = [properties parseStringWithKeys:@[@"text-shadow"]];
	if ( textShadow )
	{
		NSArray * components = [textShadow componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		if ( components && components.count == 4 )
		{
//			CGFloat offsetX = [((NSString *)[components objectAtIndex:0]).trim floatValue];
//			CGFloat offsetY = [((NSString *)[components objectAtIndex:1]).trim floatValue];
//			CGFloat radius = [((NSString *)[components objectAtIndex:2]).trim floatValue];
			UIColor * color = [UIColor colorWithString:[components objectAtIndex:3]];
			if ( color )
			{
				self.reversesTitleShadowWhenHighlighted = YES;
				[self setTitleShadowColor:color forState:UIControlStateNormal];
			}
		}
	}
}

- (void)applyButtonColor:(NSMutableDictionary *)properties
{
	UIColor * colorNormal = [properties parseColorWithKeys:@[@"color", @"button-title-color"] defaultValue:nil];
	UIColor * colorHighlighted = [properties parseColorWithKeys:@[@"color-highlighted", @"button-title-color-highlighted"] defaultValue:colorNormal];
	UIColor * colorDisabled = [properties parseColorWithKeys:@[@"color-disabled", @"button-title-color-disabled"] defaultValue:colorNormal];
	UIColor * colorSelected = [properties parseColorWithKeys:@[@"color-selected", @"button-title-color-selected"] defaultValue:colorNormal];

//	if ( colorNormal )
	{
		[self setTitleColor:colorNormal forState:UIControlStateNormal];
	}
	
//	if ( colorHighlighted )
	{
		[self setTitleColor:colorHighlighted forState:UIControlStateHighlighted];
	}
	
//	if ( colorDisabled )
	{
		[self setTitleColor:colorDisabled forState:UIControlStateDisabled];
	}
	
//	if ( colorSelected )
	{
		[self setTitleColor:colorSelected forState:UIControlStateSelected];
	}
}

- (void)applyButtonInsets:(NSMutableDictionary *)properties
{
	UIEdgeInsets contentEdgeInsets = [properties parseEdgeInsetsWithKeys:@[@"insets", @"button-insets"] defaultValue:UIEdgeInsetsZero];
	UIEdgeInsets titleEdgeInsets = [properties parseEdgeInsetsWithKeys:@[@"text-insets", @"button-title-insets"] defaultValue:UIEdgeInsetsZero];
	UIEdgeInsets imageEdgeInsets = [properties parseEdgeInsetsWithKeys:@[@"image-insets", @"button-image-insets"] defaultValue:UIEdgeInsetsZero];

	if ( NO == UIEdgeInsetsEqualToEdgeInsets(contentEdgeInsets, UIEdgeInsetsZero) )
	{
		[self setContentEdgeInsets:contentEdgeInsets];
	}

	if ( NO == UIEdgeInsetsEqualToEdgeInsets(titleEdgeInsets, UIEdgeInsetsZero) )
	{
		[self setTitleEdgeInsets:titleEdgeInsets];
	}

	if ( NO == UIEdgeInsetsEqualToEdgeInsets(imageEdgeInsets, UIEdgeInsetsZero) )
	{
		[self setImageEdgeInsets:imageEdgeInsets];
	}
}

- (void)applyButtonContent:(NSMutableDictionary *)properties
{	
	UIFont * font = [properties parseFont:[UIFont systemFontOfSize:12.0f]];
	if ( font )
	{
		if ( [self respondsToSelector:@selector(setFont:)] )
		{
			[self performSelector:@selector(setFont:) withObject:font];
		}
		else if ( [self respondsToSelector:@selector(setTitleFont:)] )
		{
			[self performSelector:@selector(setTitleFont:) withObject:font];
		}
	}
	
	self.contentHorizontalAlignment = [properties parseHorizontalAlignmentWithKeys:@[@"text-align"] defaultValue:UIControlContentHorizontalAlignmentCenter];
	self.contentVerticalAlignment = [properties parseVerticalAlignmentWithKeys:@[@"text-valign", @"text-v-align"] defaultValue:UIControlContentVerticalAlignmentCenter];
	
// text alignment
//
//	UITextAlignment textAlignment = [properties parseTextAlignmentWithKeys:@[@""] defaultValue:UITextAlignmentCenter];
//
//	if ( [self respondsToSelector:@selector(setTitleTextAlignment:)] )
//	{
//		objc_msgSend( self, @selector(setTitleTextAlignment:), textAlignment );
//	}
}

#pragma mark -

- (void)applyUIStyling:(NSDictionary *)properties
{
	NSMutableDictionary * propertiesCopy = [NSMutableDictionary dictionaryWithDictionary:properties];

	[self applyButtonBackground:propertiesCopy];
	[self applyButtonImage:propertiesCopy];
	[self applyButtonTitle:propertiesCopy];
	[self applyButtonColor:propertiesCopy];
	[self applyButtonInsets:propertiesCopy];
	
	[super applyUIStyling:propertiesCopy];
}

@end

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
