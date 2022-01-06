import 'package:flutter/material.dart';
class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: orderPage(),
    );
  }
}
class orderPage extends StatefulWidget {
  @override
  _orderPageState createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), onPressed: () {  },
        ),
        title: const Text("Select Parts", style: TextStyle(
            color: Colors.black
        ),),
        actions: [
          IconButton(
            icon: const Icon(Icons.search), onPressed: () {  },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryWidget("Car Parts", "Parts", true),
                categoryWidget("Auto Parts", "Parts", false),

              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    clothWidget("Aly Rim", "Aly RIm", "150"),
                    clothWidget("Wheel Cup", "Wheels Cup", "100"),
                    clothWidget("Tyre", "Tyres", "150"),
                    clothWidget("Side Mirror", "Mirror", "100"),
                    clothWidget("Head Light", "Light", "70"),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text("Your Products"),
                    Text("5 Items added")
                  ],
                ),
                const Text("\$560")
              ],
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>PickUpTimePage()));
              },
              child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 70,
                  decoration: const BoxDecoration(
                  ),
                  child: const Center(
                    child: Text("SELECT DATE & TIME", style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700
                    ),),
                  )
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
  Container clothWidget(String img, String name, String price)
  {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/tyre.png')
                      )
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$name"),
                    Text("\$$price"),
                    const Text("Add Note")

                  ],
                ),
                const Text("\$45"),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(

                          shape: BoxShape.circle
                      ),
                      child: const Center(
                        child:Text("-")
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                      width: 40,

                      child: Center(
                        child: Text("1"),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle
                      ),
                      child: const Center(
                        child: Text("+"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width*0.75,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
  Column categoryWidget(String img, String name, bool isActive)
  {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: (isActive) ? null : Colors.grey.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/images/$img.png'),
                      fit: BoxFit.contain
                  )
              ),
            ),
          ),
        ),
        Text(name)
      ],
    );
  }
}

