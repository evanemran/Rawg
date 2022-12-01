import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight*2) / 4;
    return Card(color: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image.toString()),
            fit: BoxFit.cover,
          ),
          borderRadius:
          const BorderRadius.all(Radius.circular(8.0),),
        ),
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.black54,
          child: Center(child: Text(title,
            style: const TextStyle(color: Colors.white,
              fontSize: 18,
              fontFamily: 'Valorant',
              fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),),
        ),
      ),
      /*child: Stack(
      children: [
        FadeInImage.memoryNetwork(
          image: image.toString(),
          placeholder: kTransparentImage,
          imageErrorBuilder:
              (context, error, stackTrace) {
            return Image.asset(
                'assets/images/flag_placeholder.jpg',
                fit: BoxFit.cover);
          },
          fit: BoxFit.cover,
        ),
        Positioned(bottom: 0, right: 0,
            child: Row(children: [Expanded(child: Text(title, style: const TextStyle(fontSize: 14, color: Colors.red, backgroundColor: Colors.black26), overflow: TextOverflow.ellipsis),)],))
      ],
    ),*/);
  }
}