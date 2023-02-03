import 'package:erb_system/size_config.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../resources/assets_manager.dart';
import 'components/deafult_dorp_down.dart';

class DropDownList extends StatelessWidget {
  DropDownList({Key? key}) : super(key: key);

  List<String> title = [
    'المخازن',
    'الموردين',
    'اداره الاصناف',
    'المشتريات',
    'التصنيع',
    'اداره الشحن',
    'التقارير',
    'الحسابات',
    'اداره النظام',
    'HR',
    'الايصالات و الاذونات',
  ];
  List<String> image = [
    ImageAssets.iconDropDown3,
    ImageAssets.iconDropDown4,
    ImageAssets.iconDropDown5,
    ImageAssets.iconDropDown7,
    ImageAssets.iconDropDown8,
    ImageAssets.iconDropDown9,
    ImageAssets.iconDropDown10,
    ImageAssets.iconDropDown11,
    ImageAssets.iconDropDown12,
    ImageAssets.iconDropDown13,
    ImageAssets.iconDropDown14,
  ];
  List taps = [
    ['اضافه مخزن ', 'المخازن', ' تحويلات بين المخازن'],
    ['اضافه مورد ', 'اضافه فئه الموردين', 'فئات الموردين', "الموردين"],
    [
      'اضافه صنف ',
      'الاصناف',
      'اضافه وحده القياس',
      "وحدات القياس",
      "فروع الانتاج"
    ],
    ['اضافه فاتوره مشتريات ', 'فواتير المشتريات'],
    [
      'اضافه وصفه ',
      'وصفات التصنيع',
      "تأكيد امر التصنيع",
      "اوامر التصنيع",
      "الاضافات الخاصه"
    ],
    [
      'اضافه طلب ',
      'الطلبات',
      "شركات الشحن و المندوبين",
      "فئات المنتجات المطلوبه",
      "مصادر الطلبات",
      "طرق الشحن",
      "خطوط الشحن"
    ],
    [
      'قائمه الدخل',
      "ميزان المراجعه",
      "قائمه المركز المالي",
      "تقرير المشتريات",
      "تقرير مبيعات المنتجات",
      "تقرير المخزون",
      "تقرير ربحيه الصنف",
      "تقرير شركات الشحن"
    ],
    [
      'اضافه مصروف',
      'المصروفات',
      'انواع المصروفات',
      'البنوك و الخزينه و وسائل الدفع',
      'اضافه ايراد اخر',
      'الايرادات الاخري',
      'الاصول',
      'اضافه اصل',
      'الخصومات و الالتزامات',
      'اضافه التزام',
      'العملاء الشركات',
      'العملاء الافراد',
      'العهد',
      'صرف العهد',
    ],
    ['اضافه مستخدم', "المستخدمين", "الصلاحيات", "تتبع المستخدمين"],
    ['اضافه موظف', "الموظفين", "صرف المرتبات", "كشف المرتبات", "صرف سلف"],
    [
      'اذن استيلام',
      "ايصال استيلام شيك",
      "ايصال استيلام نقديه",
      "عرض سعر مبيعات",
      "عروض الاسعار",
      "تكويد الطلبات",
      "سند تسليم الطلبات",
      "طباعه فواتير الطلبات"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            onTap: () {
              QR.to('/home');
              DateTime now = DateTime.now();
              String convertedDateTime =
                  "${now.year.toString()}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}";
              //print(convertedDateTime);
            },
            trailing: Image.asset(ImageAssets.iconDropDown2),
            title: Center(
              child: MediaQuery.of(context).size.width < 1500
                  ? const Text(' ')
                  : Text(
                'الرئيسيه',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(5),
                    color: Colors.white),
              ),
            ),
            leading: Container(
              width: 2,
            )),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) => DefaultDropDown(
              item: taps[index],
              title: title[index],
              imageUrl: image[index],
              leading: Image.asset(
                "assets/images/15.png",
              ),
              trailing: Image.asset(image[index]),
              index: index,
            ),
            itemCount: 11,
          ),
        ),
      ],
    );
  }
}