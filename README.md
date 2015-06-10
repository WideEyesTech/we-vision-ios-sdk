WE Vision iOS SDK - WideEyes We Vision SDK for iOS
==============

A library to integrate We Vision search capabilities in your iOS app.
If you want to access our web service API directly you can, see the docs [here](http://docs.wide-eyes.it).


Table of Contents
=================
**Getting Started**

1. [Requirements](#requirements)
1. [Setup](#setup)
1. [Quick Start](#quick-start)
1. [Contributing](#contributing)
1. [License](#license)


Requirements
--------------

Link your project with the following frameworks:

- iOS 7+
- AssetsLibrary.framework
- MobileCoreServices.framework
- SystemConfiguration.framework



Setup
-------------
To setup your project, follow these steps:

1. Download this repository
2. Drag and drop WideEyes SDK iOS framework into your project.

#### Source Code

```sh
  git clone https://github.com/WideEyesTech/we-vision-ios-sdk
```


Quick Start
-------------


##### Instantiate WE Vision iOS SDK

In the method application:didFinishLaunchingWithOptions set your apikey that you can find in your [dashboard](http://dashboard.wide-eyes.it/#/APIkey):

```Objective-C
[WEInitialize setClientApiKey:@""];
```


##### Get products by Id

```Objective-C
[WEVision searchByIdWithGender:WEVisionGender
                      category:@""
                   subcategory:@""
                     productId:@"" success:^(WEResult *result) {

} failure:^(NSError *error) {

}];
```

##### Get cross search products

```Objective-C
[WEVision crossSearchByIdWithGender:WEVisionGender
                           category:@""
                        subcategory:@""
                          productId:@""
                            success:^(WEResult *result) {

} failure:^(NSError *error) {

}];
```
##### Process an image after drawing the contourn arround it

```Objective-C
[WEComputerVision generateImage:[UIImage imageNamed:@""]
                  contourPoints:@[@[@40,@220],@[@150,@220],@[@150,@300],@[@295,@300],@[@40,@385],@[@295,@385]]
                         margin:@0
            withCompletionBlock:^(UIImage *image, NSArray *contour) {

}];
```

##### Get search produts by image using a pre processed image

```Objective-C
[WEVision searchByImageWithGender:WEVisionGender
                         category:@""
                      subcategory:@""
                            image:image     // image from the preprocessing method
                          contour:contour   // contour from the preprocessing method
                          success:^(WEResult *result) {

} failure:^(NSError *error) {

}];
```

Contributing
-----------------

Want to contribute? Check out the [contributing guide](CONTRIBUTING.md)!

License
----------------

Copyright 2015 Wide Eyes Technologies S.L. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.