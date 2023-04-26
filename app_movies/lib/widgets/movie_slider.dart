



import 'package:app_movies/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
   final List<Movie> movies;
   final String? titleSection;
  const MovieSlider({Key? key, required this.movies, this.titleSection}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        children:  [

          if(titleSection != null)
             Padding(
              padding:const EdgeInsets.symmetric(horizontal: 20),
              child: Text( titleSection!, style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          const SizedBox(height:5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:movies.length,
              itemBuilder: (_, int index) => _MoviePoster(movie: movies[index])),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie  movie;

  const _MoviePoster({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 130,
      height: 190,
      margin:const EdgeInsets.symmetric(horizontal:10),
      child:Column(
        children:[
          GestureDetector(
            onTap: () => Navigator.pushNamed(context ,'details', arguments: 'move-instance'),
            child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(  
                    placeholder: const AssetImage('assets/images/no-image.jpg'), 
                    image: NetworkImage(movie.fullposterimage),
                    width: 130,
                    height: 190,
                    fit: BoxFit.cover,
                    ),
            ),
          ),
           Text(movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
        ]
      )
    );
  }
}