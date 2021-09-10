import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 75, 150, 150),
              Color.fromARGB(255, 60, 190, 150),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ));

    return Stack(
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  "Novidades",
                  style: TextStyle(fontSize: 30.0 ,color: Colors.white),
                ),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection("imagens (home)")
                  .orderBy("pos")
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  QuerySnapshot<Object?>? db = snapshot.data!;
                  print("Chegou aqui");
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    staggeredTiles: db.docs
                        .map((e) => StaggeredTile.count(
                              e["x"],
                              e["y"].toDouble(),
                            ))
                        .toList(),
                    children: db.docs
                        .map((e) => FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: e["image"],
                              height: 300.0,
                              fit: BoxFit.cover,
                            ))
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text("erro: ${snapshot.error}");
                } else {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
