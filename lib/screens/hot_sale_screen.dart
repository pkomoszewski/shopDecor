import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/mainAppBar.dart';
import '../widgets/mainGradientContainer.dart';
import '../widgets/mainDrawer.dart';
import '../providers/products.dart';
import '../screens/product_detals_screen.dart';

class HotSaleScreen extends StatefulWidget {
  static const routeName = '/hotsale';
  @override
  _HotSaleScreenState createState() => _HotSaleScreenState();
}

class _HotSaleScreenState extends State<HotSaleScreen> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final promoProducts = productsData.promoItems;
    return Scaffold(
      drawer: MainDrawer(),
      appBar: MainAppbar(
        height: 200,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              MainGradientContainer(height, width),
              Positioned(
                top: height * .1,
                left: 30.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hot Sale",
                        style: TextStyle(
                            fontSize: 28.0, fontFamily: "Montserrat-Bold")),
                    Text("this is time",
                        style: TextStyle(
                            fontSize: 16.0, fontFamily: "Montserrat-Medium"))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: height * 0.72,
                  child: ListView.builder(
                    itemCount: promoProducts.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              ProductDetalsScreen.routeName,
                              arguments: promoProducts[index].id);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 35.0, bottom: 60.0),
                          child: SizedBox(
                            width: 200.0,
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 45.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: (index % 2 == 0)
                                            ? Colors.white
                                            : Color(0xFF2a2d3f),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(0.0, 10.0),
                                              blurRadius: 10.0)
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.network(
                                      promoProducts[index].imageUrl,
                                      width: 172.5,
                                      height: 199.0,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 12.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(promoProducts[index].title,
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: "Montserrat-Bold",
                                                  color: (index % 2 == 0)
                                                      ? Color(0xFF2a2d3f)
                                                      : Colors.white)),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                              '\$${promoProducts[index].promoPrice}',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily:
                                                      "Montserrat-Medium",
                                                  color: (index % 2 == 0)
                                                      ? Colors.red
                                                      : Colors.white)),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
