
import 'package:flutter/material.dart';
import 'package:Film_Finder/constants/constants_files.dart';

class PopularMovieWidget extends StatelessWidget {
  const PopularMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
       return 
      _buildMostPopularSection();
       
  }
}




Widget _buildMostPopularSection(){
final List<Map<String,String>> PopularMovie = [
  {'title': 'Captain America : brave new world ' , 'url' : 'https://posters.movieposterdb.com/24_12/2025/14513804/l_captain-america-brave-new-world-movie-poster_d309c549.jpg'},
  {'title': 'Captain America : brave new world ' , 'url' : 'https://posters.movieposterdb.com/24_12/2025/14513804/l_captain-america-brave-new-world-movie-poster_d309c549.jpg'},
  {'title': 'Captain America : brave new world ' , 'url' : 'https://posters.movieposterdb.com/24_12/2025/14513804/l_captain-america-brave-new-world-movie-poster_d309c549.jpg'},
  {'title': 'Captain America : brave new world ' , 'url' : 'https://posters.movieposterdb.com/24_12/2025/14513804/l_captain-america-brave-new-world-movie-poster_d309c549.jpg'},
  {'title': 'Captain America : brave new world ' , 'url' : 'https://posters.movieposterdb.com/24_12/2025/14513804/l_captain-america-brave-new-world-movie-poster_d309c549.jpg'},
  {'title': 'Captain America : brave new world ' , 'url' : 'https://posters.movieposterdb.com/24_12/2025/14513804/l_captain-america-brave-new-world-movie-poster_d309c549.jpg'},
  {'title': 'Captain America : brave new world ' , 'url' : 'https://posters.movieposterdb.com/24_12/2025/14513804/l_captain-america-brave-new-world-movie-poster_d309c549.jpg'},
  {'title': 'Captain America : brave new world ' , 'url' : 'https://posters.movieposterdb.com/24_12/2025/14513804/l_captain-america-brave-new-world-movie-poster_d309c549.jpg'},
  {'title': 'Captain America : brave new world ' , 'url' : 'https://posters.movieposterdb.com/24_12/2025/14513804/l_captain-america-brave-new-world-movie-poster_d309c549.jpg'},
];

return ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: PopularMovie.length,
  
  itemBuilder: (context, index){
    final moive = PopularMovie[index];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),

      child: AspectRatio(
        aspectRatio: 2/3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            moive['url']!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[800],
            alignment: Alignment.center,
            child: Text(moive['title']!,
            style:  TextStyle(
              color: kTextSecondaryColor, 
              fontSize: 10), 
              textAlign: TextAlign.center,),
              
            ),
            loadingBuilder: (context, child, progress) => progress == null
                           ? child
                           :  Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor)),
          ),
        ),
        ),
    );
  }
  );
}