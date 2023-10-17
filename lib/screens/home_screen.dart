import 'package:booktickets/screens/hotel_screen.dart';
import 'package:booktickets/screens/ticket_view.dart';
import 'package:booktickets/utils/app_info_list.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/double_text_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffeeedf2),
      backgroundColor: Styles.bgColor,
      body: ListView(
        //para poder hacer scroll vertical
        children: [
          Container(
            // padding: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //dentro del primer row tenemos dos childrens
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: Styles.headlineStyle3,
                        ),
                        const Gap(5),
                        Text(
                          "Book Tickets",
                          style: Styles.headlineStyle1,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover, //para ajustar la imagen
                              image: AssetImage("assets/images/img_1.png"))),
                    )
                  ],
                ),
                const Gap(25),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xfff4f6fd),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_regular,
                          color: Color(0xffbfc205)),
                      const Gap(10),
                      Text(
                        "Search",
                        style: Styles.headlineStyle4,
                      )
                    ],
                  ),
                ),
                const Gap(40),
                const AppDoubleTextWidget(
                    bigText: "Upcoming Flights", smallText: "View all"),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Upcoming Flights",
                //       style: Styles.headlineStyle2,
                //     ),
                //     InkWell(
                //       onTap: () => {print("You are tapped")},
                //       child: Text(
                //         "View all",
                //         style: Styles.textStyle
                //             .copyWith(color: Styles.primaryColor),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          ),
          Gap(AppLayout.getHeight(15)),
          SingleChildScrollView(
            //this will have just one main child
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: ticketList
                  .map((singleTicket) => TicketView(
                        ticket: singleTicket,
                      ))
                  .toList(),
            ),
          ),
          Gap(AppLayout.getHeight(40)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const AppDoubleTextWidget(
                bigText: "Hotels", smallText: "View all"),
          ),
          Gap(AppLayout.getHeight(15)),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: hotelList
                    .map((singleHotel) => HotelScreen(hotel: singleHotel))
                    .toList(),
              )),
          Gap(AppLayout.getHeight(20)),
        ],
      ),
    );
  }
}
