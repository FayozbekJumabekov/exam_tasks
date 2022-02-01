import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({Key? key}) : super(key: key);
  static final String id = "mobileMode";

  @override
  _MobilePageState createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  int get count => list.length;
     List<String> title = ["Diner Steakhouse","Fire Hyper","Delli Turbo","Chizen Burak"];
   List<String> locationRestaraunts = ["Sushi * Seambe","Branch * Colorado Springs","Burgers * America","Kebab * Turkey"];


  List<Widget> list = [];

  void initState() {

    list.addAll(List.generate(10, (v) => Container(
      height: 400,
      margin: EdgeInsets.only(bottom: 10),
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/im_kitchen${v%4}.jpg")
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
                Text( title[v%4] ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                Text("\$\$\$",style: TextStyle(color: Colors.grey.shade700),),
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
                    Icon((v.isEven)?Icons.star_outline_outlined:Icons.star_half,color: Colors.amber,)
                  ],
                ),
                Text(locationRestaraunts[v%4],style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
        ),
      ),
    )));
    super.initState();
  }

  void load() {
    print("load");
    setState(() {
      list.addAll(List.generate(10, (v) => Container(
        height: 400,
        margin: EdgeInsets.only(bottom: 10),
        child: GridTile(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/im_kitchen${v%4}.jpg")
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
                  Text( title[v%4] ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                  Text("\$\$\$",style: TextStyle(color: Colors.grey.shade700),),
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
                      Icon((v.isEven)?Icons.star_outline_outlined:Icons.star_half,color: Colors.amber,)
                    ],
                  ),
                  Text(locationRestaraunts[v%4],style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),
        ),
      )));
      print("data count = ${list.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.restaurant),
        title: Text("Friendly Eats"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.only(left: 10),
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All Restaraunts",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "by rating",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
      body: Container(
        child: RefreshIndicator(
          child: LoadMore(
            isFinish: count >= 100,
            onLoadMore: _loadMore,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                itemCount: count,
                itemBuilder: (context,index){
              return postList(index);

            }),
            whenEmptyLoad: false,
            delegate: DefaultLoadMoreDelegate(),
            textBuilder: DefaultLoadMoreTextBuilder.english,
          ),
          onRefresh: _refresh,
        ),
      ),
    );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    list.clear();
    load();
  }
  Widget postList(int index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10),
      child: GridTile(
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
                Text( title[index%4] ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                Text("\$\$\$",style: TextStyle(color: Colors.grey.shade700),),
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
      ),
    );
  }

}
