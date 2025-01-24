import 'package:flutter/material.dart';
import 'package:todolistapp/assets/imageConstants.dart';
import 'package:todolistapp/utils/utils.dart';
import 'package:todolistapp/routes/appRoutes.dart';



extension PoppinsExtension on  TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}

extension InterExtension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}


class homeScreen extends StatelessWidget {
  homeScreen({Key? key}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0XFF020206),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildTaskSummary(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.h,
                          vertical: 18.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Progress",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.fSize,
                                        fontWeight: FontWeight.w400
                                      ).poppins,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "See All",
                                      style: TextStyle(
                                        color: Color(0XFFBA83DE),
                                        fontSize: 16.fSize,
                                        fontWeight: FontWeight.w400,
                                      ).poppins,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 12.h,),
                            _buildProgressSection(context),
                            SizedBox(height: 50.h,),
                            _buildTodayTasksList(context),
                            SizedBox(height: 50.h,),
                            _buildTomorrowsTasksList(context),
                            SizedBox(height: 55.h,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, appRoutes.CreateTaskScreen);
            },
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0XFFDE83B0),
                    Color(0XFFC59ADF)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.black54,
                size: 30.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildTaskSummary(BuildContext context) {
  TextEditingController searchController = TextEditingController();
  return Container(
    width: double.maxFinite,
    // decoration: BoxDecoration(
    //   color: Color(0XFF029206),
    // ),
    child: Column(
      children: [
        SizedBox(height: 20.h,),
        Container(
          margin: EdgeInsets.only(left: 0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns text and image to opposite sides
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.h),
                width: MediaQuery.of(context).size.width * 0.7, // 70% of the screen width
                child: RichText(
                  text: TextSpan(
                    text: "You have got 5 tasks today to complete ",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 25.fSize,
                      fontWeight: FontWeight.w500,
                    ).poppins,
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Image.asset(
                          ImageConstant.pencil,
                          width: 20.h,
                          height: 20.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20.h,top: 5.h,),
                width: 50.h, // Adjust size as needed
                height: 50.h, // Ensure the container is square
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Circular shape
                  gradient: LinearGradient(
                    colors: [
                      Color(0XFFBA83DE),
                      Colors.white10
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: ClipOval(
                    child: Image.asset(
                      ImageConstant.profileImg,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      height: double.maxFinite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 12.h,
            left: 18.h,
            right: 18.h,
          ),
          child: Container(
            width: double.maxFinite,
            child: TextFormField(
              autofocus: false,
              focusNode: FocusNode(),
              controller: searchController,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.fSize,
                fontWeight: FontWeight.w300,
              ).poppins,
              decoration: InputDecoration(
                hintText: "Search Task Here",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 10.fSize,
                  fontWeight: FontWeight.w300,
                ).poppins,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 0.h),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 0.h),
                  child: IconButton(
                    onPressed: () {
                      searchController.clear();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Color(0xff757575),
                    ),
                  ),
                ),
                filled: true,
                fillColor: Color(0xff2d2d2d),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h,),
      ],
    ),
  );
}

// PROGRESS SECTION
Widget _buildProgressSection(BuildContext context){
  return Container(
    width: double.maxFinite,
    padding: EdgeInsets.all(14.h),
    decoration: BoxDecoration(
        color: Color(0XFF181818),
        borderRadius: BorderRadius.circular(8.h)
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Daily Task",
          style: TextStyle(
            color: Color(0XFFFFFFFF),
            fontSize: 15.fSize,
            fontWeight: FontWeight.w400,
          ).inter,
        ),
        SizedBox(height: 8.h,),
        Text(
          "2/3 Tasks Completed",
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 13.fSize,
            fontWeight: FontWeight.w400
          ).inter,
        ),
        SizedBox(height: 2.h,),
        SizedBox(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "You are almost done go ahead",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 10.fSize,
                    fontWeight: FontWeight.w200,
                  ).inter,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.h),
                child: Text(
                  "66%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.fSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 2.h,),
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(right: 12.h),
          child: SizedBox(
            height: 20.h,
            width: 350.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.h),
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(20.h),
                color: Color(0XFFBA83DE),
                backgroundColor: Color(0XFFBA83DE).withValues(alpha: 0.4),
                value: 0.66,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    ),
  );
}

Widget _buildTodayTasksList(BuildContext context){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today's Task",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.fSize,
              fontWeight: FontWeight.w400
            ).poppins,
          ),
          Text(
            "See All",
            style: TextStyle(
              color: Color(0XFFBA83DE),
              fontSize: 16.fSize,
              fontWeight: FontWeight.w400,
            ).poppins,
          ),
        ],
      ),
      SizedBox(height: 12.h,),
      Stack(
        children: [
          Container(
            width: 15.h,
            height: 79.6.h,
            decoration: BoxDecoration(
                color: Color(0XFFFACBBA),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.h),
                  topLeft: Radius.circular(8.h)
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.h),
            width: double.maxFinite,
            height: 80.h,
            decoration: BoxDecoration(
              color: Color(0XFF1F1F1F),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8.h),
                topRight: Radius.circular(8.h)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.h,top: 15.h),
                  child: Column(
                    children: [
                      Text(
                        "Mobile App Research",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.fSize,
                          fontWeight: FontWeight.w300,
                        ).poppins,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 130.h),
                        child: Row(
                          children: [
                            Image.asset(
                              ImageConstant.calendarIcon,
                              width: 25.h,
                              height: 25.h,
                            ),
                            Text(
                              "4 Oct",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.fSize,
                                fontWeight: FontWeight.w200
                              ).poppins,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.h),
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: Color(0XFFBA83DE),
                    size: 25.h,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 10.h,),
      Stack(
        children: [
          Container(
            width: 15.h,
            height: 79.6.h,
            decoration: BoxDecoration(
                color: Color(0XFFD7F0FF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.h),
                    topLeft: Radius.circular(8.h)
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.h),
            width: double.maxFinite,
            height: 80.h,
            decoration: BoxDecoration(
                color: Color(0XFF1F1F1F),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8.h),
                    topRight: Radius.circular(8.h)
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.h,top: 15.h),
                  child: Column(
                    children: [
                      Text(
                        "Prepare Wireframe For Main Flow",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.fSize,
                          fontWeight: FontWeight.w300,
                        ).poppins,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 230.h),
                        child: Row(
                          children: [
                            Image.asset(
                              ImageConstant.calendarIcon,
                              width: 25.h,
                              height: 25.h,
                            ),
                            Text(
                              "4 Oct",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.fSize,
                                  fontWeight: FontWeight.w200
                              ).poppins,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.h),
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: Color(0XFFBA83DE),
                    size: 25.h,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 10.h,),
      Stack(
        children: [
          Container(
            width: 15.h,
            height: 79.6.h,
            decoration: BoxDecoration(
                color: Color(0XFFFACBBA),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.h),
                    topLeft: Radius.circular(8.h)
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.h),
            width: double.maxFinite,
            height: 80.h,
            decoration: BoxDecoration(
                color: Color(0XFF1F1F1F),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8.h),
                    topRight: Radius.circular(8.h)
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.h,top: 15.h),
                  child: Column(
                    children: [
                      Text(
                        "Prepare Screens",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.fSize,
                          fontWeight: FontWeight.w300,
                        ).poppins,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 90.h),
                        child: Row(
                          children: [
                            Image.asset(
                              ImageConstant.calendarIcon,
                              width: 25.h,
                              height: 25.h,
                            ),
                            Text(
                              "4 Oct",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.fSize,
                                  fontWeight: FontWeight.w200
                              ).poppins,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.h),
                  child: Icon(
                    Icons.radio_button_unchecked,
                    color: Color(0XFFBA83DE),
                    size: 25.h,
                  ),
                )
              ],
            ),
          ),
        ],
      ),

    ],
  );
}

Widget _buildTomorrowsTasksList(BuildContext context){
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tomorrows Task",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.fSize,
                  fontWeight: FontWeight.w400
              ).poppins,
            ),
            Text(
              "See All",
              style: TextStyle(
                color: Color(0XFFBA83DE),
                fontSize: 16.fSize,
                fontWeight: FontWeight.w400,
              ).poppins,
            ),
          ],
        ),
        SizedBox(height: 12.h,),
        Stack(
          children: [
            Container(
              width: 15.h,
              height: 79.6.h,
              decoration: BoxDecoration(
                  color: Color(0XFFFACBBA),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.h),
                      topLeft: Radius.circular(8.h)
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.h),
              width: double.maxFinite,
              height: 80.h,
              decoration: BoxDecoration(
                  color: Color(0XFF1F1F1F),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8.h),
                      topRight: Radius.circular(8.h)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.h,top: 15.h),
                    child: Column(
                      children: [
                        Text(
                          "Website Research",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.fSize,
                            fontWeight: FontWeight.w300,
                          ).poppins,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 100.h),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageConstant.calendarIcon,
                                width: 25.h,
                                height: 25.h,
                              ),
                              Text(
                                "5 Oct",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.fSize,
                                    fontWeight: FontWeight.w200
                                ).poppins,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.h),
                    child: Icon(
                      Icons.radio_button_unchecked,
                      color: Color(0XFFBA83DE),
                      size: 25.h,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h,),
        Stack(
          children: [
            Container(
              width: 15.h,
              height: 79.6.h,
              decoration: BoxDecoration(
                  color: Color(0XFFD7F0FF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.h),
                      topLeft: Radius.circular(8.h)
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.h),
              width: double.maxFinite,
              height: 80.h,
              decoration: BoxDecoration(
                  color: Color(0XFF1F1F1F),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8.h),
                      topRight: Radius.circular(8.h)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.h,top: 15.h),
                    child: Column(
                      children: [
                        Text(
                          "Prepare Wireframe For Main Flow",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.fSize,
                            fontWeight: FontWeight.w300,
                          ).poppins,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 230.h),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageConstant.calendarIcon,
                                width: 25.h,
                                height: 25.h,
                              ),
                              Text(
                                "5 Oct",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.fSize,
                                    fontWeight: FontWeight.w200
                                ).poppins,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.h),
                    child: Icon(
                      Icons.radio_button_unchecked,
                      color: Color(0XFFBA83DE),
                      size: 25.h,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h,),
        Stack(
          children: [
            Container(
              width: 15.h,
              height: 79.6.h,
              decoration: BoxDecoration(
                  color: Color(0XFFFACBBA),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.h),
                      topLeft: Radius.circular(8.h)
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.h),
              width: double.maxFinite,
              height: 80.h,
              decoration: BoxDecoration(
                  color: Color(0XFF1F1F1F),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8.h),
                      topRight: Radius.circular(8.h)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.h,top: 15.h),
                    child: Column(
                      children: [
                        Text(
                          "Prepare Screens",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.fSize,
                            fontWeight: FontWeight.w300,
                          ).poppins,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 90.h),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageConstant.calendarIcon,
                                width: 25.h,
                                height: 25.h,
                              ),
                              Text(
                                "5 Oct",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.fSize,
                                    fontWeight: FontWeight.w200
                                ).poppins,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.h),
                    child: Icon(
                      Icons.radio_button_unchecked,
                      color: Color(0XFFBA83DE),
                      size: 25.h,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


