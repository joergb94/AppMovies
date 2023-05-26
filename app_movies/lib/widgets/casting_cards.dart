import 'package:app_movies/models/models.dart';
import 'package:app_movies/providers/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieID;
  const CastingCards({super.key, required this.movieID});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen:false);
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieID),
      builder:(_, AsyncSnapshot<List<Cast>> snapshot){
        if(!snapshot.hasData){
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            height:180,
            child:const CupertinoActivityIndicator(),
          );
        }
        final List<Cast> cast = snapshot.data!;

          return Container(
              margin: const EdgeInsets.only(bottom:30),
              width: double.infinity,
              height: 180,
              child: ListView.builder(
              itemCount: cast.length, 
              scrollDirection: Axis.horizontal,
              itemBuilder:(BuildContext context, int index) => _CastCard(actor:cast[index])),
            );
      });
  
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;
  const _CastCard({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
     final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:10),
      width: 100,
      height: 100,
      child: Column(
        children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(placeholder:const AssetImage('assets/images/loading.gif'), image:NetworkImage(actor.fullprofilePath),
              height: 140,
              width: 100,
              fit:BoxFit.cover),
            ),
            const SizedBox( height:5 ),
            Text(actor.name,style: textTheme.titleSmall,overflow: TextOverflow.ellipsis,maxLines: 2, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}