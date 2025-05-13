import 'package:flutter/material.dart';
import 'package:Film_Finder/constants/constants_files.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:Film_Finder/model/movie_model.dart';

class MoviecontentWidget extends StatelessWidget {
  final MovieModel movie;
  const MoviecontentWidget({super.key, required this.movie});

  

  @override
  Widget build(BuildContext context) {
    return  Positioned.fill(
                    top: 55,
                    bottom:100,
                    
                    child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                          child: AspectRatio(
                            aspectRatio: 16 / 12, // Adjust aspect ratio as needed
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  // Background Image
                                  Image.asset( movie.image_url,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[800]),
                                    
                                  ),
                                  // Gradient Overlay
                                  Container(
                                    decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        kBackgroundColor.withOpacity(0.95), // More opaque at bottom
                        kBackgroundColor.withOpacity(0.0), // Fade out at top
                      ],
                      stops: const [0.0, 0.6], // Adjust stops for gradient spread
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Movie',
                              style: TextStyle(
                                  color: kTextSecondaryColor, fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Text(  movie.title,
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
                            '${movie.year} •${movie.genre} • ${movie.duration}',
                              style: TextStyle(
                                  color: kTextSecondaryColor.withOpacity(0.8),
                                  fontSize: 12),
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
                             color: kTextColor.withOpacity(0.2), // Semi-transparent white
                             shape: BoxShape.circle,
                             border: Border.all(color: kTextColor.withOpacity(0.5), width: 1),
                             boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 1,
                                  offset: const Offset(0, 2),
                                ),
                             ],
                           ),
                           child: const Icon( IconsaxPlusLinear.play,
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
                          ),
                        ),
                  );
  }
}