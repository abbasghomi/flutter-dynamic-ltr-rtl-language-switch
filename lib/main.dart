import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isLTR = true;
  bool isEnglish = true;

  var farsiText = [
    'نمونه ساده ایجاد شده با Flutter',
    'شما این تعداد دکمه فشار داده اید',
    'نمونه متن Sample English text  به دو زبان فارسی و انگلیسی\nجهت بررسی تغییر جهت متن و ترجمه بصورت پویا',
    'تغییر جهت متن',
    'تغییر زبان متن',
    'افزایش...',
  ];

  var englishText = [
    'Simple Flutter app',
    'You have pushed the button this many times:',
    'Sample English text in Farsi and English\nTo review text direction and translation dynamic switching',
    'Switch direction',
    'Switch language',
    'Increment...',
  ];
  var currentText;

  @override
  void initState() {
    currentText = englishText;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _switchDirection() {
    setState(() {
      isLTR = !isLTR;
    });
  }

  void _switchLanguage() {
    setState(() {
      isEnglish = !isEnglish;
      if (isEnglish) {
        currentText = englishText;
      } else {
        currentText = farsiText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isLTR ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(currentText[0]),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                currentText[1],
              ),
              Text(
                '$_counter',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              Text(
                currentText[2],
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              FlatButton(
                onPressed: _switchDirection,
                child: Text(currentText[3]),
                textColor: Colors.white,
                splashColor: Colors.amber,
                color: Colors.blueAccent,),
              FlatButton(
                onPressed: _switchLanguage,
                child: Text(currentText[4]),
                textColor: Colors.white,
                splashColor: Colors.amber,
                color: Colors.blueAccent,)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: currentText[5],
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
