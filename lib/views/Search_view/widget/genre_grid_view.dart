// import 'package:flutter/material.dart';
// import 'package:Film_Finder/model/movie_model.dart';


// class GridViewWidget extends StatelessWidget {

//    final List<Movie> moviesModel;


//    const GridViewWidget({super.key , required this.moviesModel});


//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.7,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20 ,     
//           ),
          
//         itemCount: moviesModel.length,
//         itemBuilder: (BuildContext context, int index) {
//            final movie = moviesModel[index];
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//                 child: Image.asset(movie.fullPosterUrl,
//              fit: BoxFit.cover,
//             ),
//           ) ;
//         },
//       ),
//     );
//   }
// }

 