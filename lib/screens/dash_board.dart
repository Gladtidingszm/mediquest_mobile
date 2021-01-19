import 'package:flutter/material.dart';

class SO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }

  get dashBg => Column(
    children: <Widget>[
      Expanded(
        child: Container( decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),),
        flex: 2,
      ),
      Expanded(
        child: Container(color: Colors.transparent),
        flex: 5,
      ),
    ],
  );

  get content => Container(
    child: Column(
      children: <Widget>[
        header,
        grid,
      ],
    ),
  );

  get header => ListTile(
    contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
    title: Text(
      'Dashboard',
      style: TextStyle(color: Colors.white),
    ),
    subtitle: Text(
      'User Dashboard',
      style: TextStyle(color: Colors.blue),
    ),
    trailing: CircleAvatar(),
  );

  get grid => Expanded(
    child: Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GridView.count(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: .90,
        children: List.generate(6, (_) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[FlutterLogo(), Text('data')],
              ),
            ),
          );
        }),
      ),
    ),
  );
}