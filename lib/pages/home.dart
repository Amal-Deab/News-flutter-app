import 'package:flutter/material.dart';
import 'package:newsapp/componets/category_list.dart';
import 'package:newsapp/componets/silder.dart';
import 'package:newsapp/componets/tierding_tile.dart';
import 'package:newsapp/models/artical.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/corousel_silder.dart';
import 'package:newsapp/models/getsliders.dart';
import 'package:newsapp/models/news.dart';
import 'package:newsapp/models/slidermodel.dart';
import 'package:newsapp/pages/viewall_Page.dart';
import 'package:newsapp/services/get_caroucelslider.dart';
import 'package:newsapp/services/get_category.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<CarouselModel> carouselSlider = [];
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
    categories = getcategory();
    carouselSlider = getcarouselSilder();
    getnewshome();
    getslidersshome();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: const Icon(
               Icons.refresh,
                color: Colors.green,
                size: 20,
              ),
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter', style: TextStyle(color: Colors.black),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: /*  loading
          ? Center(child: CircularProgressIndicator())
          :  */
          SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryList(
                      categoryname: categories[index].name,
                      image: categories[index].image,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Breaking News!',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewAllPage(name: 'Breaking'),
                        ));
                      },
                      child: Text(
                        'View all ',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.green,
                            color: Colors.green,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              loading1
                  ? Center(child: CircularProgressIndicator())
                  : CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        String? res = slidermodel[index].urlToImage;
                        String? resn = slidermodel[index].title;
                        print('kkkkkkkkkkkkkkkkkkkkkkkkkk');
                        return sliderimage(
                          image: res ?? '',
                          name: resn ?? '',
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        height: 200,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                    ),

              SizedBox(
                height: 10,
              ),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: carouselSlider.length,
                effect: SwapEffect(
                  dotHeight: 13,
                  dotWidth: 13,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending News!',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewAllPage(name: 'Trending'),
                        ));
                      },
                      child: Text(
                        'View all ',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.green,
                            color: Colors.green,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Text( articalModel.indexed!)
              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articalModel.length,
                        itemBuilder: (context, index) {
                          print('.,.,.,.');
                          print(articalModel[index].title ?? '');
                          return TrendingTile(
                            title: articalModel[index].title ?? '',
                            desc: articalModel[index].description ?? '',
                            imageurl: articalModel[index].urlToImage ?? '',
                            url: articalModel[index].url ?? '',
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
 /*    child: FutureBuilder(
                        future: getnewshome(),
                        builder: (context, snapshot) {
                          if(snapshot.connectionState==ConnectionState.waiting){
                            return Center(child: Column(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 10,),
                                Text('Wait Please...',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),)
                              ],
                            ),);
                          }
                          if (snapshot.hasError) {
                            return Text('Something happened ...');
                          }
                          return ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return TrendingTile(
                                  title: articalModel[index].title!,
                                  desc: articalModel[index].description!,
                                  imageurl: articalModel[index].urlToImage!);
                            },
                          );
                        },
                      ), */