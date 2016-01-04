# Localize-Constrain-On-The-Fly


[![Join the chat at https://gitter.im/dimohamdy/iOS-Localize-Constrain](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dimohamdy/iOS-Localize-Constrain?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![NSStringMask](http://img.shields.io/cocoapods/v/iOS-Localize-Constrain.svg?style=flat)](https://cocoadocs.org/docsets/NSStringMask) 

##Why iOS-Localize-Constrain ?

* No more xibs or storyboard for RTL and LTR.
* No more fake splash screen.
* No more write constrain to flip views.
* No more requests for close app.
* No more ask for change device language.


Now localization of views is simple , only fews of lines in viewDidLoad for each viewcontroller or create parent controller

##How to use it ? 
```
#import "UIViewController+LocalizeConstrint.h"
#import "UIView+viewRecursion.h"
```
 in viewDidLoad
```
 //check if language is Arabic will loop for all view and flip constrain
     if (GetAppLanguage() == UILanguageArabic) {
         for (UIView *tempView in [self.view allSubViews]) {
            [self changeViewRTL:tempView];
        }
    }
```
##Use it for Cell 

```
#import "UIViewController+LocalizeConstrint.h"
#import "UIView+viewRecursion.h"
```
 in awakeFromNib
```
 //check if language is Arabic will loop for all view and flip constrain
- (void)awakeFromNib {
    // Initialization code
    if (GetAppLanguage() == UILanguageArabic) {
        for (UIView *tempView in [self allSubViews]) {
            
            [self changeViewRTL:tempView];
        }
    }
}
```

This image is old , Run demo to show more.

![Localize](https://raw.githubusercontent.com/dimohamdy/iOS-Localize-Constrain/master/image.gif)

###Install using pod
    
    pod 'iOS-Localize-Constrain'  , '~> 0.0.8'

## Todo List 
1. Enhance Read.Me
2. ~~Create swift Extension~~ 
