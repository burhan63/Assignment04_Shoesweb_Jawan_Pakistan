import 'package:flutter/material.dart';
import 'package:pedroshoes/Childs.dart';
import 'package:pedroshoes/Mens.dart';
import 'package:pedroshoes/Womens.dart';
import 'package:pedroshoes/shoedetail.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List<String> categories = [
    'assets/images/pngwing_shoe1.png',
    'assets/images/amaze_shoes.png',
    'assets/images/pngwing_leather_normal.png',
    'assets/images/pngwing_leather_shoe_fab.png',
    'assets/images/pngwing_leather_shoe.png'
  ];
  int currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Pedro',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Arial',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: getCurrentItem(), // Displaying based on bottom nav selection
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_2_outlined,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              accountName: Text(
                'Burhan Ali',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Arial',
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                'Burhan.Ali11556688@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Arial',
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              tileColor: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.person_2_outlined),
              title: Text('Profile'),
              tileColor: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Help Center'),
              tileColor: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.message_outlined),
              title: Text('Terms & Conditions'),
              tileColor: Colors.white,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          setState(() {
            currentItem = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: "Add to Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active), label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined), label: "Profile"),
        ],
      ),
    );
  }

  Widget getCurrentItem() {
    if (currentItem == 0) {
      return MainForm(context, categories);
    } else if (currentItem == 1) {
      return const MensView();
    } else if (currentItem == 2) {
      return const WomensView();
    } else if (currentItem == 3) {
      return const ChildsView();
    } else {
      return const Center(child: Text('Dashboard'));
    }
  }
}

class CategoryTile extends StatelessWidget {
  final String image;
  const CategoryTile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 20.0),
      height: 90,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 70,
            width: 170,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 5),
          const Icon(Icons.forward),
        ],
      ),
    );
  }
}

SingleChildScrollView MainForm(BuildContext context, List<String> categories) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.only(left: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search Products",
                hintStyle: TextStyle(fontSize: 15, fontFamily: 'Arial'),
                prefixIcon: Icon(Icons.search, color: Colors.black38),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 10.0),
          height: 140,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryTile(image: categories[index]);
            },
          ),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrivals",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 10.0),
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                //padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //  margin: const EdgeInsets.only(left: 10.0),
                decoration: const BoxDecoration(color: Colors.white),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(
                                    8), // Add padding around image
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Colors.grey), // Border around image
                                  borderRadius: BorderRadius.circular(
                                      8), // Optional: Rounded corners
                                ),
                                child: Image.asset(
                                  'assets/images/unplash_shoe1.jpg',
                                  height: 100,
                                  width: 120,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Tennis Footwear",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                "1500\$",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ShoeView()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.greenAccent,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text(
                                  "Buy Now",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  'assets/images/amaze_shoes.png',
                                  height: 100,
                                  width: 120,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Office Footwear",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                "1200\$",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.greenAccent,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text(
                                  "Buy Now",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  'assets/images/Slipers.jpg',
                                  height: 100,
                                  width: 120,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Slipers",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                "1000\$",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.greenAccent,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text(
                                  "Buy Now",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Popular",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/office_shoes.jpg'),
                          radius: 30,
                        ),
                        title: Text(
                          'Gia Borghini',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('RHW Rosle 1 Sandals'),
                        trailing: Icon(Icons.attach_money_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/Formal_shoes.jpg'),
                          radius: 30,
                        ),
                        title: Text(
                          'Gia Formal',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('RHW Rosle 1 Shoe'),
                        trailing: Icon(Icons.attach_money_outlined),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
