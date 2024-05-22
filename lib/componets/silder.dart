import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class sliderimage extends StatelessWidget {
  final name, image;
  const sliderimage({super.key, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: image,
             
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Container( height: 200,
            padding: EdgeInsets.only(left: 8),
            margin: EdgeInsets.only(top: 150),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(10)),
            child: Text(
              name,
              style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
