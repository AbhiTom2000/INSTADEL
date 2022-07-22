import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';
import 'package:food_app/screens/review_cart/review_cart.dart';
import 'package:food_app/screens/wishList/wish_list.dart';

class DrawerSide extends StatefulWidget {
  UserProvider userProvider;
  DrawerSide({this.userProvider});
  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTile({String title, IconData iconData, Function onTap}) {
    return Container(
      height: 50,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          size: 28,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          userData.userImage ??
                              "data:image/png;base64,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",
                        ),
                        radius: 40,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userData.userName,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          userData.userEmail,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
              iconData: Icons.home_outlined,
              title: "Home",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.shop_outlined,
              title: "Review Cart",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.person_outlined,
              title: "My Profile",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MyProfile(userProvider: widget.userProvider),
                  ),
                );
              },
            ),
            listTile(
                iconData: Icons.notifications_outlined, title: "Notificatio"),
            listTile(iconData: Icons.star_outline, title: "Rating & Review"),
            listTile(
                iconData: Icons.favorite_outline,
                title: "Wishlist",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WishLsit(),
                    ),
                  );
                }),
            listTile(iconData: Icons.copy_outlined, title: "Raise a Complaint"),
            listTile(iconData: Icons.format_quote_outlined, title: "FAQs"),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support",
                      style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call us:", style: TextStyle(color: Colors.white)),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+917451060679",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:", style: TextStyle(color: Colors.white)),
                        SizedBox(
                          width: 10,
                        ),
                        Text("abhitom2000@gmail.com",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
