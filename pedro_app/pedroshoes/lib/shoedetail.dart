import 'package:flutter/material.dart';
import 'package:pedroshoes/Mens.dart';

class ShoeView extends StatelessWidget {
  const ShoeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/unplash_shoe1.jpg',
                  ), // Ensure path is correct
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              width: double.infinity,
              height: size.height * 0.4,
            ),
            loginform(context),
          ],
        ),
      ),
    );
  }
}

SingleChildScrollView loginform(BuildContext context) {
  return SingleChildScrollView(
      child: Container(
    width: double.infinity,
    child: Column(
      children: [
        const SizedBox(height: 360),
        Container(
          width: double.infinity,
          height: 450,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                )
              ]),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Nike Limited Edition',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              Text(
                'Size',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              ShoeSizeSelector(),
              const SizedBox(height: 20),
              Text(
                'Color',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              ColorSelector(),
              const SizedBox(height: 10),
              Text(
                'Description',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'REVOLT, Copenhagen, Denmark'
                'Published on November 15, 2018'
                'Free to use under the Unsplash License',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Price container with dynamic width and padding
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey,
                        ),
                        child: const Text(
                          'Price \$25.00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 15), // Smaller gap for better responsiveness

                    // Add to Cart button with responsive alignment
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledColor: Colors.grey,
                        color: const Color.fromARGB(255, 5, 5, 5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add To Cart',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MensView()),
                          );
                        },
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
  ));
}

class ShoeSizeSelector extends StatefulWidget {
  @override
  _ShoeSizeSelectorState createState() => _ShoeSizeSelectorState();
}

class _ShoeSizeSelectorState extends State<ShoeSizeSelector> {
  final List<int> _shoeSizes = [39, 40, 41, 42, 43, 44, 45];
  int _selectedSize = 39;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isSmallScreen = screenWidth < 600;

    return Center(
      child: isSmallScreen
          ? Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _shoeSizes.length,
                itemBuilder: (context, index) {
                  bool isSelected = _shoeSizes[index] == _selectedSize;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSize = _shoeSizes[index];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.black : Colors.grey[200],
                      ),
                      child: Text(
                        _shoeSizes[index].toString(),
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _shoeSizes.map((size) {
                bool isSelected = size == _selectedSize;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedSize = size;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? Colors.black : Colors.grey[200],
                    ),
                    child: Text(
                      size.toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}

class ColorSelector extends StatefulWidget {
  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.black,
    Colors.purple,
  ];
  Color _selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isSmallScreen = screenWidth < 600;

    return Center(
      child: isSmallScreen
          ? Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _colors.length,
                itemBuilder: (context, index) {
                  bool isSelected = _colors[index] == _selectedColor;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = _colors[index];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _colors[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _colors.map((color) {
                  bool isSelected = color == _selectedColor;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
