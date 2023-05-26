
import 'package:app_movies/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);
   
    return Scaffold(
      appBar: AppBar(title:const Text('Movies'),
      elevation: 0,
      actions: [
        IconButton(onPressed: (){}, icon:const Icon(Icons.search))
      ],),
      body:  SingleChildScrollView(
            child: Column(
            children: [
              //principal cards
            CardSwiper(movies:moviesProvider.onDisplayMovies),
            //movie slider
            MovieSlider(  
                      movies:moviesProvider.popularMovies,
                      titleSection:'Populars',
                      onNextPage: () {
                        moviesProvider.getPopularMovies();
                      },
                      )
            ],
          ),
      ),
    );
  }
}