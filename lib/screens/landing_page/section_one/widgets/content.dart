import 'package:avua/core/constants.dart';
import 'package:avua/logic/save_email/save_email_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/notify_button.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.width,
  });

  final double width;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    return SizedBox(
      // color: Colors.amber,
      width: width >= 1440
          ? 700
          : width >= 910
              ? width * 0.45
              : width >= 810
                  ? width * 0.43
                  : width >= 770
                      ? width * 0.403
                      : width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectionArea(
            child: Text(
              "Redefining Hiring",
              style: TextStyle(
                fontSize: width >= 1440
                    ? 65
                    : width >= 770
                        ? width * 0.04
                        : width * 0.08,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            // color: Colors.red,
            width: width >= 1440
                ? 350
                : width >= 770
                    ? width * 0.3
                    : width * 0.8,
            child: SelectionArea(
              child: Text(
                "Innovating with DeepTech AI Technology",
                style: TextStyle(
                  fontSize: width >= 1440
                      ? 24
                      : width >= 770
                          ? width * 0.02
                          : width * 0.06,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          if (width >= 770)
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(
                width >= 770 ? 10 : 5,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: formKey,
                    child: SizedBox(
                      // color: Colors.amber,
                      width: width >= 1440
                          ? 450
                          : width >= 810
                              ? width * 0.3
                              : width >= 770
                                  ? width * 0.27
                                  : width * 0.28,
                      // padding: const EdgeInsets.only(bottom: 5),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Enter Your Email",
                            hintStyle:
                                TextStyle(fontSize: width <= 550 ? 14 : 18),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 20,
                              bottom: width <= 550 ? 0 : 10,
                            )),
                      ),
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
                        BlocProvider.of<SaveEmailBloc>(context).add(SentMail(
                            email: emailController.text, context: context));

                        emailController.clear();
                      }
                    },
                    child: const NotifyButton(),
                  ),
                ],
              ),
            ),
          SizeConstants.height30
        ],
      ),
    );
  }
}
