import 'package:bicyclestoreapp/bike_model.dart';
import 'package:bicyclestoreapp/constants.dart';
import 'package:bicyclestoreapp/bike_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int itemIndex = 0;
  // late final shoppingDataService = ShoppingDataService(jsonData);
  // late final bike = shoppingDataService.getbike();
  late final item = bikes.isNotEmpty ? bikes[itemIndex] : BikeModel();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              //height: size.height * 0.8,
              child: Stack(
                children: [
                  // ! image
                  Stack(
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.55,
                        child: ClipPath(
                          clipper: MyCustomClipper(),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                item.imageUrl.toString(),
                              ),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.brown.withOpacity(0.5),
                                  BlendMode.darken),
                            )),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        top: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                            Text(
                              'BACK',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'RSD SHERIFF \nBICYCLE UNISEX',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                item.smallDescription.toString(),
                                maxLines: 2,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Positioned(
                        right: 20,
                        top: 60,
                        child: Column(
                          children: [
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'ADD-ONS',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 20),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'FEATURES',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // ! shopping cart FAB
                  Positioned(
                    right: 524,
                    top: 300,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: kPrimaryColor,
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.5), // Shadow color
                              spreadRadius: 5, // Spread radius
                              blurRadius: 30, // Blur radius
                              offset: const Offset(
                                  0, 3), // Offset to control shadow direction
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // ! description
            ),
            Container(
              height: size.height * 0.25,
              width: size.width,
              //color: Colors.tealAccent,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 50),
                        child: Icon(Icons.play_circle_outline_rounded,
                            color: kPrimaryColor)),
                    const SizedBox(width: 30),
                    SizedBox(
                      width: size.width * 0.72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '\$${item.price}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                const TextSpan(
                                  text: ' +TAX',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            item.description.toString(),
                            maxLines: 4, // Set the maximum number of lines
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0); // Start at the bottom-right corner
    path.lineTo(size.width, 0); // Draw a line to the bottom-left corner
    path.lineTo(size.width,
        size.height * 0.7); // Draw a diagonal line to the top-left corner
    path.lineTo(0, size.height); // Draw a line to the top-right corner
    path.close(); // Close the path to complete the clip

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
