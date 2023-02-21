// ignore_for_file: prefer_const_constructors

import 'package:api_work/business%20logic/Apis/apis_bloc.dart';
import 'package:api_work/presentation/widgets/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<ApisBloc>().add(AddApisEvent());
              },
              icon: Icon(Icons.replay_rounded))
        ],
      ),
      body: SafeArea(child: BlocBuilder<ApisBloc, ApisState>(
        builder: (context, state) {
          if (state is ApisInitialState) {
            return Text('intial');
          } else if (state is ApisLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ApisLoadedState) {
            var data = state.user.results![0];

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Colors.blue, blurRadius: 14),
                        BoxShadow(color: Colors.lightBlueAccent, blurRadius: 4)
                      ],
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //image
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(data.picture!.large.toString()),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //name
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 80,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Hey, My name is ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.blueGrey),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        '${data.name!.title}. ${data.name!.first} ${data.name!.last}'),
                                  ]),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          //Age
                          customSimpleRow(context,
                              text: '   ${data.dob!.age}', title: 'Age  : '),

                          //email
                          customSimpleRow(context,
                              text: '${data.email}', title: 'Email : '),

                          //phone. number
                          customSimpleRow(context,
                              text: '${data.phone}', title: 'Contact No : '),

                          //location
                          customSimpleRow(context,
                              text:
                                  '${data.location!.city} , ${data.location!.state} ,${data.location!.country}',
                              title: 'Location  : '),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<ApisBloc>().add(AddApisEvent());
                    },
                    child: Text("Next"),
                  ),
                ],
              ),
            );
          } else if (state is ApisfailureState) {
            return Text(state.message);
          }
          return Container();
        },
      )),
    );
  }
}
