import 'package:app_movies/models/models.dart';
import 'package:app_movies/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
   
  const DetailScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie:movie),
          SliverList(
              delegate: SliverChildListDelegate(
              [
                _MoviePosterAndTitle(movie:movie),
                _Overview(movie:movie),
               CastingCards(movieID:movie.id),
              ]
            ),
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie  movie;
  const _CustomAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned:true,
      flexibleSpace:FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom:10),
          color:Colors.black12,
          child: Text(movie.title)),
        background: FadeInImage(
            placeholder:const AssetImage('assets/images/loading.gif'),
            image:NetworkImage(movie.fullBackdropPath),
            fit:BoxFit.cover,
        ),
       
      )
    );
  }
}
  
class _MoviePosterAndTitle extends StatelessWidget {
   final Movie  movie;
  const _MoviePosterAndTitle ({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top:20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child:FadeInImage(
                placeholder:const AssetImage('assets/images/loading.gif'),
                image:NetworkImage(movie.fullposterimage),
                height: 150,
                fit: BoxFit.cover,
                ),
        ),
        const SizedBox(
          width:20,
        ), 
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.originalTitle,style: textTheme.titleLarge,overflow: TextOverflow.ellipsis,maxLines: 2,),
              Text(movie.title,style: textTheme.titleMedium,overflow: TextOverflow.ellipsis,maxLines: 2,),
              Row(children: [
                const Icon(Icons.star_outline, size:15, color:Colors.grey),
                const SizedBox(width: 5,),
                Text('${movie.voteAverage}', style: textTheme.bodySmall)
              ],)
            ],
          ),
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie  movie;
  const _Overview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:30, vertical: 10),
      child: Text(movie.overview,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.titleSmall,
      ),

    );
  }
}