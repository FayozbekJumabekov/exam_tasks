import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

class DesktopMode extends StatefulWidget {
  const DesktopMode({Key? key}) : super(key: key);
  static final String id = "dekstopMode";

  @override
  _DesktopModeState createState() => _DesktopModeState();
}

class _DesktopModeState extends State<DesktopMode> {

  List<String> title = ["Diner Steakhouse","Fire Hyper","Delli Turbo","Chizen Burak"];
  List<String> locationRestaraunts = ["Sushi * Seambe","Branch * Colorado Springs","Burgers * America","Kebab * Turkey"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
        appBar: AppBar(
          elevation: 0,
          leading: Icon(Icons.restaurant),
          title: Text("Friendly Eats"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                padding: EdgeInsets.only(left: 10),
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.filter_list,color: Colors.black,),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("All Restaraunts",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("by rating",style: TextStyle(color: Colors.grey.shade500),),


                      ],
                    )
                  ],
                )
            ),



          ),
        ),
        body:  SingleChildScrollView(

          child: Column(
              children: [
                /// Post List
                GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 20,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        mainAxisExtent: MediaQuery.of(context).size.height * 0.4,
                        childAspectRatio: 1,
                        crossAxisCount: 3),
                    itemBuilder: (ctx, index) {
                      return postList(index);

                    }),
              ]
          ),

        )

    );
  }

  /// # Post List
  Widget postList(int index) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/im_kitchen${index%4}.jpg")
            )
        ),
        child: Container(

          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.2)
                  ]
              )
          ),
        ),
      ),
      footer: Container(
        alignment: Alignment.center,
        height: 80,
        color: Colors.white,
        child: GridTileBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title[index%4],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
              Text("${(index+1)*125}\$",style: TextStyle(color: Colors.grey.shade700),),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star,color: Colors.amber,),
                  Icon(Icons.star,color: Colors.amber,),
                  Icon(Icons.star,color: Colors.amber,),
                  Icon(Icons.star,color: Colors.amber,),
                  Icon((index.isEven)?Icons.star_outline_outlined:Icons.star_half,color: Colors.amber,)
                ],
              ),
              Text(locationRestaraunts[index%4],style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
    );
  }
}
