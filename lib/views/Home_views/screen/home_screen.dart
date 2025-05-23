import 'package:Film_Finder/view%20model/movie_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:Film_Finder/constants/constants_files.dart';
import 'package:Film_Finder/widget/background_fade_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

///
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Trending',
      'Most Watched',
      'Top Rated',
      'Upcoming'
    ];

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategorySection(category: category);
        },
      ),
    );
  }
}

///
class CategorySection extends StatelessWidget {
  final String category;

  const CategorySection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundFadeWidget(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),

            // Category title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 20),

            // Horizontal PageView of movies
            Expanded(
              child: PageView.builder(
                pageSnapping: true,
                scrollBehavior: ScrollBehavior(),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: 10, // Replace with your movie list length
                itemBuilder: (context, index) {
                  return MovieCardWidget(index: index); // Make this custom
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Dummy MovieCardWidget
class MovieCardWidget extends ConsumerWidget {
  final int index;

  const MovieCardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsync = ref.watch(popularMovieProvider);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
                width: double.infinity,
                color: kBackgroundColor,
                child: Center(
                    child: Stack(
                              fit: StackFit.expand,
                              children: [
                                // Background Image
                                Image.asset(
                                  // movies[index].fullPosterUrl,
                                  "assets/Image/Aladdin.jpeg",
                                  fit: BoxFit.cover,
                                  // errorBuilder: (context, error, stackTrace) =>
                                  //     Container(color: Colors.grey[800]),
                                ),
                                // Gradient Overlay
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                      Colors.black.withOpacity(
                                            1), // More opaque at bottom
                                        Colors.black.withOpacity(
                                            0.2), // Fade out at top
                                      ],
                                      stops: const [
                                        0.0,
                                        0.7
                                      ], // Adjust stops for gradient spread
                                    ),
                                  ),
                                ),

                                
                                // Text and Play Button
                                Positioned(
                                  bottom: 20,
                                  left: 20,
                                  right: 20,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Movie',
                                              style: TextStyle(
                                                  color: kTextSecondaryColor,
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              // movies[index].title,
                                              "Aladdin",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: kTextColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              "Adventure || 2022 || 2hrs ",
                                              // '${movieModel.year} •${movieModel.genre} • ${movieModel.duration}',
                                              style: TextStyle(
                                                  color: kTextSecondaryColor
                                                      .withOpacity(0.8),
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      // Play Button
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: kTextColor.withOpacity(
                                                0.2), // Semi-transparent white
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color:
                                                    kTextColor.withOpacity(0.5),
                                                width: 1),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                blurRadius: 1,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: const Icon(
                                            IconsaxPlusLinear.play,
                                            color: kTextColor,
                                            size: 24,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )));
  }
}

                  
                
              

              // ///
              // loading: () => CircularProgressIndicator(
              //   color: Colors.white,
              //   strokeWidth: 2,
              // ),

              // ///
              // error: (error, stackTrace) => Text(
              //   'Oops an error occurred 😖',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 15,
              //   ),
              // ),
        //     ),
        //   ),
        // ),
    //   ),
    // );
  

