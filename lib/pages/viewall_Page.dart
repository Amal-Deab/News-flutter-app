import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/artical.dart';
import 'package:newsapp/models/getsliders.dart';
import 'package:newsapp/models/news.dart';
import 'package:newsapp/models/slidermodel.dart';
import 'package:newsapp/pages/artical_page.dart';

class ViewAllPage extends StatefulWidget {
  final String name;
  const ViewAllPage({super.key, required this.name});

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  List<ArticalModel> articalModel = [];
  List<SliderModel> slidermodel = [];
  int activeIndex = 0;

  bool loading = true;
  bool loading1 = true;

  getnewshome() async {
    News newclass = News();
    await newclass.getnews();
    articalModel = newclass.news;

    setState(() {
      loading = false;
    });
  }

  getslidersshome() async {
    Sliders sliders = Sliders();
    await sliders.getsliders();
    slidermodel = sliders.sliders;

    setState(() {
      loading1 = false;
    });
  }

  @override
  void initState() {
    getnewshome();
    getslidersshome();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name + ' News'),
        ),
        body: loading
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: ListView.builder(
                  itemCount: widget.name == 'Breaking'
                      ? slidermodel.length
                      : articalModel.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ColumView(
                        image: widget.name == 'Breaking'
                            ? slidermodel[index].urlToImage ?? ''
                            : articalModel[index].urlToImage ?? '',
                        title: widget.name == 'Breaking'
                            ? slidermodel[index].title ?? ''
                            : articalModel[index].title ?? '',
                        des: widget.name == 'Breaking'
                            ? slidermodel[index].description ?? ''
                            : articalModel[index].description ?? '',
                        url: widget.name == 'Breaking'
                            ? slidermodel[index].url ?? ''
                            : articalModel[index].url ?? '',
                      ),
                    );
                  },
                ),
              ));
  }
}

class ColumView extends StatelessWidget {
  final String image, title, des, url;
  const ColumView(
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
          child: Container(padding: EdgeInsets.all(10),
            child: Column( 
                 
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
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
