import 'dart:html' as html;
import 'dart:js' as js;

Future<void> loadModel() async {
    await Future.delayed(Duration(seconds: 1));
    await js.context.callMethod('loadModel');
}