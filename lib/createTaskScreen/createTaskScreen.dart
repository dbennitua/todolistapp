import 'package:flutter/material.dart';
import 'package:todolistapp/utils/utils.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todolistapp/routes/appRoutes.dart';

extension PoppinsExtension on TextStyle {
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

class createTaskScreen extends StatefulWidget {
  createTaskScreen({Key? key}) : super(key: key);

  static DateTime selectedDatesFromCalendar = DateTime.now();
  static TextEditingController nameInputController = TextEditingController();
  static TextEditingController descriptionInputController = TextEditingController();
  static TextEditingController startTimeInputController = TextEditingController();
  static TextEditingController endTimeInputController = TextEditingController();
  static bool isSelectedSwitch = false;
  static bool _isSelected = false;
  static bool _isSelected2 = false;
  static bool _isSelected3 = false;

  @override
  _createTaskScreenState createState() => _createTaskScreenState();
}

class _createTaskScreenState extends State<createTaskScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  final DateTime _firstDay = DateTime.now(); // Start date
  final DateTime _lastDay = DateTime.utc(2100, 12, 31); // End date

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
              child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 18.h,
                vertical: 18.h,
              ),
                child: Column(
                  children: [
                    SizedBox(height: 12.h, ),
                    _buildHeader(context),
                    SizedBox(height: 12.h, ),
                    _buildCalendarSection(context),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 30.h, ),
                            _buildSchedule(context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context){
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, appRoutes.HomeScreen);

            },
            child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Create new Task",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.fSize,
                    fontWeight: FontWeight.w400
                ).poppins,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarSection(BuildContext context) {
    return TableCalendar(
      firstDay: _firstDay,
      lastDay: _lastDay,
      focusedDay: _focusedDay,
      calendarFormat: CalendarFormat.week,
      startingDayOfWeek: StartingDayOfWeek.monday,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      headerStyle: HeaderStyle(
        formatButtonVisible: false, // Disable the format button
        titleCentered: true, // Title is centered
        leftChevronIcon: Icon(
          Icons.keyboard_arrow_left,
          color: Color(0XFFBA83DE),
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: Color(0XFFBA83DE),
        ),
        headerPadding: EdgeInsets.symmetric(vertical: 10.0),
        titleTextFormatter: (date, locale) {
          return DateFormat('dd MMMM, EEEE', "en_US").format(_focusedDay);
        },
        titleTextStyle: TextStyle(
          color: Color(0XFFBA83DE),
          fontSize: 20.0.fSize,
          fontWeight: FontWeight.w400,
        ).poppins,
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Color(0XFFBA83DE),
          shape: BoxShape.circle
        ),
        todayDecoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(
          color: Color(0XFFBA83DE),
          fontWeight: FontWeight.w400,
        ).inter,
        defaultTextStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ).inter,
      ),
    );
  }

  Widget _buildSchedule(BuildContext context){
    TimeOfDay? _currentTime = TimeOfDay.now();
    TimeOfDay? selectedTime;
    String _formattedCurrentTIme2 = _currentTime.hour.toString().padLeft(2, '0') + ' : ' + _currentTime.minute.toString().padLeft(2, '0') + '' + (_currentTime.hour >= 12 ? 'PM' : 'AM');
   String _formattedCurrentTIme = _currentTime.hour.toString().padLeft(2, '0') + ' : ' + _currentTime.minute.toString().padLeft(2, '0') + '' + (_currentTime.hour >= 12 ? 'PM' : 'AM');
    return StatefulBuilder(
      builder: (context,setState) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               "Schedule",
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 20.fSize,
                 fontWeight: FontWeight.w400
               ).poppins,
              ),
              SizedBox(height:8.h),
              TextFormField(
                focusNode: FocusNode(),
                autofocus: true,
                controller: createTaskScreen.nameInputController,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 13.fSize,
                  fontWeight: FontWeight.w300
                ).poppins,
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 13.fSize,
                    fontWeight: FontWeight.w300
                  ).poppins,
                  filled: true,
                  fillColor: Color(0XFF181818),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.h),
                    borderSide: BorderSide.none
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.0.h,
                    horizontal: 10.0.h,
                  ),
                ),
              ),
              SizedBox(height:8.h),
              Container(
                height: 105.0.h,
                child: TextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: createTaskScreen.descriptionInputController,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 13.fSize,
                      fontWeight: FontWeight.w300
                  ).poppins,
                  decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 13.fSize,
                        fontWeight: FontWeight.w300
                    ).poppins,
                    filled: true,
                    fillColor: Color(0XFF181818),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.h),
                        borderSide: BorderSide.none
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 100.0.h,
                      horizontal: 10.0.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height:28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start Time",
                          style: TextStyle(
                          color: Colors.white,
                            fontSize: 20.fSize,
                            fontWeight: FontWeight.w400
                          ).poppins,
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () async {
                              selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.dark().copyWith(
                                      timePickerTheme: TimePickerThemeData(
                                        backgroundColor: Color(0XFF181818),
                                        hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
                                        states.contains(MaterialState.selected)
                                            ? Color(0XFF181818) // Selected background
                                            : Colors.white),
                                        hourMinuteColor: MaterialStateColor.resolveWith((states) =>
                                        states.contains(MaterialState.selected)
                                            ? Color(0XFFBA83DE) // Selected background
                                            : Color(0XFF242424)), // Unselected background
                                        hourMinuteShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        dialHandColor: Colors.white,
                                        dialBackgroundColor: Color(0XFF242424),
                                        dayPeriodTextColor: MaterialStateColor.resolveWith((states) =>
                                        states.contains(MaterialState.selected)
                                            ? Colors.black // Text color when selected
                                            : Colors.white), // Text color when not selected
                                        dayPeriodColor: MaterialStateColor.resolveWith((states) =>
                                        states.contains(MaterialState.selected)
                                            ? Color(0XFFBA83DE) // Selected background
                                            : Color(0XFF242424)), // Unselected background
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (selectedTime != null) {
                                setState((){
                                  _formattedCurrentTIme = "${selectedTime?.format(context)}";
                                });
                              }
                            },
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Color(0XFF181818),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time_rounded,
                                    color: Color(0XFFBA83DE),
                                  ),
                                  SizedBox(width: 7.h,),
                                  Text(
                                    "${_formattedCurrentTIme}",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.h,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "End Time",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.fSize,
                              fontWeight: FontWeight.w400
                          ).poppins,
                        ),
                        Container(
                          child: GestureDetector(
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Color(0XFF181818),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time_rounded,
                                    color: Color(0XFFBA83DE),
                                  ),
                                  SizedBox(width: 7.h,),
                                  Text(
                                    "${_formattedCurrentTIme2}",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () async {
                              TimeOfDay? selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.dark().copyWith(
                                      timePickerTheme: TimePickerThemeData(
                                        backgroundColor: Color(0XFF181818),
                                        hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
                                        states.contains(MaterialState.selected)
                                            ? Color(0XFF181818) // Selected background
                                            : Colors.white),
                                        hourMinuteColor: MaterialStateColor.resolveWith((states) =>
                                        states.contains(MaterialState.selected)
                                            ? Color(0XFFBA83DE) // Selected background
                                            : Color(0XFF242424)), // Unselected background
                                        hourMinuteShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        dialHandColor: Colors.white,
                                        dialBackgroundColor: Color(0XFF242424),
                                        dayPeriodTextColor: MaterialStateColor.resolveWith((states) =>
                                        states.contains(MaterialState.selected)
                                            ? Colors.black // Text color when selected
                                            : Colors.white), // Text color when not selected
                                        dayPeriodColor: MaterialStateColor.resolveWith((states) =>
                                        states.contains(MaterialState.selected)
                                            ? Color(0XFFBA83DE) // Selected background
                                            : Color(0XFF242424)), // Unselected background
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if(selectedTime != null){
                                setState((){
                                  _formattedCurrentTIme2 = "${selectedTime?.format(context)}";
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h,),
              _buildPriority(context),
              SizedBox(height: 15.h,),
              _buildAlertBtn(context),
              SizedBox(height: 15.h,),
              _buildCreateTaskBtn(context)
            ],
          ),
        );
      }
    );
  }

  Widget _buildPriority(BuildContext context) {
    String selectedPriority = ''; // THIS IS A GLOBAL VARIABLE THAT I'LL USE TO SET THE STATE, RIGHT NOW IT IS EMPTY;

    return StatefulBuilder(
      builder: (context, setState) {
        //A FUNCTION TO SET THE STATE
        void setPriority(String priority) {
          setState(() {
            selectedPriority = (selectedPriority == priority) ? '' : priority;
            /* THIS TOGGLES SELECTION LOGICALLY: SELECTED PRIORITY == PRIORITY WILL RETURN TRUE IF THE PRIORITY PARAMETER HASN'T RECEIVED AN ARGUMENT
               HENCE IT ASSIGNS STILL AN EMPTY VALUE '' TO SELECTEDPRIORITY BUT IF IT RETURNS FALSE THEN THE VALUE ASSIGNED TO PRIORITY WILL BE PASSED TO THE SELECTEDPRIORITYVARIABLE
               NOW WHERE IS THE PRIORITY PARAMETER GONNA BE PASSED AN ARGUMENT?
            */
          });
        }

        //THIS FUNCTION IS CREATING A BUTTON TEMPLATE FOR OUR BUTTONS, IT'S GONNA ACCEPT A LABEL AND A COLOR FOR THE BUTTON
        Widget priorityButton(String label, Color color) {
          final bool isSelected = selectedPriority == label; // IF SELECTEDPRIORITY IS STILL EMPTY AND LABEL IS STILL EMPTY THIS WILL EVALUATE TO TRUE AND STORE IN THE ISSELECTED VARIABLE, IF NOT IT'LL STORE AS FALSE MEANING A LABEL HAS BEEN PASSED

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setPriority(label); // ON TAPPING ANY CONTAINER IT AUTOMATICALLY PASSES THE LABEL VALUE AS AN ARGUMENT TO THE SETPRIORITY(PRIORITY) FUNCTION WE DECLEARED ABOVE
              },
              //BUTTON DYNAMIC STYLING
              child: Container(
                height: 30.h,
                decoration: BoxDecoration(
                  color: isSelected ? color : Colors.transparent, // ONCE A LABEL IS PASSED ISSELECTED BECOMES FALSE, SIGNIFYING THAT A BTN HAS BEEN SELECTED, AS A RESULT THE BACKGROUND COLOR CHANGES FROM TRANSPARENT TO THE SPECIFIED COLOR FROM THE ARGUMENT PASSED TO THE COLOR PARAMETER
                  border: Border.all(color: color),
                  borderRadius: BorderRadius.circular(3.h),
                ),
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13.fSize,
                    color: isSelected ? Colors.black : Colors.white, // SAME THING WITH THE BACKGROUND COLOR HAPPENS TO THE TEXT COLOR
                    fontWeight: FontWeight.w400,
                  ).poppins,
                ),
              ),
            ),
          );
        }

        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Priority",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.fSize,
                  fontWeight: FontWeight.w400,
                ).poppins,
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //HERE WE CALL THE BTN FUNCTIONS WHERE WE'VE CREATED A CUSTOM STYLING FOR THE BTN'S, AND WRITTEN OUR LOGIC FOR SELECTIONS. NOW WE PASS IN THE NECESSARY ARGUMENTS
                  priorityButton("High", Color(0XFFFACBBA)),
                  SizedBox(width: 12.h),
                  priorityButton("Medium", Color(0XFFFD7F0FF)),
                  SizedBox(width: 12.h),
                  priorityButton("Low", Color(0XFFFAD9FF)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


  // Widget _buildPriority(BuildContext context){
  //   return StatefulBuilder(
  //     builder: (context, setState) {
  //       return SizedBox(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Priority",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20.fSize,
  //                 fontWeight: FontWeight.w400
  //               ).poppins,
  //             ),
  //             SizedBox(height: 8.h,),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Expanded(child: _highBtn(context)),
  //                 SizedBox(width: 12.h,),
  //                 Expanded(child: _mediumBtn(context)),
  //                 SizedBox(width: 12.h,),
  //                 Expanded(child: _lowBtn(context)),
  //               ],
  //             )
  //           ],
  //         ),
  //       );
  //     }
  //   );
  // }
  //
  // Widget _mediumBtn(BuildContext context){
  //   return StatefulBuilder(
  //       builder: (context,setState) {
  //         return SizedBox(
  //           child:  Expanded(
  //             child: GestureDetector(
  //               onTap: (){
  //                 if(createTaskScreen._isSelected2 == false || (createTaskScreen._isSelected == true || createTaskScreen._isSelected3 == true)){
  //                   setState((){
  //                     createTaskScreen._isSelected2 = true;
  //                   });
  //                 }else{
  //                   setState((){
  //                     createTaskScreen._isSelected2 = false;
  //                   });
  //                 }
  //               },
  //               child: Container(
  //                 height: 30.h,
  //                 child: Text(
  //                   "Medium",
  //                   style: TextStyle(
  //                     fontSize: 13.fSize,
  //                     color: createTaskScreen._isSelected2 ? Colors.black : Colors.white,
  //                     fontWeight: FontWeight.w400,
  //                   ).poppins,
  //                 ),
  //                 decoration: BoxDecoration(
  //                   color: createTaskScreen._isSelected2 ? Color(0XFFFD7F0FF) : Colors.transparent,
  //                   border: Border.all(
  //                     color: Color(0XFFFD7F0FF),
  //                   ),
  //                   borderRadius: BorderRadius.circular(3.h),
  //                 ),
  //                 alignment: Alignment.center,
  //               ),
  //             ),
  //           ),
  //         );
  //       }
  //   );
  // }
  //
  // Widget _lowBtn(BuildContext context){
  //   return StatefulBuilder(
  //       builder: (context,setState) {
  //         return SizedBox(
  //           child:  Expanded(
  //             child: GestureDetector(
  //               onTap: (){
  //                 if(createTaskScreen._isSelected3 == false || (createTaskScreen._isSelected == true || createTaskScreen._isSelected2 == true)){
  //                   createTaskScreen._isSelected2 = false;
  //                   createTaskScreen._isSelected = false;
  //                   setState((){
  //                     createTaskScreen._isSelected3 = true;
  //
  //                   });
  //                 }else{
  //                   setState((){
  //                     createTaskScreen._isSelected3 = false;
  //                   });
  //                 }
  //               },
  //               child: Container(
  //                 height: 30.h,
  //                 child: Text(
  //                   "Low",
  //                   style: TextStyle(
  //                     fontSize: 13.fSize,
  //                     color: createTaskScreen._isSelected3 ? Colors.black : Colors.white,
  //                     fontWeight: FontWeight.w400,
  //                   ).poppins,
  //                 ),
  //                 decoration: BoxDecoration(
  //                   color: createTaskScreen._isSelected3 ? Color(0XFFFAD9FF) : Colors.transparent,
  //                   border: Border.all(
  //                     color: Color(0XFFFAD9FF),
  //                   ),
  //                   borderRadius: BorderRadius.circular(3.h),
  //                 ),
  //                 alignment: Alignment.center,
  //               ),
  //             ),
  //           ),
  //         );
  //       }
  //   );
  // }
  //
  // Widget _highBtn(BuildContext context){
  //   return StatefulBuilder(
  //       builder: (context,setState) {
  //         return SizedBox(
  //           child:  Expanded(
  //             child: GestureDetector(
  //               onTap: (){
  //                 if(createTaskScreen._isSelected == false || (createTaskScreen._isSelected2 == true || createTaskScreen._isSelected3 == true)){
  //                   createTaskScreen._isSelected2 = false;
  //                   createTaskScreen._isSelected3 = false;
  //                   setState((){
  //                     createTaskScreen._isSelected = true;
  //
  //                   });
  //                 }else{
  //                   setState((){
  //                     createTaskScreen._isSelected = false;
  //                   });
  //                 }
  //               },
  //               child: Container(
  //                 height: 30.h,
  //                 child: Text(
  //                   "High",
  //                   style: TextStyle(
  //                     fontSize: 13.fSize,
  //                     color: createTaskScreen._isSelected ? Colors.black : Colors.white,
  //                     fontWeight: FontWeight.w400,
  //                   ).poppins,
  //                 ),
  //                 decoration: BoxDecoration(
  //                   color: createTaskScreen._isSelected ? Color(0XFFFACBBA) : Colors.transparent,
  //                   border: Border.all(
  //                     color: Color(0XFFFACBBA),
  //                   ),
  //                   borderRadius: BorderRadius.circular(3.h),
  //                 ),
  //                 alignment: Alignment.center,
  //               ),
  //             ),
  //           ),
  //         );
  //       }
  //   );
  // }

  
  Widget _buildAlertBtn(BuildContext context){
    return StatefulBuilder(
      builder: (context,setState) {
        return SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Get alert for this task",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.fSize,
                  fontWeight: FontWeight.w300
                ).poppins,
              ),
              FlutterSwitch(
                value: createTaskScreen.isSelectedSwitch,
                height: 26.h,
                width: 54.h,
                toggleSize: 20,
                borderRadius: 12.h,
                activeColor: Color(0XFFA378FF),
                activeToggleColor: Colors.white,
                onToggle: (value){
                  setState((){
                    createTaskScreen.isSelectedSwitch = value;
                  });
                }
              )
            ],
          ),
        );
      }
    );
  }

  Widget _buildCreateTaskBtn(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        alignment: Alignment.center,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.h),
          gradient: LinearGradient(
            colors: [
              Color(0XFFBA83DE),
              Color(0XFFDE83B0)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight
          )
        ),
        child: Text(
          "Create Task",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 15.fSize
          ).poppins,
        ),
      ),
    );
  }
}
