#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Tell Objective-C that our Swift function exists
extern void modmenu_init(void);

// This runs automatically when LiveContainer injects the dylib
__attribute__((constructor)) static void tweak_constructor() {
    // Give the app 2 seconds to finish launching before injecting the UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        modmenu_init();
    });
}
