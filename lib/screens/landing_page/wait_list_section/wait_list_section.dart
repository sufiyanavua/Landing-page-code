import 'package:avua/core/color_constants.dart';
import 'package:avua/core/constants.dart';
import 'package:avua/logic/save_email/save_email_bloc.dart';
import 'package:avua/screens/landing_page/widget/notify_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final formKey = GlobalKey<FormState>();

class WaitListSection extends StatelessWidget {
  WaitListSection({
    super.key,
    required this.width,
  });
  final TextEditingController emailController = TextEditingController();
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightOfContainer(),
      width: double.infinity,
      color: ColorConstant.creamColor,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width < 770 ? 20 : 100,
            vertical: 10,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: width < 1440 ? 0 : (width - 1440) / 2,
              right: width < 1440 ? 0 : (width - 1440) / 2,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: width >= 770
                      ? 100
                      : width == 769 && width <= 640
                          ? 150
                          : width >= 410
                              ? 100
                              : 100,
                  width: width >= 1440
                      ? 1000
                      : width >= 770
                          ? width * 0.6
                          : width,
                  child: SelectionArea(
                    child: Text(
                      "Exciting things are underway! Join our waiting list and be the first to be notified once we launch",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width >= 770 ? 24 : 20,
                      ),
                    ),
                  ),
                ),
                if (width >= 550) SizeConstants.height10,
                FittedBox(
                  key: formKey,
                  child: Form(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(
                        width >= 770 ? 10 : 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            // color: Colors.amber,
                            width: width <= 550 ? width * 0.5 : width * 0.4,
                            // padding: const EdgeInsets.only(bottom: 5),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: "Enter Your Email",
                                  hintStyle: TextStyle(
                                      fontSize: width <= 550 ? 14 : 18),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    bottom: width <= 550 ? 5 : 5,
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (emailController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please Enter Email',
                                    ),
                                  ),
                                );
                              } else if (!RegExp(
                                      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$')
                                  .hasMatch(emailController.text)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please Enter Valid Email'),
                                  ),
                                );
                              } else {
                                BlocProvider.of<SaveEmailBloc>(context).add(
                                    SentMail(
                                        email: emailController.text,
                                        context: context));

                                emailController.clear();
                              }
                            },
                            child: const NotifyButton(),
                          ),
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
    );
  }

  double heightOfContainer() {
    double containerHeight = width >= 770 ? 300 : 250;
    return containerHeight;
  }
}
