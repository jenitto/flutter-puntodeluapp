import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:puntodeluapp/src/models/pelicula.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> films;

  CardSwiper({@required this.films});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          films[index].uniqueId = '${films[index].id}-tarjeta';

          return Hero(
            tag: films[index].uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'detalle',
                      arguments: films[index]);
                },
                child: FadeInImage(
                  image: NetworkImage(films[index].getPosterImg()),
                  placeholder: AssetImage('assets/img/loading.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        itemCount: films.length,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
//        pagination: new SwiperPagination(),
//        control: new SwiperControl(),
      ),
    );
  }
}
