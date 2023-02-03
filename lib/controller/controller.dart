import 'package:erb_system/view/home/taps/home_tap.dart';
import 'package:flutter/cupertino.dart';

class Controller with ChangeNotifier {
  Widget current = HomeTap();
  String? id;
  String name = "ADMINS";
//
  List screen = [
    ['/addStore', '/Stores', '/Stores_transfer'],
    [
      '/AddSup',
      '/add_cat_sup',
      '/sup_cat',
      '/suppliers',
    ],
    ['/AddCats', '/Categories', '/AddNyotin', '/Nyotins', '/Production'],
    ['/add_purchase_bill', '/purchases', '/confirm_back_purchase'],
    [
      '/AddDescIndustry',
      '/IndustryDesc',
      '/ConfirmIndus',
      '/IndustryOrder',
      '/IndustrySpecialAddition',
    ],
    [
      '/AddOrderv',
      '/Talabat',
      '/companies_representatives',
      '/required_list',
      '/order_sources',
      '/shipping_methods',
      '/shipping_lines',
    ],
    [
      '/list_input',
      '/audit_pudget',
      '/Statement_financial_position',
      '/procurement_report',
      '/Product_sales_report',
      '/Stock_report',
      '/category_profitability_report',
      '/shipping_companies_report'
    ],
    [
      '/add_expenses',
      '/expenses',
      '/types_expenses',
      '/payment_home',
      '/add_revenue',
      '/other_revenue',
      '/origins',
      '/add_origins',
      '/discount_obligations',
      '/add_obligations',
      '/company_and_customer',
      '/individual_clients',
      '/covenant',
      '/pay_convenent'
    ],
    ['/add_user', '/users', '/permission', '/follow_users'],
    [
      '/add_employee',
      '/employees',
      '/payroll',
      '/account_statement_hr',
      '/advance_exchange'
    ],
    [
      '/Payment_permission',
      '/Check_receipt',
      '/Receipt_cash',
      '/Price_Quotation',
      '/Price_Quotation1',
      '/Coding_orders',
      '/Documentation_of_delivery_requests',
      '/order_bills',
      '/invoice'
    ]
  ];

  void changePage(Widget page) {
    current = page;
    notifyListeners();
  }
}