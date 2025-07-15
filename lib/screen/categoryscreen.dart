import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/categorymodel.dart';

class Categoryscreen extends StatefulWidget {
  const Categoryscreen({super.key});

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  List<categoris> categorilist = [];
  bool isLoading = true;

  Future<void> CategoriApi() async {
    try {
      final response = await http.post(Uri.parse(
          "https://physiotherapycenter.mdidminfoway.com/darsita/bagsellingApi/selectBagCategory.php"));

      if (response.statusCode == 200) {
        Categorymodel categorymodel =
        Categorymodel.fromJson(jsonDecode(response.body));

        if (categorymodel.categorys != null) {
          setState(() {
            categorilist = categorymodel.categorys!;
            isLoading = false;
          });
        }
      } else {
        throw Exception("Failed to load categories");
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    CategoriApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : categorilist.isEmpty
          ? Center(child: Text("No categories found"))
          : ListView.builder(
        itemCount: categorilist.length,
        itemBuilder: (BuildContext context, int index) {
          final item = categorilist[index];
          return Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID: ${item.idss ?? ''}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Name: ${item.catname ?? ''}",
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text("Description: ${item.catdescription ?? ''}"),
                SizedBox(height: 10),
                if (item.image != null && item.image!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.image!,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image, size: 80),
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
