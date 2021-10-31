import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
class contact_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: ContactUs(
          logo: AssetImage('images/a.jpg'),
          email: 'ehsanullah184wb@gmail.com',
          companyName: 'Ehsan Ullah',
          phoneNumber: '+923059269769',
          dividerThickness: 2,
          githubUserName: 'ehsantarar184',
          tagLine: 'Flutter Developer',
          twitterHandle: 'ehsantarar184', taglineColor: Colors.amber, companyColor: Colors.amber, cardColor: Colors.amber, textColor: Colors.amber,
        ),
      ),
    );
  }
}