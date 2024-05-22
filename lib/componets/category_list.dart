import 'package:flutter/material.dart';
import 'package:newsapp/pages/category_page.dart';

class CategoryList extends StatelessWidget {
  final categoryname, image;
  const CategoryList({super.key, this.categoryname, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CategoryPage(nameCategory: categoryname);
        },));
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Container(  width: 120,
                height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.black38),
                child: Center(
                  child: Text(
                    categoryname,
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),
                  ),
                ),
              ),
           
          ],
        ),
      ),
    );
  }
}
