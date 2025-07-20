import 'package:aftermarket/drawermenu.dart';
import 'package:aftermarket/titlebar.dart';
import 'package:flutter/material.dart';

// class Product extends StatelessWidget {
//   const Product({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: titleBar(),
//       drawer: DrawerMenu(),
//       body: Center(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 10),
//                   child: Text(
//                     'Borla Catback exhaust \nfor BMW E36 - M3',
//                     style: TextStyle(
//                       fontFamily: 'Rajdhani',
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                       color: Color(0xFF242424)
//                     ),
//                   ),
//                 )
//               ]
//             ),

//             Image.asset('assets/images/parts/Borla_E36.png'),
            
//           ],
//         ),
//       ),
//     );
//   }
// }


class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: titleBar(),
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[900],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/parts/Borla_E36.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Product Title
              const Text(
                'Borla Exhaust System - E36 M3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),

              // Short Description
              const Text(
                'High-performance stainless steel exhaust system from Borla for the BMW E36 M3. Deep tone, reduced back pressure, and perfect fit.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),

              // Specs
              const Text(
                'Specifications',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              _buildSpecRow('Material', 'T-304 Stainless Steel'),
              _buildSpecRow('Fitment', 'BMW E36 M3 (1992–1999)'),
              _buildSpecRow('Sound', 'Aggressive growl'),
              _buildSpecRow('Warranty', 'Million-Mile Warranty'),
              const SizedBox(height: 20),

              // Price
              const Text(
                '\₹84,999',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Add to Cart Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add to cart logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'ADD TO CART',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$title:",
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
