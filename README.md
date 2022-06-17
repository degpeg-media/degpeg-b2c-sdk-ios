# B2CSDK

[![CI Status](https://img.shields.io/travis/rajdegpeg/B2CSDK.svg?style=flat)](https://travis-ci.org/rajdegpeg/B2CSDK)
[![Version](https://img.shields.io/cocoapods/v/B2CSDK.svg?style=flat)](https://cocoapods.org/pods/B2CSDK)
[![License](https://img.shields.io/cocoapods/l/B2CSDK.svg?style=flat)](https://cocoapods.org/pods/B2CSDK)
[![Platform](https://img.shields.io/cocoapods/p/B2CSDK.svg?style=flat)](https://cocoapods.org/pods/B2CSDK)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
1. Install the following:
        -Xcode 13.3.1 or later
2. Make sure that your project meets these requirements:
Your project must target these platform versions or later: iOS 13
3. Set up a physical Apple device or use a simulator to run your app.


## Installation
Use cocoapods to install this custom control in your project.
1. Create a Podfile if you don't already have one. From the root of your project directory, run the following command:

```
pod init
```
2. To your Podfile, add the B2CSDK pods that you want to use in your app.
```
pod 'B2CSDK', '~> 0.0.2'
```
3. Install pods using following command
```
pod install   or pod install --repo-update
```

## Usage


B2CSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'B2CSDK'
```
## Integration of B2CSDK in Your project
1. Import SDK in your swift file
```
import B2CSDK
```
2. Get the SDK root controller and you can present it on your view or you can add it in you app’s TabBar view

Check below code snippet 
```
        // 1. app id
        // 2. content publisher Id / content prover id
        // 3. app secret
        //
        let appId = "your-app-id"
        let secretKey = "your-app-secret"
        let manager = DegpegManager.init(appID: appId, secret: secretKey, userId: "6278c4556cb38a7a9c10df6e", userName: "Raj Kadam", influencerID: "6278c4546cb38a7a9c10df6d")
        let vc = manager.getRootViewController() 
        
```

## Author

Raj Kadam, rajendra.kadam@degpeg.com

## License

B2CSDK is available under the MIT license. See the LICENSE file for more info.
