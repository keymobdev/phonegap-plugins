### Keymob is a simple lib to manage ad 
Keymob can be very easy to use management  various advertising platforms in application, including which platform ad impressions, the proportion of each platform, setting priorities.<br/>
Support admob, chartboost, inmobi.mmedia, amazon, iad, baidu ,adcolony,gdt and other common advertising platform, more  platforms will been supported.<br/>
Support rich forms of advertising, including the popular  banner  a variety of sizes, rect ads, Interstitial ads, video ads, More APP Ad.<br/>
Ad config can been managed in  www.keymob.com ,  modify and adjust easy, you can config keymob with json format file , and then put it in  the project or on the website.<br/>


### 1. Download and install the library files <br/>
   Download Keymobplugin and  extract to d:\keymobplugin<br/>
   Use the following command to install the Keymob Plugin from local location<br/>

	cordova plugin add d:\keymobplugin
   

###  2.Add Code

#### a.Setup and initialize keymob with json string
```
	keymob.initFromJSON(jsonString);
```
The  parameter is the config info of each platform in json string format,json format reference template.<br/>


You can Setup and   initialize keymob with Keymob.com service also,that will been more easy to use.<br/>
```
	keymob.initFromKeymobService("1", true);
```
The first parameter is ID got from Keymob.com<br/>
The second parameter is test mode switch，if you are testing ad set  true，change to false when publish<br/>   
Tip: ID can be got  from www.keymob.com  .<br/>


#### b. Display banner advertising
```
	keymob.showBannerRelation(keymob.AdSize.BANNER,keymob.AdPosition.BOTTOM_CENTER,0);
```
The above means that displays the standard banner ad at the bottom of the device . The first parameter is the ad size, the type size can be selected in BannerSizes constants, including the standard banner, rectange banner, smart banner and so on.<br/>
Other banner size outside  standard size(320*50) may have  small differences in the different platforms, run to see the effects.<br/>
The second parameter is the position of the banner displayed,  the value of each position is  in BannerPositions constants,including the top left, top center, top right-hand and so on ,9 kinds of common position total.<br/>
The third parameter is offsetY, i.e., the relative positional deviation, e.g., on the bottom of the application, the upward offset 80 pixels, that is, the effect of the above code. If you want to stick to the bottom of the application, set the offsetY 0.<br/>
 
#### c. display banner at Fixed location
```	
	keymob.showBannerAbsolute(keymob.AdSize.BANNER,0,70);
```
The above code is display standard banner at point(0,200)<br/>
Although the relative positioning to meet the needs of the majority of advertising location settings, but to meet the needs of some special position, keymob provides absolute fixed position display banner advertising api.<br/>
The first parameter is the size of the banner, the second argument and third parameters are the position x and y values of banner.<br/>

#### d. Hide banne ad
```	
	keymob.removeBanner();
```
"removeBanner" hidden banner advertising, but advertising will not be destroyed so show can be quickly presented to the user next time. Some advertising platform will continue to  load ad after hidden , so the event will dispatched also.<br/>
    
#### e. Load and display full-screen ads
```
	keymob.loadInterstitial();
```
Load Interstitial ads, does not automatically show after load successfully, this can better control Interstitial ad at the right time to show to the user,<br/>
    If you want to show immediate after load,just handler onLoadedSuccess   and call showInterstitial.<br/>
```
	keymob.showInterstitial();
```
Display Interstitial advertising, ads will appear immediately after the call showInterstitial. However, please ensure that advertising has finished loading.

	keymob.isInterstitialReady();

Check the Interstitial ad is loaded complete. If call showInterstitial directly when an ad  has not finished loading unpredictable events will occur, som advertising platform could lead to crash.<br/>
So make sure the Interstitial is ready before every show.Below is the overall look.
```
   	keymob.isInterstitialReady(function (isReady) {
            if (isReady) {
                keymob.showInterstitial();
            }
        });
```
#### f. Load and display video ads
```
	keymob.loadVideo();
```
Load video ads, does not automatically show after load successfully, this can better control video ad at the right time to show to the user,<br/>
If you want to show immediate after load,just handler onLoadedSuccess  and call showVideo.
```
	keymob.showVideo();
```
Display video ads, ads will appear immediately after the call showVideo. However, please ensure that advertising has finished loading.
```
	keymob.isVideoReady();
```
Check the video ad is loaded complete. If call showVideo directly when an ad  has not finished loading unpredictable events will occur, some advertising platform could lead to crash.<br/>
So make sure the video is ready before every show.Below is the overall look.
```
   	keymob.isVideoReady(function (isReady) {
            if (isReady) {
                keymob.showVideo();
            }
        });
```
#### g. Application load and display more app advertising
```
	keymob.loadAppWall();
```
Load more app ads, does not automatically show after load successfully, this can better control video ad at the right time to show to the user,<br/>
If you want to show immediate after load,just handler onLoadedSuccess  and call showAppWall.<br/>
```
	keymob.showAppWall();
```
Display more app ads, ads will appear immediately after the call showAppWall. However, please ensure that advertising has finished loading.
```
	keymob.isAppWallReady();
```
Check the More App ad is loaded complete. If call showAppWall directly when an ad  has not finished loading unpredictable events will occur, some advertising platform could lead to crash.<br/>
So make sure the More App is ready before every show.Below is the overall look.<br/>
```
   	keymob.isAppWallReady(function (isReady) {
            if (isReady) {
                keymob.showAppWall();
            }
        });
```

h. handler ad event
```
    function onAdReceive(message) {
        if(message.adtype==keymob.AdTypes.INTERSTITIAL){
            alert(message.adtype + message.adapter+" ,you can show it now");
        }
        //keymob.showInterstitial();//show it when received
    }
    document.addEventListener(keymob.AdEvent.ON_LOADED_SUCCESS, onAdReceive, false);
```

### 3  processing for ios
delete unsed platform from iosadapter and then copy iosadapters folder to xcode project folder,open  project with xcode ,right click project choose menu item "add files to project" to add third-party lib  in folder "iosadapters"<br/>
if you are using gdt,need add   -lstdc++   to Other Linker Flags  under tab "Build Setttings"<br/>
### 4 Optimized for android
In the android project There are three folders<br/>
biduad_plugin  lib for baidu platform,if you not plan to use baidu,you can delete it.<br/>
gdt_plugin  lib for gdt platform,if you not plan to use gdt,you can delete it.<br/>
com_keymob_sdks default platform used when connect keymob.com fail,you can download and use other platform as the default platform.https://github.com/keymobdev/admob-adapter<br/>
Note:file name and folder name can not been changed.<br/>


### 5.Advertising platform configuration file template

```
	{
		"isTesting":true,//Whether it is in test mode
		"rateModel":1,//0 said priority is  represents the weight of each platform ,1 said the priority is the order of each platform to display ads
		"platforms":[
		{"class":"AdmobAdapter","priority":10,"key1":"ca-app-pub-xxx/xxx","key2":"ca-app-pub-xxx/xxx"},//admob  ,key1 banner ID，key2 Interstitial id
		{"class":"BaiduAdapter","priority":10,"key1":"apid","key2":"banner id","param":"{\"interstitialID\":\"interstitial ID\",\"videoID\":\"video ID\"}"},//baidu platform,param is a json string.remove video ID key value for ios
		{"class":"AmazonAdapter","priority":10,"key1":"xxx"},//amazon ,key1 appkey
		{"class":"ChartboostAdapter","priority":10,"key1":"xxx","key2":"xxx"},//chartboost ,key1 appID，key2 signature
		{"class":"InmobiAdapter","priority":10,"key1":"xxx","key2":"","param":" interstitial placement"},//inmobi ,key1 appid ,key2 banner placement,param interstitial placement
		{"class":"IadAdapter","priority":10,"key1":"appid"},//iad ,will be automatically ignored on android
		{"class":"GDTAdapter","priority":10,"key1":"appid","key2":"banner id", "param":"{\"interstitialID\":\"interstitial ID\",\"appWallID\":\"app Wall ID\"}"},//gdt platform
		{"class":"AdcolonyAdapter","priority":10,"key1":"appid","key2":"zone interstitia","param":"video zone"},//adcolony platform
		{"class":"MMediaAdapter","priority":10,"key1":"banner id","key2":"Interstitial id"}//mmedia ,key1 banner apID，key2 Interstitial apid
		]
	}
```
Depending rate model priority will become the sort number or proportion.All keyName in config can not been modified."class" is platform implement can not be modified.<br/>

project home : https://github.com/keymobdev/phonegap-plugins
qq group :310513042