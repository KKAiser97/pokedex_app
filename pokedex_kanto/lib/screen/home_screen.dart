import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_kanto/bloc/poke_bloc.dart';
import 'package:pokedex_kanto/bloc/poke_event.dart';
import 'package:pokedex_kanto/bloc/poke_state.dart';

import 'detail_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PokeBloc>(context).add(GetAllEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke App"),
        backgroundColor: Colors.cyan,
      ),
      body: BlocConsumer<PokeBloc, PokeState>(
        listener: (context, state) => print(state),
        builder: (context, state) {
          if (state is PokeLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokeFailedState) {
            return Center(
              child: Text('Something wrong happened!'),
            );
          } else if (state is PokeSuccessState) {
            return GridView.count(
              crossAxisCount: 2,
              children: (state.pokedex)
                  .pokemon
                  .map((poke) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PokeDetailScreen(
                                          pokemon: poke,
                                        )));
                          },
                          child: Hero(
                            tag: poke.img,
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                      flex: 8,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.scaleDown,
                                                image: NetworkImage(poke.img))),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        poke.name,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
