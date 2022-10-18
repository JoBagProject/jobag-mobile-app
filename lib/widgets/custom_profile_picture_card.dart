import 'package:flutter/material.dart';

class ProfilePictureCard extends StatelessWidget {

  const ProfilePictureCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('https://peopleinmedia.org/wp-content/uploads/2020/07/Aurora-Aksnes-240x320.jpg'),
              height: 140,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
          //Text(actor.name, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}

