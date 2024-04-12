import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class CarouselSliderExample extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return Scaffold(
	body: ListView(
    children: [
      SizedBox(height: 100,),
      CarouselSlider(
        items: [
          Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('images/img1.jpg',),
                // image: NetworkImage("https://cdn.pixabay.com/photo/2017/01/08/13/58/cube-1963036__340.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            // height: 500,width: 500,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('images/entryimg.jpg',),
                // image: NetworkImage("https://cdn.pixabay.com/photo/2015/03/25/23/46/cube-689619__340.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            // height: 500,width: 200,
            // margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('images/img2.jpg',),
                // image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJqqqTEDG47DmRff3nNLGXTq5CpMgiPWaVfw56m-Ulnb86AT005TvuIaQB58jJURMKlHk&usqp=CAU"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ], 
        options: CarouselOptions(
            height: 380.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 25 / 15,
            autoPlayCurve: Curves.decelerate,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
    ]),
    );
  }
}