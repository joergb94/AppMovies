



import 'package:app_movies/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {
   final List<Movie> movies;
   final String? titleSection;
   final Function onNextPage;
  const MovieSlider({
                      Key? key, 
                      required this.movies, 
                      required this.onNextPage, 
                      this.titleSection,
                    }) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController();
  @override 
  void initState(){
    super.initState();
    scrollController.addListener(() { 
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
         widget.onNextPage();
      }
    });
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        children:  [

          if(widget.titleSection != null)
             Padding(
              padding:const EdgeInsets.symmetric(horizontal: 20),
              child: Text( widget.titleSection!, style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          const SizedBox(height:5),
          Expanded(
          child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount:widget.movies.length,
              itemBuilder: (_, int index) => _MoviePoster(movie: widget.movies[index])),
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
            onTap: () => Navigator.pushNamed(context ,'details', arguments: movie),
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