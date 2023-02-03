import 'package:erb_system/utils/search.dart';

List<String> governorates = [
  "الدقهلية",
  'الغردقة',
  'دمنهور',
  'الفيوم',
  'طنطا',
  'الإسكندرية',
  'الإسماعيلية',
  'الجيزة',
  'شبين الكوم',
  'المنيا',
  'القاهرة',
  'بنها',
  'الخارجة',
  'الزقازيق',
  'السويس',
  'أسوان',
  'أسيوط',
  'بني سويف',
  'بورسعيد',
  'دمياط',
  'الطور',
  'كفر الشيخ',
  'مرسى مطروح',
  'قنا',
  'شمال سيناء',
  'سوهاج',
  'حلوان',
  'مدينة 6 اكتوبر',
];

List<String> dataTable = [
  "",
  'طريقه الشحن',
  'موجل',
  'خط التوزيع',
  'شركه الشحن',
  'المدفوع',
  'اجمالي الفاتوره',
  'رقم التليفون',
  'اسم العميل',
  'المدينة',
  'المحافظة',
  'حالة الطلب',
  'نوع الطلب',
  'تاريخ الطلب',
  'رقم الطلب',
];
List<String> h = [
  'fff',
  'ww',
  'dd',
  'ee',
  'gg',
];
Future<List<String>> employeeMonths(String month) async {
  // print(month);
  employee[month] = await hrFilter(month);
  // print(month);
  List<String> names = [];
  for (var i = 0; i < employee[month]!.length; i++) {
    names.add(employee[month]![i]['name']);
  }
  // print(names);
  return names;
}

Future<Map<String, dynamic>> info(String name) async {
  Map<String, dynamic> employeeData = await hrNameFilter(name);
  print(employeeData['residual']);
  if (employeeData['residual'] == null) {
    print(true);
    return employeeData = {
      'residual': '',
      'salaryOrLoan': '',
      'totalSalary': '',
    };
  } else {
    return employeeData;
  }
}

void addEmployee(String month, List<Map<String, dynamic>> employees) {
  employee[month] = employees;
}

List<String>? governorateCities(String governorate) {
  return cities[governorate];
}

List<String> months = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
Map<String, List<Map<String, dynamic>>> employee = {
  '1': [],
  '2': [],
  '3': [],
  '4': [],
  '5': [],
  '6': [],
  '7': [],
  '8': [],
  '9': [],
  '10': [],
  '11': [],
  '12': [],
};
List<List<String>> cities2 = [
  ['1', '2', '3'],
  ['1', '2', '4'],
  ['1', '2', '5'],
  ['1', '2', '6'],
];
Map<String, List<String>> cities = {
  'الدقهلية': [
    '1 الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'الغردقة': [
    '2 الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'دمنهور': [
    '3 الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'الفيوم': [
    '4 الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'طنطا': [
    '5 الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'الإسكندرية': [
    '6 الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'الإسماعيلية': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'الجيزة': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'شبين الكوم': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'المنيا': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'القاهرة': [
    'Nasr City',
    'New Cairo',
    'Fifth settlement',
    'Madinaty',
    'El rehab',
    'Helioplis',
    'Ain Shams ',
    'Gesr El swes',
    'October',
    'AL Shikh Zayed',
    'Hadai2 AL ahram',
    'EL manial',
    'EL fostat',
    'Dokki',
    'Zamalek',
    'Shubra Masr',
    'Shubra el khema',
    'El marg',
    'El mataria',
    'Maadi',
    'Mokataam',
    'Zaiton',
    'EL Zawia',
    'EL amiria',
    'El sharabia',
    'Helwan',
    '15 May',
    'EL basatin',
    'EL tbin',
    'EL khalifa',
    'EL sayeda Zeynab',
    'Dar el salam',
    'Misr El qadima',
    'El salam',
    'EL nozha',
    'Faisal',
    'Haram',
    'Sherouk',
    'Mohandseen',
    'Hadai2 Elkoba',
    'Ebor',
    'garden city',
    'abbasya',
    'el zaher',
    'el monib',
    'helmya',
    'kasr el nile',
  ],
  'بنها': [
    'ا��دقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'الخارجة': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'الزقازيق': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'السويس': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'أسوان': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'أسيوط': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'بني سويف': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'بورسعيد': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'دمياط': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'الطور': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'كفر الشيخ': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'مرسى مطروح': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'قنا': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الف��وم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    '��لجيزة',
    'شبين الكو��',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'شمال سيناء': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'سوهاج': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'حلوان': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
  'مدينة 6 اكتوبر': [
    'الدقهلية',
    'الغردقة',
    'دمنهور',
    'الفيوم',
    'طنطا',
    'الإسكندرية',
    'الإسماعيلية',
    'الجيزة',
    'شبين الكوم',
    'المنيا',
    'القاهرة',
    'بنها',
    'الخارجة',
    'الزقازيق',
    'السويس',
    'أسوان',
    'أسيوط',
    'بني سويف',
    'بورسعيد',
    'دمياط',
    'الطور',
    'كفر الشيخ',
    'مرسى مطروح',
    'قنا',
    'شمال سيناء',
    'سوهاج',
    'حلوان',
    'مدينة 6 اكتوبر',
  ],
};