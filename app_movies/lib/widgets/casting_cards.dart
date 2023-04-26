import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom:30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
      itemCount: 10, 
      scrollDirection: Axis.horizontal,
      itemBuilder:(BuildContext context, int index) => _CastCard()),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

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
              child: const FadeInImage(placeholder:AssetImage('assets/images/loading.gif'), image:NetworkImage('https://via.placeholder.com/150x300'),
              height: 140,
              width: 100,
              fit:BoxFit.cover),
            ),
            const SizedBox( height:5 ),
            Text('actor.name is an example of a actor',style: textTheme.titleSmall,overflow: TextOverflow.ellipsis,maxLines: 2, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}