
#import "Cordova/CDV.h"
#import <KeymobAd/KeymobAd.h>
@interface KeymobPlugin : CDVPlugin <IAdEventListener>
- (void)initFromKeymobService:(CDVInvokedUrlCommand *)command ;
- (void)initFromJSON:(CDVInvokedUrlCommand *)command ;

- (void)removeBanner:(CDVInvokedUrlCommand *)command;
- (void)showBannerAbsolute:(CDVInvokedUrlCommand *)command;
- (void)showBannerRelation:(CDVInvokedUrlCommand *)command;

- (void)isInterstitialReady:(CDVInvokedUrlCommand *)command ;
- (void)showInterstitial:(CDVInvokedUrlCommand *)command;
- (void)loadInterstitial:(CDVInvokedUrlCommand *)command;

- (void)isVideoReady:(CDVInvokedUrlCommand *)command ;
- (void)showVideo:(CDVInvokedUrlCommand *)command;
- (void)loadVideo:(CDVInvokedUrlCommand *)command;

- (void)isAppWallReady:(CDVInvokedUrlCommand *)command ;
- (void)showAppWall:(CDVInvokedUrlCommand *)command;
- (void)loadAppWall:(CDVInvokedUrlCommand *)command;
@end
