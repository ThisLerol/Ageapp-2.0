
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ageapp/Contenidos/Books/data_book.dart';

class Biblioteca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: .5,
      title: Text('Libros'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context:context, delegate:DataSearch());
          },
        ),
      ],
    );


 ///crear  mosaico de libros Hero
    createTile(Book book) => Hero(
          tag: book.title,
          child: Material(
            elevation: 15.0,
            shadowColor: Colors.yellow.shade900,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'detail/${book.title}');
              
              },
              child: Image(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );

    ///crear mosaicos de cuadrículas de libros
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: books.map((book) => createTile(book)).toList(),
          ),
        )
      ],
    );

    return Scaffold( 
      appBar: appBar,
      body: grid ,
    );
  }
}


class DataSearch extends SearchDelegate<String>{
 

 final libros = [
   "Creer es tambien pensar",
   "identidad evangelica",
   "Se hizo hombre",
   "¿Que es la mision integral?",
   "Bases biblicas de La Mision",
   "El evangelio hoy",
   "Evangelizar hoy",
   "La chispa y la llama",
   "Tiempo de misión",
   "Identidad Evangelica",
   "El cristiano contemporaneo",
   "Cristianismo básico",
   "Creer es tambien pensar",
   "Asi leo la biblia",
   "El sentido de la vida",
   "El progreso del peregrino Ilustrado",
  "Cristianismo y ciencia",
   "La edad de la tecnica",
   "Dinero y poder",
   "La mujer en el cristianismo",
   "El principio de todas las cosas Ciencia y Religion",
   "El cristianismo Esencia e historia"];

   final recentCities = [
   "Cristianismo y ciencia",
   "La edad de la tecnica",
   "Dinero y poder",
   "La mujer en el cristianismo",
   "El principio de todas las cosas Ciencia y Religion",
   "El cristianismo Esencia e historia",
   ]; 

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones para la barra de aplicaciones (AppBar)
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          query="";
        },
        ),
        ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono principal a la izquierda de la barra de aplicaciones
    
    return IconButton(
       icon:AnimatedIcon(
        icon:AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
       ),
      onPressed: (){
        close(context, null);
      });
  }

  @override
  Widget buildResults(BuildContext context) {
    // mostrar algún resultado basado en la selección
    return Center(
    child: Container(
      height: 100.0,
      width: 100.0,
      child: Card(
        color:Colors.blue,
        child: Center(
          child: Text(query),
          ),
      ),
    )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Mostrar cuando alguien busca algo
      
   final suggestionList  = query.isEmpty ? libros 
    :libros.where((p)=>p.startsWith(query)).toList(); 

    return ListView.builder(
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.book),
        title:RichText(
          text:TextSpan(
            text:suggestionList[index].substring(0,query.length),
            style: TextStyle(
              color:Colors.blue, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text:suggestionList[index].substring(query.length),
                  style: TextStyle(color:Colors.grey))
              ]),
              ),
            onTap: (){

            },
            ), 
          
      itemCount: suggestionList.length,
      );
  }
 
}  


