
#import "KeymobPlugin.h"
@implementation KeymobPlugin
#pragma mark   private util Function------------------
-(void) fireEvent:(NSString*) eventType withEventData:(NSString*) jsonData{
    NSString *js =@"cordova.fireDocumentEvent('%@',%@);";
    NSString *json=[NSString stringWithFormat:js,eventType,jsonData];
    [self.commandDelegate evalJs:json];
    // [self writeJavascript:json];
}
- (void)onAdEvent:(int) adtype withAdapter:(id<IPlatform>)adapter andData:(id)error eventName:(NSString*)_eventName{
    //  NSString* jsonData=@"{'adtype':%i,'adapter':%@,'data':%@}";
    NSString* jsonData=@"{\"adtype\":%i,\"adapter\":\"%@\",\"data\":\"%@\"}";
    if(error==nil){
        error=@"";
    }
    NSString* msg=[NSString stringWithFormat:jsonData,adtype,[adapter platformName],error];
    [self fireEvent:_eventName withEventData:msg];
}
- (NSString*)dicToJSON:(NSDictionary*) dic
{
    NSError* error = nil;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (error != nil) {
        NSLog(@"NSDictionary JSONString error: %@", [error localizedDescription]);
        return nil;
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

#pragma mark   CDVPlugin Function------------------
- (void)initFromKeymobService:(CDVInvokedUrlCommand *)command {
    NSDictionary *params = [command argumentAtIndex:0];
    NSLog(@" appid info %@", [params objectForKey:@"appID"]);
    NSString *appid=[params objectForKey:@"appID"];
    BOOL isTesting= [[params objectForKey:@"isTesting"] boolValue];
     [AdManager sharedInstance].listener=self;
    [AdManager sharedInstance].controller=self.viewController;
    [[AdManager sharedInstance] configWithKeymobService:appid isTesting:isTesting];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}
- (void)initFromJSON:(CDVInvokedUrlCommand *)command {
    NSDictionary *params = [command argumentAtIndex:0];
    NSString* json= [self dicToJSON:params];
    if(json!=nil){
         [AdManager sharedInstance].listener=self;
    [AdManager sharedInstance].controller=self.viewController;
        [[AdManager sharedInstance] configWithJSON:json];
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
    }else{
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION] callbackId:command.callbackId];
    }
    
}

- (void)removeBanner:(CDVInvokedUrlCommand *)command{
    [[AdManager sharedInstance] removeBanner];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}
- (void)showBannerABS:(CDVInvokedUrlCommand *)command{
    NSDictionary *params = [command argumentAtIndex:0];
    int x=(int) [[params objectForKey:@"x"] integerValue];
    int y= (int)[[params objectForKey:@"y"] integerValue];
    int sizeType=(int) [[params objectForKey:@"sizeType"] integerValue];
    [[AdManager sharedInstance] showBannerABS:sizeType atX:x atY:y];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}
- (void)showRelationBanner:(CDVInvokedUrlCommand *)command{
    NSDictionary *params = [command argumentAtIndex:0];
    int position=(int) [[params objectForKey:@"position"] integerValue];
    int marginY= (int)[[params objectForKey:@"marginY"] integerValue];
    int sizeType=(int) [[params objectForKey:@"sizeType"] integerValue];
    [[AdManager sharedInstance] showRelationBanner:sizeType atPosition:position withOffY:marginY];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)isInterstitialReady:(CDVInvokedUrlCommand *)command {
    BOOL isReady=[[AdManager sharedInstance] isInterstitialReady];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isReady] callbackId:command.callbackId];
    
}
- (void)showInterstitial:(CDVInvokedUrlCommand *)command{
    [[AdManager sharedInstance] showInterstitial];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
    
}
- (void)loadInterstitial:(CDVInvokedUrlCommand *)command{
    [[AdManager sharedInstance] loadInterstitial];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
    
}

- (void)isVideoReady:(CDVInvokedUrlCommand *)command {
    BOOL isReady= [[AdManager sharedInstance] isVideoReady];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isReady] callbackId:command.callbackId];
    
}
- (void)showVideo:(CDVInvokedUrlCommand *)command{
    [[AdManager sharedInstance] showVideo];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
    
}
- (void)loadVideo:(CDVInvokedUrlCommand *)command{
    [[AdManager sharedInstance] loadVideo];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)isAppWallReady:(CDVInvokedUrlCommand *)command {
    BOOL isReady= [[AdManager sharedInstance] isAppWallReady];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isReady] callbackId:command.callbackId];
    
}
- (void)showAppWall:(CDVInvokedUrlCommand *)command{
    [[AdManager sharedInstance] showAppWall];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
    
}
- (void)loadAppWall:(CDVInvokedUrlCommand *)command{
    [[AdManager sharedInstance] loadAppWall];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)onLoadedSuccess:(int) adtype withAdapter:(id<IPlatform>)adapter andData:(id)error{
    [self onAdEvent:adtype withAdapter:adapter andData:error eventName:EVENT_ON_LOADED_SUCCESS];
}
- (void)onLoadedFail:(int) adtype withAdapter:(id<IPlatform>)adapter andData:(id)error{
    [self onAdEvent:adtype withAdapter:adapter andData:error eventName:EVENT_ON_LOADED_FAIL];
}
- (void)onAdOpened:(int) adtype withAdapter:(id<IPlatform>)adapter andData:(id)error{
    [self onAdEvent:adtype withAdapter:adapter andData:error eventName:EVENT_ON_AD_OPENED];
}
- (void)onAdClosed:(int) adtype withAdapter:(id<IPlatform>)adapter andData:(id)error{
    [self onAdEvent:adtype withAdapter:adapter andData:error eventName:EVENT_ON_AD_CLOSED];
}
- (void)onAdClicked:(int) adtype withAdapter:(id<IPlatform>)adapter andData:(id)error{
    [self onAdEvent:adtype withAdapter:adapter andData:error eventName:EVENT_ON_AD_CLICKED];
}
- (void)onOtherEvent:(int) adtype withAdapter:(id<IPlatform>)adapter andData:(id)error eventName:(NSString*)_eventName{
    [self onAdEvent:adtype withAdapter:adapter andData:error eventName:_eventName];
}

@end
