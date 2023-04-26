import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({Key? key, required this.movies}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(movies.isEmpty){
      return SizedBox(
        width: double.infinity,
        height: size.height*0.5,
        child:  const Center(child: CircularProgressIndicator()),
      );
    }
    return Container(
        width: double.infinity,
        height: size.height*0.5,
        child: Swiper(
          layout: SwiperLayout.STACK, 
          itemCount: movies.length,
           itemWidth: size.width*0.6,
          itemHeight: size.height*0.4,
          itemBuilder: ( _ , int index) {
            final movie = movies[index]; 
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context ,'details'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  FadeInImage(
                   placeholder: const AssetImage('assets/images/loading.gif'),
                  image: NetworkImage(movie.fullposterimage),
                  fit: BoxFit.cover
                ),
              ),
            );
           
          },
        ),
      );
  }
}