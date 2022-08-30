import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';


class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);


    

    @override
    Widget build(BuildContext context) {

        final size =  MediaQuery.of(context).size;

        return Container(
            width: double.infinity,
            height: size.height * 0.5,
            //color: Colors.red,
            child: Swiper(
                itemCount: 10,
                layout: SwiperLayout.STACK,
                itemWidth: size.width * 0.6,
                itemHeight: size.height * 0.8,
                itemBuilder:( BuildContext context ,int index){
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const FadeInImage(
                            image: NetworkImage('https://via.placeholder.com/300x400'),
                            placeholder: AssetImage('assets/no-image.jpg'),
                            fit: BoxFit.cover,

                        ),
                    );
                    
                } 
            ),
        );
    }
}