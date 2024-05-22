
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:newsapp/pages/artical_page.dart';


class TrendingTile extends StatelessWidget {
  final String title;
  final String desc;
final String imageurl;
 final String url;
  const TrendingTile(
      {super.key,
      required this.title,
      required this.desc,
     required this.imageurl, required this.url
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return WebViewApp(url: url,);
            },));
          },
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:CachedNetworkImage(
                      
                       imageUrl:imageurl ,
                
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ), 
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          title,
                          maxLines: 2,
                          style:
                              TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          desc,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black45),
                        ),
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



