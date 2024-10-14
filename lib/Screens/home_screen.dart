import 'package:api/Components/custom_button.dart';
import 'package:api/Screens/Product/produnct_screen.dart';
import 'package:api/Screens/Recipe/recipe_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff3F51B5),
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  title: "Product",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(),
                        ));
                  },
                ),
                Text(
                  "Product Api",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  title: "Recipe",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeScreen(),
                        ));
                  },
                ),
                Text(
                  "Recipe Api",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
