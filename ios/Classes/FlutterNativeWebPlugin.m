#import "FlutterNativeWebPlugin.h"
#import "FlutterWebView.h"

@implementation FlutterNativeWebPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterNativeWebFactory* webviewFactory =
      [[FlutterNativeWebFactory alloc] initWithMessenger:registrar.messenger];
  [registrar registerViewFactory:webviewFactory withId:@"ponnamkarthik/flutterwebview"];
}

@end
