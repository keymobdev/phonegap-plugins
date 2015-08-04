var keymob = {
    featureName: "KeymobPlugin",
    AdTypes: {
        BANNER: 0,
        INTERSTITIAL: 1,
        APPWALL: 2,
        VIDEO: 3
    },
    AdPosition: {
        TOP_LEFT: 1,
        TOP_CENTER: 2,
        TOP_RIGHT: 3,
        MIDDLE_LEFT: 4,
        MIDDLE_CENTER: 5,
        MIDDLE_RIGHT: 6,
        BOTTOM_LEFT: 7,
        BOTTOM_CENTER: 8,
        BOTTOM_RIGHT: 9,
        ABSOLUTE: 0
    },
    AdSize: {
        /**  320*50 **/
        BANNER: 0,
        /**  468*60 **/
        FULL_BANNER: 1,
        /**  320*100 **/
        LARGE_BANNER: 2,
        /**  728*90 **/
        LEADERBOARD: 3,
        /**  300*250 **/
        MEDIUM_RECTANGLE: 4,
        /**  160*600 **/
        WIDE_SKYSCRAPER: 5,
        /**  -1*-2 **/
        SMART_BANNER: 6
    },
    AdEvent: {
        ON_LOADED_SUCCESS: "onLoadedSuccess",
        ON_LOADED_FAIL: "onLoadedFail",
        ON_AD_OPENED: "onAdOpened",
        ON_AD_CLOSED: "onAdClosed",
        ON_AD_CLICKED: "onAdClicked",
        ON_OTHER_EVENT: "onOtherEvent"
    },
    removeBanner: function (successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'removeBanner',
            [
            ]
        );
    },
    showBannerAbsolute: function (sizeType, x, y, successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'showBannerABS',
            [
                {x: x, y: y, sizeType:sizeType}
            ]
        );
    },
    showBannerRelation: function (sizeType, position, marginY, successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'showRelationBanner',
            [
                { position: position, sizeType:sizeType,marginY:marginY}
            ]
        );
    },
    initFromKeymobService: function (appID,isTesting, successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'initFromKeymobService',
            [
                {appID:appID,isTesting:isTesting}
            ]
        );
    },
    initFromJSON: function (jsonOBJ, successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'initFromJSON',
            [
                jsonOBJ
            ]
        );
    },

    isInterstitialReady: function (successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'isInterstitialReady',
            [

            ]
        );
    },

    showInterstitial: function (successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'showInterstitial',
            [

            ]
        );
    },

    loadInterstitial: function (successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'loadInterstitial',
            [

            ]
        );
    },

    isVideoReady: function (successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'isVideoReady',
            [

            ]
        );
    },

    showVideo: function (successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'showVideo',
            [

            ]
        );
    },

    loadVideo: function (successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'loadVideo',
            [

            ]
        );
    },


    isAppWallReady: function (successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'isAppWallReady',
            [

            ]
        );
    },

    showAppWall: function (successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'showAppWall',
            [

            ]
        );
    },

    loadAppWall: function (successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'loadAppWall',
            [

            ]
        );
    },

    disposePlugin: function (successCallback, failureCallback) {
        cordova.exec(
            successCallback,
            failureCallback,
            this.featureName,
            'disposePlugin', [

            ]);
    }
};
module.exports = keymob;
