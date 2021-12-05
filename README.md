![Native Toast](https://raw.githubusercontent.com/imihirpaldhikar/native_toast/main/assets/project_banner.png)


![Pub Version](https://img.shields.io/pub/v/native_toast?color=g&label=Package%20Version&logo=flutter&logoColor=blue&style=flat)
![Dart Analyze Workflow](https://github.com/imihirpaldhikar/native_toast/actions/workflows/plugin-analyze.yml/badge.svg)
![Pub Publish Workflow](https://github.com/imihirpaldhikar/native_toast/actions/workflows/pub-publish.yml/badge.svg)
![GitHub contributors](https://img.shields.io/github/contributors/imihirpaldhikar/native_toast)

# Native Toast

The Flutter Plugin to show native toast on Android.

## How it works?

The ```native_toast``` plugin works on the basis of the [`Toast`](https://developer.android.com/reference/android/widget/Toast) class. in Android it is used to show a toast message.

```native_toast``` connext with the native Android library to show the toast message via the Flutter's Platform Channel.

### Demo

The below is a demo of the plugin running on the Android device with Android Version 12-light (SDK 31). On both Light and Dark theme.

<img src="https://raw.githubusercontent.com/imihirpaldhikar/native_toast/main/assets/demo-light.png" height=500 alt="Light Theme Demo Image">
<img src="https://raw.githubusercontent.com/imihirpaldhikar/native_toast/main/assets/demo.png" height=500 alt="Dark Theme Demo Image">

> *Note: The layout of the toast shown depends completely on the Android version and how the OEM has implementd the toast. In the Latest Android version i.e Android 12, the toast is shown in the with a app icon alog with the text.*

## Usage

Import the follwing package in your ```.dart``` file in which you want to show the toast.

```dart
import 'package:native_toast/native_toast.dart';
```

Use the ```NativeToast()``` class to show the toast. as follows:

```dart
await NativeToast().makeText(
    message: "This is a Native Toast On Android!",
    duration: NativeToast.shortLength,
);
```
 Inorder to set the duration of the ```Toast``` use the ```duration``` parameter.
 ```duration``` accepts the ```int``` value. There is a inbuilt constants which are used to set the duration namely:

For short Duration
 ```dart
    NativeToast.shortLength
 ```

For Long Duration
 ```dart
    NativeToast.longLength
 ```
 ```duration``` is an optional parameter. If not passed, the default duration is ```NativeToast.shortLength```.


Example:

```dart
ElevatedButton(
    child: const Text('Show Native Toast'),
    onPressed: () async {
        NativeToast().makeText(
          message: "This is a Native Toast On Android!",
          duration: NativeToast.shortLength,
        );
    },
);
```

## Author

<img src="https://avatars.githubusercontent.com/u/68847718" width=100 style=" border-radius: 50%;">

[Mihir Paldhikar](https://github.com/imihirpaldhikar)

 ## License
 The Project is under [MIT License](./LICENSE).

 ```
 Copyright 2021 Mihir Paldhikar

Permission is hereby granted, free of charge, 
to any person obtaining a copy of this software
and associated documentation files
(the"Software"), to deal in the Software without
restriction, including without limitation the
rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the
Software is furnished to do so, subject to the
following conditions:

The above copyright notice and this permission
notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT
WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 ```