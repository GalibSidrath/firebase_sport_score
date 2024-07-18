import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_1st_project/model/football_model.dart';
import 'package:flutter/material.dart';

class FootballScore extends StatefulWidget {
  const FootballScore({super.key});

  @override
  State<FootballScore> createState() => _FootballScoreState();
}

class _FootballScoreState extends State<FootballScore> {
  List<FootballModel> matchList = [];

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> _getData() async {
    matchList.clear();
    final QuerySnapshot result =
        await firebaseFirestore.collection('football').get();
    for (QueryDocumentSnapshot doc in result.docs) {
      matchList.add(FootballModel(
        team1Name: doc.get('team1name'),
        team1Score: doc.get('team1'),
        team2Name: doc.get('team2name'),
        team2Score: doc.get('team2'),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Score'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: matchList.length,
          itemBuilder: (context, index) {
            return FootballCard(
              model: matchList[index],
            );
          }),
    );
  }
}

class FootballCard extends StatelessWidget {
  const FootballCard({
    super.key,
    required this.model,
  });

  final FootballModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                model.team1Score.toString(),
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                model.team1Name.toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
          const Text(
            'VS',
            style: TextStyle(fontSize: 22),
          ),
          Column(
            children: [
              Text(
                model.team2Score.toString(),
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                model.team2Name.toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
