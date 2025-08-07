import 'package:flutter/material.dart';

void main() {
  runApp(KashanGuideApp());
}

class KashanGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'راهنمای سفر کاشان',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> sections = ['جاذبه‌ها', 'نکات سفر', 'درباره کاشان'];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('راهنمای سفر کاشان'),
        ),
        body: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(sections[index], style: TextStyle(fontSize: 20)),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AttractionsPage()));
                } else if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TravelTipsPage()));
                } else if (index == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()));
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class AttractionsPage extends StatelessWidget {
  final Map<String, String> attractions = {
    'باغ فین': 'باغ فین، یک باغ تاریخی زیبا با حمام سنتی.',
    'بازار کاشان': 'بازار سنتی و پرجنب‌وجوش کاشان.',
    'خانه بروجردی‌ها': 'خانه‌ای تاریخی با معماری منحصر به فرد.',
    'مسجد آقا بزرگ': 'مسجدی زیبا با کاشی‌کاری‌های رنگارنگ.',
  };

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('جاذبه‌ها')),
        body: ListView(
          children: attractions.entries.map((entry) {
            return ListTile(
              title: Text(entry.key, style: TextStyle(fontSize: 18)),
              subtitle: Text(entry.value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class TravelTipsPage extends StatelessWidget {
  final List<String> tips = [
    'بهترین زمان بازدید: بهار و پاییز.',
    'از آب و هوای گرم تابستان در کاشان آگاه باشید.',
    'بازدید از بازار سنتی را فراموش نکنید.',
    'لباس مناسب فصل بپوشید.',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('نکات سفر')),
        body: ListView.builder(
          itemCount: tips.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.check_circle_outline),
              title: Text(tips[index]),
            );
          },
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  final String aboutText = '''
کاشان شهری تاریخی در ایران است با جاذبه‌های فراوان فرهنگی و طبیعی.
این شهر به خاطر باغ‌های زیبا، معماری سنتی و مهمان‌نوازی مشهور است.
''';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('درباره کاشان')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            aboutText,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
