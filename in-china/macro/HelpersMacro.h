#ifndef in_china_HelpersMacro_h
#define in_china_HelpersMacro_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define ControllerOfStoryBoard(storyboard, controllerID) [[UIStoryboard storyboardWithName:storyboard bundle:nil] instantiateViewControllerWithIdentifier: controllerID]

#endif
