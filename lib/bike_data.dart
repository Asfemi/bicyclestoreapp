import 'dart:convert';

import 'package:bicyclestoreapp/bike_model.dart';

const jsonData = '''
[
  {
    "price": 1250.00,
    "description": "High-performance mountain bike. Durable and versatile design. Built for off-road adventures. Smooth and responsive handling.",
    "imageUrl": "lib/assets/biker1.jpg",
    "smallDescription": "High-performance mountain bike."
  },
  {
    "price": 1899.99,
    "description": "Stylish and comfortable cruiser bike. Perfect for leisurely rides. Classic and timeless design. Cushioned seating for comfort.",
    "imageUrl": "lib/assets/biker2.jpg",
    "smallDescription": "Stylish and comfortable cruiser bike."
  },
  {
    "price": 1430.25,
    "description": "Perfect for kids who love to ride. Durable and safe construction. Bright and attractive colors. Easy to handle for young riders.",
    "imageUrl": "lib/assets/biker3.jpg",
    "smallDescription": "Perfect for kids who love to ride."
  },
  {
    "price": 1550.00,
    "description": "Ideal for long-distance road cycling. Lightweight and aerodynamic frame. Smooth gear shifting. Efficient power transfer.",
    "imageUrl": "lib/assets/biker4.jpg",
    "smallDescription": "Ideal for long-distance road cycling."
  },
  {
    "price": 850.00,
    "description": "Compact and portable folding bike. Easy to fold and store. Great for commuters. Sturdy and reliable construction.",
    "imageUrl": "lib/assets/biker5.jpg",
    "smallDescription": "Compact and portable folding bike."
  }
]
''';


List<dynamic> jsonList = json.decode(jsonData);
List<BikeModel> bikes =
    jsonList.map((json) => BikeModel.fromJson(json)).toList();

//default bikemodel data
BikeModel bikeModel() {
  return BikeModel(
    price: 2999.99,
    description: "Mountain Bike",
    imageUrl: "lib/assets/biker6.jpg",
    smallDescription: "High-performance mountain bike.",
  );
}
