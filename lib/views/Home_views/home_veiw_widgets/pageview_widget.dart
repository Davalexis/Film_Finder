import 'package:flutter/material.dart';
import 'package:Film_Finder/Data/movie_data.dart';
import 'package:Film_Finder/views/Home_views/home_veiw_widgets/moviecontent_widget.dart';

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