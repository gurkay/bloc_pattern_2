import 'package:flutter/material.dart';

class BasicDemoFather extends StatelessWidget {
  const BasicDemoFather({super.key});
  final _appBarTitle = 'Englich Grammar Test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitle,
        ),
        actions: const [
          Icon(Icons.share),
          SizedBox(
            width: _SizedBoxUtility.width20,
          ),
          Icon(Icons.more_vert_rounded),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text('CHOOSE A LEVEL'),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 128, 96, 134),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Text('Beginner'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 129, 111, 132),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Text('Intermediate'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 170),
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 166, 148, 170),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Text('Upper Intermediate'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text('CHAT WITH ENGLISH LEARNES'),
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10, left: 8),
                  alignment: Alignment.topCenter,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black12,
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _circleAvatar(),
                      _circleAvatar(),
                      _circleAvatar(),
                      _circleAvatar(),
                      _circleAvatar(),
                      _circleAvatar(),
                      _circleAvatar(),
                      _circleAvatar(),
                      _circleAvatar(),
                      _circleAvatar(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 208, 205, 209),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Text(
                        'Connect',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CircleAvatar _circleAvatar() {
    return CircleAvatar(
      radius: _CirclerRadiusUtility.circlerRadius,
      child: InkWell(
        onTap: () {},
        child: PngImage(
          name: ImageItems().appleBookWitoutPath,
        ),
      ),
    );
  }
}

class _SizedBoxUtility {
  static const double width20 = 20;
}

class _CirclerRadiusUtility {
  static const double circlerRadius = 30;
}

class ImageItems {
  final String appleBookWitoutPath = 'ic_apple_with_scholl';
}

class PngImage extends StatelessWidget {
  const PngImage({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.fill,
    );
  }

  String get _nameWithPath => 'assets/png/$name.png';
}
