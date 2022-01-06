
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:honda_professionals/account/order.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}
class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), onPressed: () {  },
        ),
        title: const Text("Honda Profesionals", style: TextStyle(
            color: Colors.black
        ),),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications), onPressed: () {  },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xfff1ffff),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Honda"),
                            SizedBox(height: 5,),
                            Text("Honda Shop", style: TextStyle(
                              fontSize: 16,
                            ),),
                          ],
                        )
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('asset/images/bannerImg.png')
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            const Text("SERVICES"),
            Container(
              height: 200,
              color: const Color(0xfff1ffff),
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 120,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/images/servicesImg.png')
                        )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Parts"),
                          const SizedBox(height: 10,),
                          InkWell(
                            onTap: openOrderPage,
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: const Text("Place Order", style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            // Container(
            //   padding: EdgeInsets.all(20),
            //   width: MediaQuery.of(context).size.width,
            //   color: Color(0xfff1ffff),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         children: [
            //           Text("AVAILABILITY "),
            //           Text("AVAILABLE")
            //         ],
            //       ),
            //       SizedBox(height: 10,),
            //       Text("We are open from 7.00 am to 8.00 pm")
            //     ],
            //   ),
            // ),
            // SizedBox(height: 10,),
            // Container(
            //   padding: EdgeInsets.all(20),
            //   width: MediaQuery.of(context).size.width,
            //   color: Color(0xfff1ffff),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text("CHECK THE ESTIMATION"),
            //       SizedBox(height: 10,),
            //       Text("You can check time extimation with price"),
            //     ],
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       padding: EdgeInsets.all(15),
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle
            //       ),
            //       child: Text("+", style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 40
            //       ),),
            //     )
            //   ],
            // )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        iconSize: 30,
        onTap: (value) => {openRelevantPage(value)},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),

            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.track_changes),

              title: Text("Track Order")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              title: Text("My Orders")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
  void openRelevantPage(int pageId)
  {
    // ignore: avoid_print
    print(pageId);
  }
  void openOrderPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage()));
  }
}

