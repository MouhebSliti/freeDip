import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryScreenState();
  }
}

class CategoryScreenState extends State<CategoryScreen> {
  bool isLoisirSelected = false;
  bool isCafeSelected = false;
  bool isBeautySelected = false;
  bool isShoppingSelected = false;
  bool isSpaSelected = false;
  bool isSanteSelected = false;
  bool isServiceSelected = false;
  bool isLoungeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
            width: double.infinity,
          ),
          const Text(
            "Les Catégories",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Text(
            "Merci de choisir 3\n centre d'intérêt.",
            style: TextStyle(
                fontSize: 22,
                color: Colors.green[800],
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          Wrap(
            direction: Axis.horizontal,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isLoisirSelected = !isLoisirSelected;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 90,
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_florist_sharp,
                          color: isLoisirSelected
                              ? Colors.green[800]
                              : Colors.black,
                          size: 30),
                      Text(
                        "Sortie & loisirs",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: isLoisirSelected
                                ? Colors.green[800]
                                : Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isCafeSelected = !isCafeSelected;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 90,
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_cafe,
                          color:
                              isCafeSelected ? Colors.green[800] : Colors.black,
                          size: 30),
                      Text(
                        "Cafés & resto",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: isCafeSelected
                                ? Colors.green[800]
                                : Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isShoppingSelected = !isShoppingSelected;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 90,
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag,
                          color: isShoppingSelected
                              ? Colors.green[800]
                              : Colors.black,
                          size: 30),
                      Text(
                        "Shopping",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: isShoppingSelected
                                ? Colors.green[800]
                                : Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isBeautySelected = !isBeautySelected;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 90,
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.emoji_transportation,
                          color: isBeautySelected
                              ? Colors.green[800]
                              : Colors.black,
                          size: 30),
                      Text(
                        "Beauty & bien être",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: isBeautySelected
                                ? Colors.green[800]
                                : Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSpaSelected = !isSpaSelected;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 90,
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.spa,
                          color:
                              isSpaSelected ? Colors.green[800] : Colors.black,
                          size: 30),
                      Text(
                        "Hammam & spa",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: isSpaSelected
                                ? Colors.green[800]
                                : Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSanteSelected = !isSanteSelected;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 90,
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.medical_information,
                          color: isSanteSelected
                              ? Colors.green[800]
                              : Colors.black,
                          size: 30),
                      Text(
                        "Forme & Sante",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: isSanteSelected
                                ? Colors.green[800]
                                : Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isServiceSelected = !isServiceSelected;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 90,
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cleaning_services,
                          color: isServiceSelected
                              ? Colors.green[800]
                              : Colors.black,
                          size: 30),
                      Text(
                        "Services",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: isServiceSelected
                                ? Colors.green[800]
                                : Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isLoungeSelected = !isLoungeSelected;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 90,
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.landslide_rounded,
                          color: isLoungeSelected
                              ? Colors.green[800]
                              : Colors.black,
                          size: 30),
                      Text(
                        "Lounges",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: isLoungeSelected
                                ? Colors.green[800]
                                : Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed("homeScreen");
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                color: Colors.green[800],
                child: const Text(
                  "Confirmer",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
