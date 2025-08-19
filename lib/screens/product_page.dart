import 'package:aftermarket/providers/product_provider.dart';
import 'package:aftermarket/screens/product_description_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'cart_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductPage extends StatefulWidget {
  final String? category;
  final String? searchText;
  const ProductPage({Key? key, this.category, this.searchText}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Future<List<Product>> fetchProducts() async {
  //   final response = await Supabase.instance.client
  //       .from('products')
  //       .select()
  //       .eq('category', widget.category);

  //   // Supabase always returns a List<dynamic>
  //   final data = response as List<dynamic>;

  //   return data.map((json) => Product.fromJson(json)).toList();
  // }
  Future<List<Product>> fetchProducts() async {
    final supabase = Supabase.instance.client;
    var query = supabase.from('products').select();

    if (widget.searchText != null && widget.searchText!.isNotEmpty) {
      // Search across all categories by product name
      query = query.ilike('name', '%${widget.searchText!}%');
    } else if (widget.category != null && widget.category!.isNotEmpty) {
      // Filter by category
      query = query.eq('category', widget.category!);
    }

    final response = await query;
    final data = response as List<dynamic>;
    return data.map((json) => Product.fromJson(json)).toList();
  }

  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final fetched = await fetchProducts();
    setState(() {
      products = fetched;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF2C3137),
        title: const Text('Products'),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CartPage()),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Consumer<CartProvider>(
                  builder: (_, cartProvider, __) => CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      cartProvider.itemCount.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 products per row
          childAspectRatio: 3 / 4, // adjust card height/width ratio
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            color: const Color(0xFFEFEFEF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                context.read<ProductProvider>().selectProduct(product);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DescriptionPage(
                      product: product,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.network(product.images[0], fit: BoxFit.contain),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text("\$${product.price.toStringAsFixed(2)}"),
                    ElevatedButton(
                      onPressed: () {
                        cart.addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${product.name} added to your cart"),
                          ),
                        );
                      },
                      child: const Text("Add To Cart"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
