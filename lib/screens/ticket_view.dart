import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/layout_builder_widget.dart';
import 'package:booktickets/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return SizedBox(
      width:
          size.width * 0.85, //para que no ocupe el 100% del ancho, sino el 85%
      //height: 200,
      // height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 167 : 169),
      height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 170 : 172),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        //esta es la card completa del ticket
        child: Column(children: [
          /**
           * showing the blue part of the card
           */
          Container(
            decoration: BoxDecoration(
                color: isColor == null ? const Color(0xff526799) : Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppLayout.getHeight(21)),
                    topRight: Radius.circular(AppLayout.getHeight(21)))),
            padding: EdgeInsets.all(
                AppLayout.getHeight(16)), //padding general para toda la card
            child: Column(//para que quede un row abajo del otro
                children: [
              Row(
                children: [
                  Text(
                    ticket['from']['code'],
                    style: isColor == null
                        ? Styles.headlineStyle3.copyWith(color: Colors.white)
                        : Styles.headlineStyle3,
                  ),
                  //const Spacer(),
                  Expanded(child: Container()),
                  const ThickContainer(
                    isColor: true,
                  ),
                  //const Spacer(),
                  Expanded(
                      child: Stack(
                    children: [
                      SizedBox(
                        height: AppLayout.getHeight(24),
                        child: const AppLayoutBuilderWidget(sections: 6),
                        // child: LayoutBuilder(
                        //   builder: (BuildContext context,
                        //       BoxConstraints constraints) {
                        //     print(
                        //         "the width is ${constraints.constrainWidth()}"); //obtenemos el ancho automatico del sizedbox
                        //     return Flex(
                        //       direction: Axis.horizontal,
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: List.generate(
                        //           (constraints.constrainWidth() / 6).floor(),
                        //           (index) => SizedBox(
                        //                 width: 3,
                        //                 height: 1,
                        //                 child: DecoratedBox(
                        //                   decoration: BoxDecoration(
                        //                       color: isColor == null
                        //                           ? Colors.white
                        //                           : Colors.grey.shade300),
                        //                 ),
                        //               )),
                        //     );
                        //   },
                        // ),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: 1.5,
                          child: Icon(
                            Icons.local_airport_rounded,
                            color: isColor == null
                                ? Colors.white
                                : const Color(0xff8accf7),
                          ),
                        ),
                      ),
                    ],
                  )),

                  const ThickContainer(
                    isColor: true,
                  ),
                  //const Spacer(),
                  Expanded(child: Container()),
                  Text(
                    ticket['to']['code'],
                    style: isColor == null
                        ? Styles.headlineStyle3.copyWith(color: Colors.white)
                        : Styles.headlineStyle3,
                  )
                ],
              ),
              const Gap(3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: AppLayout.getWidth(100),
                    child: Text(
                      ticket['from']['name'],
                      style: isColor == null
                          ? Styles.headlineStyle4.copyWith(color: Colors.white)
                          : Styles.headlineStyle4,
                    ),
                  ),
                  Text(
                    ticket['flying_time'],
                    style: isColor == null
                        ? Styles.headlineStyle4.copyWith(color: Colors.white)
                        : Styles.headlineStyle4,
                  ),
                  SizedBox(
                    width: AppLayout.getWidth(100),
                    child: Text(
                      ticket['to']['name'],
                      textAlign: TextAlign.end,
                      style: isColor == null
                          ? Styles.headlineStyle4.copyWith(color: Colors.white)
                          : Styles.headlineStyle4,
                    ),
                  ),
                ],
              ),
            ]),
          ),

          /**
         * showing the orange part of the card
         * 
         */
          Container(
            //color: const Color(0xfff37867),
            color: isColor == null ? Styles.orangeColor : Colors.white,
            child: Row(children: [
              SizedBox(
                height: AppLayout.getHeight(20),
                width: AppLayout.getWidth(10),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: isColor == null
                            ? Colors.grey.shade200
                            : Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)))),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            (constraints.constrainWidth() / 15).floor(),
                            (index) => SizedBox(
                                  width: 5,
                                  height: 1,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: isColor == null
                                          ? Colors.white
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                                )));
                  },
                ),
              )),
              SizedBox(
                height: 20,
                width: 10,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: isColor == null
                            ? Colors.grey.shade200
                            : Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)))),
              )
            ]),
          ),
          /**
           * bottom part of the orange card/ticket
           */
          Container(
            decoration: BoxDecoration(
                color: isColor == null ? Styles.orangeColor : Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                    bottomRight: Radius.circular(isColor == null ? 21 : 0))),
            //padding: const EdgeInsets.all(16),
            padding:
                const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(
                      firstText: ticket['date'],
                      secondText: "Date",
                      alignment: CrossAxisAlignment.start,
                      isColor: isColor,
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       ticket['date'],
                    //       style: isColor == null
                    //           ? Styles.headlineStyle3
                    //               .copyWith(color: Colors.white)
                    //           : Styles.headlineStyle3,
                    //     ),
                    //     const Gap(5),
                    //     Text(
                    //       "Date",
                    //       style: isColor == null
                    //           ? Styles.headlineStyle4
                    //               .copyWith(color: Colors.white)
                    //           : Styles.headlineStyle4,
                    //     )
                    //   ],
                    // ),
                    AppColumnLayout(
                      firstText: ticket['departure_time'],
                      secondText: "Departure time",
                      alignment: CrossAxisAlignment.center,
                      isColor: isColor,
                    ),
                    //  Column(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       ticket['departure_time'],
                    //       style: isColor == null
                    //           ? Styles.headlineStyle3
                    //               .copyWith(color: Colors.white)
                    //           : Styles.headlineStyle3,
                    //     ),
                    //     const Gap(5),
                    //     Text(
                    //       "Departure time",
                    //       style: isColor == null
                    //           ? Styles.headlineStyle4
                    //               .copyWith(color: Colors.white)
                    //           : Styles.headlineStyle4,
                    //     )
                    //   ],
                    // ),
                    AppColumnLayout(
                      firstText: "${ticket['number']}",
                      secondText: "Number",
                      alignment: CrossAxisAlignment.end,
                      isColor: isColor,
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: [
                    //     Text(
                    //       "${ticket['number']}",
                    //       style: isColor == null
                    //           ? Styles.headlineStyle3
                    //               .copyWith(color: Colors.white)
                    //           : Styles.headlineStyle3,
                    //     ),
                    //     const Gap(5),
                    //     Text(
                    //       "Number",
                    //       style: isColor == null
                    //           ? Styles.headlineStyle4
                    //               .copyWith(color: Colors.white)
                    //           : Styles.headlineStyle4,
                    //     )
                    //   ],
                    // )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
