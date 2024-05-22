import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/category_api.dart';
import 'package:newsapp/models/showcategorymodel.dart';
import 'package:newsapp/pages/artical_page.dart';

class CategoryPage extends StatefulWidget {
  final String nameCategory;
  const CategoryPage({super.key, required this.nameCategory});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<ShowCategoryModel> showcategorymodel = [];

  bool loading = true;

  getcategoryshome() async {
    CategoryApi categoryclass = CategoryApi();
    await categoryclass.getcategory(widget.nameCategory.toLowerCase());
    showcategorymodel = categoryclass.categories;

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getcategoryshome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.nameCategory),
        ),
        body: loading
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: ListView.builder(
                  itemCount: showcategorymodel.length,
                  itemBuilder: (context, index) {
                    return columCategory(
                      image: showcategorymodel[index].urlToImage ?? '',
                      title: showcategorymodel[index].title ?? '',
                      des: showcategorymodel[index].description ?? '',
                      url: showcategorymodel[index].url ?? '',
                    );
                  },
                ),
              ));
  }
}

class columCategory extends StatelessWidget {
  final String image, title, des, url;
  const columCategory(
      {super.key,
      required this.image,
      required this.title,
      required this.des,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return WebViewApp(
              url: url,
            );
          },
        ));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          margin: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(des)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
