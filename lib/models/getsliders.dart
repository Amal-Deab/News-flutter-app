import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/slidermodel.dart';

class Sliders {
  List<SliderModel> sliders = [];
  Future getsliders() async {
    String url =
    'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=5cb7e004efda4c39941311c722f8e696';
    ;
    var response = await http.get(Uri.parse(url));
    var jsondata = jsonDecode(response.body);

    if (jsondata['status'] == 'ok') {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          SliderModel sliderModel = SliderModel(
              title: element['title'],
              description: element['description'],
              content: element['content'],
              url: element['url'],
              urlToImage: element['urlToImage']);
          print('...............................ok');

       sliders.add(sliderModel);
        }
      });
    }
  }
}