import 'package:flutter/material.dart';

String text = '';
showPopUp(
    BuildContext context,
    String title,
    String hintText,
    VoidCallback  onPressed,
    String buttonText,
    TextEditingController controller) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: Container(
          decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: 80,
          child: Container(
            height: 50,
            // decoration: BoxDecoration(
            //     border: Border(top: BorderSide(color: Colors.grey))),
            child: Column(
              children: [
                TextFormField(
                  textDirection: TextDirection.rtl,
                  controller: controller,
                  decoration: InputDecoration(
                    hintTextDirection:TextDirection.rtl ,
                    hintText: hintText,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // print('object');
                        text = controller.text;
                        onPressed();
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            buttonText,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      width: 1,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        //  width: ,
                        child: Center(
                          child: Text(
                            'اغلاق',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
}
