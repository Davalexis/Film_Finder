import 'package:Film_Finder/views/Home_views/widget/moviecontent_widget.dart';
import 'package:flutter/material.dart';
import 'package:Film_Finder/Data/movie_data.dart';


class PageviewWidget extends StatelessWidget {

  const PageviewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  Positioned.fill(
      top:  50,
      bottom: 40,
      
      child: PageView.builder(
        itemCount:  trendingMovies.length,
        controller: PageController(viewportFraction: 0.9) ,
        itemBuilder: (context, index){
          return MoviecontentWidget(movie: trendingMovies[index]);
          }
        )
      );
  }
}