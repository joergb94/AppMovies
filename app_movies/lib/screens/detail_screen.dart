import 'package:app_movies/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
   
  const DetailScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString()??'no movie';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate(
              [
                const _MoviePosterAndTitle(),
                const  _Overview(),
                const  _Overview(),
                const  _Overview(),
                const  _Overview(),
                const CastingCards(),
              ]
            ),
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

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
          child: const Text('move title')),
        background: const FadeInImage(placeholder:AssetImage('assets/images/loading.gif'),image:NetworkImage('https://via.placeholder.com/300x400'),
        fit:BoxFit.cover,
        ),
       
      )
    );
  }
}
  
class _MoviePosterAndTitle extends StatelessWidget {
  const _MoviePosterAndTitle ({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top:20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(placeholder:AssetImage('assets/images/loading.gif'), image:NetworkImage('https://via.placeholder.com/300x400'),  height: 150,),
        ),
        const SizedBox(
          width:20,
        ), Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('movie.title',style: textTheme.titleLarge,overflow: TextOverflow.ellipsis,maxLines: 2,),
            Text('movie.subtitle',style: textTheme.titleMedium,overflow: TextOverflow.ellipsis,maxLines: 2,),
            Row(children: [
              const Icon(Icons.star_outline, size:15, color:Colors.grey),
              const SizedBox(width: 5,),
              Text('movie.voteAvarage', style: textTheme.bodySmall)
            ],)
          ],
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:30, vertical: 10),
      child: Text('this is an example for the overview this is an example for the overview this is an example for the overview',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.titleSmall,
      ),
      

    );
  }
}