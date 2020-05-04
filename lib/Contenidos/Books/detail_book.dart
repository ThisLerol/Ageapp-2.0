import 'package:flutter/material.dart';
import 'package:ageapp/Contenidos/Books/data_book.dart';
import 'package:ageapp/Contenidos/Books/rating_book.dart';
import 'package:url_launcher/url_launcher.dart';


class Detail extends StatelessWidget {
  final Book book;

  Detail(this.book);

  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: .5,
      title: Text('Libros y Materiales'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );

    //detalle de la imagen del libro y sus páginas

    final topLeft = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: book.title,
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.yellow.shade900,
              child: Image(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        text('${book.pages} pages', color: Colors.black38, size: 12)
      ],
    );

    ///detalle arriba a la derecha
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(book.title,
            size: 16, isBold: true, padding: EdgeInsets.only(top: 16.0)),
        text(
          'by ${book.writer}',
          color: Colors.black54,
          size: 12,
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
        ),
        Row(
          children: <Widget>[
            text(
              book.year,
              isBold: true,
              padding: EdgeInsets.only(right: 8.0),
            ),
            RatingBar(rating: book.rating)
          ],
        ),
        SizedBox(height: 32.0),
        Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blue.shade200,
          elevation: 5.0,
          child: MaterialButton(
            onPressed: _launchURL,
            minWidth: 160.0,
            color: Colors.blue,
            child: text('DESCARGAR', color: Colors.white, size: 13),
             
          ),
        )
      ],
    );

    final topContent = Container(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    ///descripción del texto desplazable
    final bottomContent = Container(
      height: 280.0,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          book.description,
          style: TextStyle(fontSize: 13.0, height: 1.5),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }

  //crear widget de texto
  text(String data,
          {Color color = Colors.black87,
          num size = 14,
          EdgeInsetsGeometry padding = EdgeInsets.zero,
          bool isBold = false}) =>
      Padding(
        padding: padding,
        child: Text(
          data,
          style: TextStyle(
              color: color,
              fontSize: size.toDouble(),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      );

      _launchURL() async {
      var url =  book.link;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
        throw 'No se pudo iniciar $url';
      }
    }

}


