keymob 是一个简单易用的广告管理库。
使用keymob能非常方便的管理应用中各个广告平台的广告，包括展示哪些平台的广告，各个平台的比例，优先顺序等。
支持admob,chartboost,inmobi.mmedia,amazon,iad,baidu,adcolony,gdt等常用广告平台，后面会根据大家的反馈加入更多的常见平台的支持。
广告形式支持丰富，包括各种尺寸的banner广告，方块广告，全屏广告，视频广告，应用墙广告等当前流行的广告。
使用时把各个平台的广告ID和比例优先级顺序等信息配置在www.keymob.com 管理处或者按json格式配置，json配置文件可以放项目里，自己的网站服务器或者第三方管理平台服务器。

交流群：310513042

1.下载安装库文件
   下载keymob 插件后解压到d:\keymobplugin
   使用如下命令从本地安装Keymob插件

	cordova plugin add d:\keymobplugin
   
2.添加代码
 a.通过json配置文件设置和初始化各个广告平台信息

	keymob.initFromJSON(jsonString);

   参数是包含各个平台的ID，比重等信息的json字符串，具体格式可以参考模板文件，不能为空。

   或者通过Keymob.com网站服务设置和初始化各个广告平台信息

	keymob.initFromKeymobService("1", true);

   
   第一个参数是Keymob.com网站创建获取到的应用ID
   第二个参数是是否是测试，如果在开发中，设置true，最后发布的时候改成false

   注意：使用此方法需先前往www.keymob.com创建应用，配置广告平台信息

 b. banner广告的展示 

	keymob.showBannerRelation(keymob.AdSize.BANNER,keymob.AdPosition.BOTTOM_CENTER,0);

    上面的意思是在设备的底部显示显示标准banner广告。第一个参数是广告尺寸，尺寸的种类在AdSize中可以选择的常量，包括标准banner，方块，smart banner等。
    标准banner之外的其他banner尺寸根据平台不同有细微的差别，具体效果可以调试查看。
    第二个参数是广告条展示的位置，包括顶端靠左，顶端居中，顶端靠右等等9种常见位置，各个位置的值在BannerPositions的常量中，方便使用。
    第三个参数是offsetY，即相对位置偏移，例如放在应用的底端，向上偏移0个像素，就是上面的代码效果。如果要贴到应用最底端上移60，则偏移为60.
 
 c. 固定位置展示banner
	
	keymob.showBannerAbsolute(keymob.AdSize.BANNER,0,70);

    上面是在x 0,y 200位置展示标准banner
    虽然相对定位能满足大部分的广告位置设置需求，但为满足某些特殊位置的需要，keymob提供了绝对固定位置展示banner广告的接口。
    第一个参数是banner的尺寸，同相对广告尺寸，第二个参数和第三个参数分别是广告位置的x和y值

 d. 隐藏banne广告
	
	keymob.removeBanner();

    removeBanner会隐藏广告，但是广告并不会销毁，这样再次展示时能迅速的展示给用户。
    
 e. 全屏广告的加载和展示

	keymob.loadInterstitial();

   加载全屏广告，广告加载成功后不会自动展示，这样能更好的控制全屏广告在合适的时机展示给用户，
   如果要在加载成功时立即展示可以在 receive事件中调用showInterstitial展示广告。

	keymob.showInterstitial();

   展示全屏广告，调用showInterstitial后广告会立即出现。但是请保证广告已经加载完成。

	keymob.isInterstitialReady(function (isReady) {
            if (isReady) {
               alert("Interstitial is load success,you can show it now");
            }
        });

   检查全屏广告是否加载完成了。如果广告没有加载完成直接调用showInterstitial会发生不可预料的事件，有的广告平台可能会导致应用奔溃。
   所以每次展示前都需要判断是否加载完成。整体就是下面的样子。

   	keymob.isInterstitialReady(function (isReady) {
            if (isReady) {
                keymob.showInterstitial();
            }
        });

f. 视频广告的加载和展示

	keymob.loadVideo();

   加载视频广告，广告加载成功后不会自动展示，这样能更好的控制视频广告在合适的时机展示给用户，
   如果要在加载成功时立即展示可以在 receive事件中调用showVideo展示广告。

	keymob.showVideo();

   展示视频广告，调用showVideo后广告会立即出现。但是请保证广告已经加载完成。

	keymob.isVideoReady();

   检查视频广告是否加载完成了。如果广告没有加载完成直接调用showVideo会发生不可预知的事件，如有的广告平台可能会导致奔溃。
   所以每次展示前都需要判断是否加载完成。片段如下面的样子。

	keymob.isVideoReady(function (isReady) {
            if (isReady) {
                keymob.showVideo();
            }
        });

g. 应用墙广告的加载和展示

	keymob.loadAppWall();

   加载应用墙广告，广告加载成功后不会自动展示，这样能更好的控制应用墙广告在合适的时机展示给用户，
   如果要在加载成功时立即展示可以在 eventlistener的 receive事件中调用showAppWall展示广告。

	keymob.showAppWall();

   展示应用墙广告，调用showAppWall后广告会立即出现。但是请保证应用墙广告已经加载完成。

	keymob.isAppWallReady();

   检查应用墙广告是否加载完成了。如果广告没有加载完成直接调用showAppWall会发生不可预知的事件，如有的广告平台可能会导致奔溃。
   所以每次展示前都需要判断是否加载完成。片段如下面的样子。

   	keymob.isAppWallReady(function (isReady) {
            if (isReady) {
                keymob.showAppWall();
            }
        });
h. 处理广告事件，如果要处理广告事件，可以添加事件监听函数
    function onAdReceive(message) {
        if(message.adtype==keymob.AdTypes.INTERSTITIAL){
            alert(message.adtype + message.adapter+" ,you can show it now");
        }
        //keymob.showInterstitial();//show it when received
    }
 document.addEventListener(keymob.AdEvent.ON_LOADED_SUCCESS, onAdReceive, false);

3.针对IOS平台处理
  把iosadapters文件夹复制到xcode工程目录下，用xcode打开工程项目，然后右击项目，选择添加文件到工程，把iosadapters添加到xcode工程中
   不使用的平台从iosadapters目录下删除
  如果使用了广点通平台，则需要添加  -lstdc++   到 Other Linker Flags,设置的方式是单机工程文件，选择build settings 然后搜索Other Linker Flags
4.针对Android平台处理（优化处理，非必须）
  在生成的android工程assets目录下面有三个文件夹，
  biduad_plugin是百度广告需要的文件，如果未使用百度广告可以删除
  gdt_plugin   是广点通广告需要的文件，如果未使用广点通广告可以删除
  com_keymob_sdks  是Keymob平台默认广告，在无法连接keymob的情况下会使用默认平台，如果想使用别的平台作为默认平台可以从
  https://github.com/keymobdev/admob-adapter下载放在com_keymob_sdks下
  注意：文件夹和jar文件名称不能修改

5.广告平台配置文件模板
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
		{"class":"MMediaAdapter","priority":10,"key1":"xxx","key2":"xxx"}//mmedia ,key1 banner apID，key2 Interstitial apid
		]
	}

priority会根据ratemodel不同而成为比重或者排序号。class表示平台实现,不能随意修改。

项目地址:https://github.com/keymobdev/phonegap-plugins