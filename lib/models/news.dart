import 'dart:convert';


import 'package:newsapp/models/artical.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticalModel> news = [];
  Future getnews() async {
    String url =
        'https://newsapi.org/v2/everything?q=tesla&from=2024-04-22&sortBy=publishedAt&apiKey=5cb7e004efda4c39941311c722f8e696';
    ;
    var response = await http.get(Uri.parse(url));
    var jsondata = jsonDecode(response.body);

    if (jsondata['status'] == 'ok') {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticalModel articalModel = ArticalModel(
              title: element['title'],
              description: element['description'],
              content: element['content'],
              url: element['url'],
              urlToImage: element['urlToImage']);
          print('...........................oookkkkk');

       news.add(articalModel);
        }
      });
    }
  }
}
