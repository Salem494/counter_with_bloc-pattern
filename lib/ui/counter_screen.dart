import 'package:counterwithbloc/bloc/bloc.dart';
import 'package:counterwithbloc/bloc/event.dart';
import 'package:counterwithbloc/bloc/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc> (
      create:(BuildContext context) => CounterBloc(),
      child:BlocConsumer<CounterBloc,CounterState>(
        listener: (BuildContext context , CounterState state){
          if(state is SuccessCounterState){
            print('success counter bloc :${state.type}');
          }
        },
        builder: (BuildContext context , CounterState state){
          int count = CounterBloc.get(context).count;

          return Scaffold(
      appBar: AppBar(
        title: Text('Counter Bloc'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: (){
                CounterBloc.get(context).add(IncrementCounterValue());
              },
              elevation: 5,
              child: Icon(Icons.add),
            ),
            Text(
              count.toString()
              ,style: TextStyle(
              fontSize: 25,
              fontWeight:  FontWeight.bold
            ),),
            FloatingActionButton(
              onPressed: (){
                CounterBloc.get(context).add(DecrementCounterValue());
              },
              elevation: 5,
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );

        },
      ) ,
    );

  }
}
