/*
 * Copyright 2021 Mihir Paldhikar
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is furnished
 * to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
 * OR OTHER DEALINGS IN THE SOFTWARE.
 */

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

/// [NativeToast] is responsible to connect to [Android] via the platform channel
/// Example Usage:
///  await NativeToast.makeText(
//           message: "This is a Native Toast On Android!",
//           duration: NativeToast.shortLength,
//         );
class NativeToast {
  /// [longLength] is used to show the toast for the longer period.
  static const int longLength = 1;

  /// [shortLength] is used to show the toast for the shorter period.
  static const int shortLength = 0;

  static const MethodChannel _channel = MethodChannel('native_toast');

  /// [makeText] is the function responsible to show the toast natively.
  /// [message] is the required parameter in order to show the text message.
  /// [duration] is the optional parameter to set how log a [Toast] is show.
  /// by default it is set to [shortLength]
  static Future<void> makeText({
    required String message,
    int duration = shortLength,
  }) async {
    if (Platform.isAndroid) {
      try {
        await _channel.invokeMethod("showToast", {
          "message": message,
          "duration": duration,
        });
      } catch (error) {
        rethrow;
      }
    } else {
      throw "NativeToast is plugin only made for Android.";
    }
  }
}
