import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/page_controller.dart';

class Movie {
  final String title;
  final String releaseDate;
  final List<String> images;

  Movie({
    required this.title,
    required this.releaseDate,
    required this.images,
  });
}

class ProjectSlider extends StatelessWidget {
  ProjectSlider({super.key});

  final List<Movie> popularResults = [
    Movie(
      title: "Inception",
      releaseDate: "2010-07-16",
      images: [
        "https://image.tmdb.org/t/p/w500/8kNruSfhk5IoE4eZOc4UpvDn6tq.jpg",
        "https://image.tmdb.org/t/p/w500/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg",
        "https://image.tmdb.org/t/p/w500/s2bT29y0ngXxxu2IA8AOzzXTRhd.jpg",
      ],
    ),
    Movie(
      title: "Interstellar",
      releaseDate: "2014-11-07",
      images: [
        "https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg",
        "https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
        "https://image.tmdb.org/t/p/w500/8RKBHHRqOMOLh5qW3sS6TSFTd8h.jpg",
      ],
    ),
    Movie(
      title: "The Dark Knight",
      releaseDate: "2008-07-18",
      images: [
        "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
        "https://image.tmdb.org/t/p/w500/1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg",
        "https://image.tmdb.org/t/p/w500/9myrRcegWGGp24mpVfkD4zhUfhi.jpg",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageControllerProvider(),
      child: Consumer<PageControllerProvider>(
        builder: (context, provider, child) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CarouselSlider.builder(
              itemCount: popularResults.length,
              itemBuilder: (context, index, realIndex) {
                final movie = popularResults[index];
                provider.initializeController(index, movie.images.length);

                return Stack(
                  children: [
                    Container(
                      color: Colors.black,
                      width: double.infinity,
                      height: 300,
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                PageView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: provider.getController(index),
                                  itemCount: movie.images.length,
                                  itemBuilder: (context, imgIndex) {
                                    return Image.network(
                                      movie.images[imgIndex],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 217,
                                      errorBuilder: (context, error, stackTrace) => Container(
                                        color: Colors.grey,
                                        child: const Center(child: Text("Image Not Available")),
                                      ),
                                    );
                                  },
                                ),
                                Positioned(
                                  left: 10,
                                  top: 100,
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                                    onPressed: () => provider.previousImage(index),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 100,
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
                                    onPressed: () => provider.nextImage(index, movie.images.length),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                height: 250,
                enlargeCenterPage: true,
                autoPlay: false,
                viewportFraction: 1,
                aspectRatio: 16 / 9,
              ),
            ),
          );
        },
      ),
    );
  }
}
