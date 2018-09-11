#import "FlutterwebviewPlugin.h"
#import <flutterwebview/flutterwebview-Swift.h>

@implementation FlutterwebviewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterwebviewPlugin registerWithRegistrar:registrar];
}
@end
