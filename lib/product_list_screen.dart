import 'dart:convert';

import 'package:crud_app/add_product_screen.dart';
import 'package:crud_app/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool _getProductListInProgress = false;
  List<Product> products = [];

  @override
  void initState() {
    _getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Visibility(
        visible: _getProductListInProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.separated(
          itemCount: products.length,
          itemBuilder: (context, index) => _buildProductItem(index, products),
          separatorBuilder: (_, __) => const Divider(),
        ),
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

  Widget _buildProductItem(index, products) {
    return ListTile(
      // leading: Image.network(products[index].image,width: 60,height: 60,),
      title: Text(products[index].productName),

      subtitle: Wrap(
        spacing: 16,
        children: [
          Text('Unit Price : \$${products[index].unitPrice}'),
          Text(' Quantity : ${products[index].quantity}'),
          Text('Total Price : \$${products[index].totalPrice}'),
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
          IconButton(
              onPressed: () {
                deleteConfirmationAlertDialog(context: context);
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
    );
  }

  Future<void> _getProductList() async {
    _getProductListInProgress = true;
    setState(() {});
    products.clear();

    const String getProductListUrl =
        'https://crud.teamrabbil.com/api/v1/ReadProduct';
    Uri getProductListUri = Uri.parse(getProductListUrl);
    Response response = await get(getProductListUri);
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      var outputData = decodedJson["data"];

      for (var i in outputData) {
        Product product = Product(
          id: i["_id"],
          productName: i["ProductName"] ?? 'Unknown',
          productCode: i["ProductCode"] ?? 'Unknown',
          unitPrice: i["UnitPrice"] ?? 'Unknown',
          quantity: i["Qty"] ?? 'Unknown',
          totalPrice: i["TotalPrice"] ?? 'Unknown',
          image: i["Img"] ?? 'Unknown',
        );

        products.add(product);
      }

      _getProductListInProgress = false;
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Get Product List Successfully')));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Get Product List Faild,Try again !')));
    }

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
