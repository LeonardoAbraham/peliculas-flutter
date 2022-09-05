import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

        //TODO: Cambiar luego por una instancia de movie
        final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

        return Scaffold(
            body: CustomScrollView(
                slivers: [
                    _CustomAppBar(),
                    SliverList(
                        delegate: SliverChildListDelegate([
                            _PosterAndTitle(),
                            _Overview(),
                            _Overview(),
                            _Overview(),
                            CastingCards()
                        ])
                    )
                ],
            )
        );
    }
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.indigo,
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.all(0),
            title: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only( bottom: 10 ),
                color: Colors.black12,
                child: Text(
                    'movie.title',
                    style: TextStyle( fontSize: 16 ),
                ),
            ),
            background: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage('https://via.placeholder.com/500x300'),
                fit: BoxFit.cover,
            )
        ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
       margin: EdgeInsets.only( top:20 ),
       padding: EdgeInsets.symmetric( horizontal: 20 ),
       child: Row(
        children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage('https://via.placeholder.com/200x300'),
                    height: 150,
                ),
            ),

            SizedBox( width: 20 ),

            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text('movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2),
                    Text('movie.originalTitle', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2,),

                    Row(
                        children: [
                            Icon( Icons.star_outline, size: 15, color: Colors.grey ),
                            SizedBox( width: 5 ),
                            Text( 'movie.vote.Average', style: textTheme.caption )
                        ],
                    )
                ],
            )
        ],
       ),

    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
        child: Text(
            'Dolor velit culpa velit dolor culpa pariatur elit ut laborum dolor occaecat id. Ut fugiat Lorem ullamco deserunt est cillum et deserunt pariatur laboris do. Ex duis fugiat amet eu. Elit anim ad consectetur sit nisi sint minim. Nulla non minim occaecat aliquip deserunt in amet ipsum in sint eiusmod tempor. Deserunt Lorem irure et enim est duis sint nisi ipsum. Sint do proident cupidatat ullamco ullamco ut magna reprehenderit ullamco magna non elit.',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
        ),

    );
  }
}