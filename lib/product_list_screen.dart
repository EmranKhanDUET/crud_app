import 'package:crud_app/add_product_screen.dart';
import 'package:crud_app/update_product_screen.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) => _buildProductItem(),
        separatorBuilder: (_, __) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddProductScreen(),
          ));
        },
      ),
    );
  }

  Widget _buildProductItem() {
    return ListTile(
      // leading: Image.network(
      //     'https://i5.walmartimages.com/seo/Nike-Air-Max-270-Men-s-Running-Shoes-White-Black-White-AH8050-100_e81a591a-17e4-41e1-a563-38ab406e6a26.d97f219d9540fe3e4172a8617410abf6.jpeg'),
      title: Text('Product Name'),
      subtitle: Wrap(
        spacing: 16,
        children: [
          Text('Unit Price : \$10'),
          Text(' Quantity : 10'),
          Text('Total Price : \$10'),

        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UpdateProductScreen(),
                ));
              },
              icon: const Icon(Icons.edit)),
          IconButton(onPressed: () {
            deleteConfirmationAlertDialog(context: context);
          }, icon: const Icon(Icons.delete)),
        ],
      ),
    );
  }

  deleteConfirmationAlertDialog({
    required context,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Delete !'),
            content: const Text('Are you confirm to delete this item ?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Yes,delete.')),
            ],
          );
        });
  }
}
