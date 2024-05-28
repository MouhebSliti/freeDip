import 'package:flutter/material.dart';
import 'package:mouheb/util/PreferenceManager.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<String> favoriteImages = [];

  @override
  void initState() {
    super.initState();
    // Retrieve favorite images list from PreferenceManager
    PreferenceManager.instance.initPreferences().then((_) {
      setState(() {
        favoriteImages = PreferenceManager.instance.getFavoriteImages();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[800],
        title: const Text(
          "FreeDip",
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightGreen[800],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.dark_mode), label: "Coupon"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoris"),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: "OuiCach"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (index) {
      case 0:
        return _buildHomePage();
      case 1:
        return _buildCouponPage();
      case 2:
        return _buildFavoritesPage();
      case 3:
        return _buildPaymentPage();
      case 4:
        return _buildProfilePage();
      default:
        return Container(); // Default case
    }
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "A la une",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 1; i <= 3; i++)
                  _buildImage("assets/images/c$i.png"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Sortie & loisirs",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 1; i <= 6; i++)
                  _buildImageWithFavoriteButton("assets/images/d$i.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponPage() {
    return SizedBox(
      height: 600,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/empty_box.png",
              height: 550,
              width: 400,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Vous n'avez aucun coupon",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesPage() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Favorites",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: favoriteImages.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  favoriteImages[index],
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentPage() {
    return Scaffold(
      body: Stack(
        children: [
          // The image
          Image.asset(
            "assets/images/ads.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // The X button
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Navigator.popUntil(context, ModalRoute.withName('/homeScreen'));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePage() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 20),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Icon(
              Icons.person,
              size: 100,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    initialValue: PreferenceManager.instance.getString(PreferenceManager.NAME),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "User Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: PreferenceManager.instance.getString(PreferenceManager.EMAIl),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email ",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    initialValue: PreferenceManager.instance.getString(PreferenceManager.PHONE),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "Phone ",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: PreferenceManager.instance.getString(PreferenceManager.PASSWORD),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add_chart_sharp),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () => _logout(context), // Call _logout with context
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18), // Increase button text size
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), // adjust the value as needed
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // shadow direction: bottom center
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0), // same value as above
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _buildImageWithFavoriteButton(String imagePath) {
    return Padding(
      padding: EdgeInsets.all(20.20),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0), // adjust the value as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // shadow direction: bottom center
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.0), // same value as above
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 23,
              right: 23,
              child: IconButton(
                icon: Icon(
                  favoriteImages.contains(imagePath)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: favoriteImages.contains(imagePath)
                      ? Colors.green
                      : Colors.grey,
                  size: 28,
                ),
                onPressed: () {
                  setState(() {
                    if (favoriteImages.contains(imagePath)) {
                      favoriteImages.remove(imagePath);
                    } else {
                      favoriteImages.add(imagePath);
                    }
                    // Save updated favorite images list to PreferenceManager
                    PreferenceManager.instance.setFavoriteImages(favoriteImages);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    // Clear user session data or reset login status
    PreferenceManager.instance.setBool(PreferenceManager.ISLOGGED, false);
    // Navigate back to login screen
    Navigator.of(context).pushReplacementNamed("login");
  }
}
