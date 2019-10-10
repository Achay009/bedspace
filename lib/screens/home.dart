import 'package:flutter/material.dart';

class SquatHome extends StatefulWidget {
  @override
  _SquatHomeState createState() => _SquatHomeState();
}

class _SquatHomeState extends State<SquatHome> {
   TabController _tabController;
   PageController _pageController;

   List <String> images = [
     'https://images-na.ssl-images-amazon.com/images/I/71Ri6X8FLzL._SX342_.jpg',
     'https://m.media-amazon.com/images/M/MV5BMDhmNDI2MzQtZGMxNi00ZWQ3LTlmMTgtMDBhYWEwYzkzOWM4XkEyXkFqcGdeQXRyYW5zY29kZS13b3JrZmxvdw@@._V1_UX477_CR0,0,477,268_AL_.jpg',
     'https://media.services.cinergy.ch/media/box1600/6abf0708ed0949eb477241437e9dd145e1aeae7c.jpg',
     'https://pikidsmedia.com/wp-content/uploads/2019/04/9781503745643_front_photo.jpg'
   ];




   @override
   void initState() {
     super.initState();
     _pageController = PageController(initialPage: 1, viewportFraction: 0.8 );
   }
//Coming for this one later on
   _pageSelector(int index){
     return AnimatedBuilder(
       animation: _pageController,
       builder: (BuildContext context, Widget widget){
         double value =1;
         if(_pageController.position.haveDimensions){
           value = _pageController.page;
           value = (1 - (value.abs() * 0.3) + 0.6).clamp(0.0,1.0);
         }
         return Center(
           child: SizedBox(
             height: Curves.easeInOut.transform(value)*270.0,
             width: Curves.easeInOut.transform(value)*400.0,
             child: widget,
           ),
         );
       },
       child: Stack(
         children: <Widget>[
           Center(
             child: Container(
               margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.0),
                 boxShadow: [
                   BoxShadow(
                     color: new Color(0xffECFCFF),
                     offset: Offset(0.0, 4.0),
                     blurRadius: 10.0,
                   ),
                 ],
               ),
               child: Center(
                 child: Hero(
                     tag: 'Kuroko',
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(10.0),
                       child: Image.network(images[index],fit: BoxFit.cover),

                     ),
                 ),
               ),
             ),
           )
         ],
       ),
     );

   }

   @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: new AppBar(
        leading:IconButton(
          icon: Icon(Icons.menu),
          onPressed: ()=>print('Menu button Pressed'),

        ),

        title: new Text('SQUAT'),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0))
        ],
      ),

      body: ListView(
        children: <Widget>[

          Container(
            height : 240.0,
            width : double.infinity,
            color: new Color(0xffECFCFF),
            child: PageView.builder(
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemBuilder: (BuildContext context,int index){
                return _pageSelector(index);
              },

            ),

          ),
          Container(
            height : 50.0,
            width : double.infinity,
            color: Colors.black,
            child: new TabBarView(children: null),

            ),
          ),
        ],
      )

    );
  }
}
