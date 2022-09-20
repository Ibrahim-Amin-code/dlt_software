// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dlt_software/bussiness_logic/home_cubit/home_cubit.dart';
import 'package:dlt_software/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    TextEditingController searchController = TextEditingController();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Color(0xffC851D5),
            elevation: 0,
            leading: Container(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: h * 0.04, left: w * 0.04),
                  height: h * 0.12,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.topRight,
                    // ignore: prefer_const_literals_to_create_immutables
                    colors: [
                      // ignore: use_full_hex_values_for_flutter_colors
                      Color(0xffC851D5),
                      Color(0xff3F80B8), //0xffC851D5
                    ],
                  )),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: w * 0.7,
                          height: h * 0.055,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              SizedBox(
                                width: w * 0.04,
                              ),
                              // ignore: prefer_const_constructors
                              Icon(
                                Icons.search,
                                size: 30,
                              ),
                              SizedBox(
                                width: w * 0.02,
                              ),
                              Container(
                                width: w * 0.5,
                                child: textFormField(
                                    controller: searchController,
                                    obscureText: false,
                                    hintText: 'Search',
                                    keyboardType: TextInputType.text),
                                // color: Colors.red,
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/icons/DLT.png',
                          width: w * 0.2,
                          height: h * 0.06,
                          fit: BoxFit.cover,
                          color: Colors.white,
                        )
                      ]),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                ConditionalBuilder(
                  condition: state is! HomeLoadingState,
                  builder: (context) => Container(
                    // height: h ,
                    // width: 200,
                    // color: Colors.red,
                    child: Text(
                      parseHtmlString(HomeCubit.get(context)
                          .homeData
                          .content!
                          .rendered
                          .toString()),

                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      //     .replaceAll("\n", ""))
                      // .replaceAll(" ", ""),
                    ),
                  ),
                  fallback: (context) => SizedBox(),
                  // child: ,
                ),
                // Container(
                //   height: 500,
                //   color: Colors.black,
                // )
                /** */
              ],
            ),
          ),
        );
      },
    );
  }
}
