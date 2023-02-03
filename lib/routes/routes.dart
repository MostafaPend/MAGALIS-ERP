import 'package:erb_system/routes/deferred_loader.dart';
import 'package:erb_system/view/accounts/add_%20revenue.dart'
deferred as add_revenue;
import 'package:erb_system/view/accounts/add_expenses.dart'
deferred as add_expenses;
import 'package:erb_system/view/accounts/add_obligations.dart'
deferred as add_obligations;
import 'package:erb_system/view/accounts/add_origins.dart'
deferred as add_origins;
import 'package:erb_system/view/accounts/company_and_customer.dart'
deferred as company_and_customer;
import 'package:erb_system/view/accounts/covenant.dart' deferred as covenant;
import 'package:erb_system/view/accounts/covenent_settlement.dart'
deferred as covenent_settlement;
import 'package:erb_system/view/accounts/customer_account_details.dart'
deferred as customer_account_details;
import 'package:erb_system/view/accounts/discount_obligations.dart'
deferred as discount_obligations;
import 'package:erb_system/view/accounts/expenses.dart' deferred as expenses;
import 'package:erb_system/view/accounts/individual_clients.dart'
deferred as individual_clients;
import 'package:erb_system/view/accounts/origins.dart' deferred as origins;
import 'package:erb_system/view/accounts/other_revenue.dart'
deferred as other_revenue;
import 'package:erb_system/view/accounts/pay_convenent.dart'
deferred as pay_convenent;
import 'package:erb_system/view/accounts/payment_home.dart'
deferred as payment_home;
import 'package:erb_system/view/accounts/payment_method/account_details.dart'
deferred as account_details;
import 'package:erb_system/view/accounts/types_expenses.dart'
deferred as types_expenses;
import 'package:erb_system/view/category/add_cat.dart' deferred as Addcat;
import 'package:erb_system/view/category/EditCat.dart' deferred as AddCats;
import 'package:erb_system/view/category/add_nyotin.dart' deferred as AddNyotin;
import 'package:erb_system/view/category/category.dart' deferred as Categories;
import 'package:erb_system/view/category/category.dart' deferred as category;
import 'package:erb_system/view/category/nyotins.dart' deferred as Nyotins;
import 'package:erb_system/view/category/production.dart'
deferred as Production;
import 'package:erb_system/view/home/homepage.dart';
import 'package:erb_system/view/hr/account_statement_hr.dart'
deferred as account_statement_hr;
import 'package:erb_system/view/hr/add_employee.dart' deferred as add_employee;
import 'package:erb_system/view/hr/advance_exchange.dart'
deferred as advance_exchange;
import 'package:erb_system/view/hr/employees.dart' deferred as employees;
import 'package:erb_system/view/hr/payroll.dart' deferred as payroll;
import 'package:erb_system/view/industry/add_desc_industry.dart'
deferred as AddDescIndustry;
import 'package:erb_system/view/industry/confirm_indus.dart'
deferred as ConfirmIndus;
import 'package:erb_system/view/industry/indus_orders.dart'
deferred as IndustryOrder;
import 'package:erb_system/view/industry/industry_desc.dart'
deferred as IndustryDesc;
import 'package:erb_system/view/industry/spechial_add_indus.dart'
deferred as IndustrySpecialAddition;
import 'package:erb_system/view/orders/account_statement.dart'
deferred as account_statement;
import 'package:erb_system/view/orders/add_company.dart'
deferred as add_company;
import 'package:erb_system/view/orders/add_orders.dart' deferred as AddOrderv;
import 'package:erb_system/view/orders/collection_order.dart'
deferred as CollectionOrder;
import 'package:erb_system/view/orders/collection_order_details.dart'
deferred as CollectionOrderDetails;
import 'package:erb_system/view/orders/companies_representatives.dart'
deferred as companies_representatives;
import 'package:erb_system/view/orders/confirm_order.dart'
deferred as ConfirmOrder;
import 'package:erb_system/view/orders/list _product/order_sources.dart'
deferred as order_sources;
import 'package:erb_system/view/orders/list _product/required_list.dart'
deferred as required_list;
import 'package:erb_system/view/orders/list _product/shipping_lines.dart'
deferred as shipping_lines;
import 'package:erb_system/view/orders/list _product/shipping_methods.dart'
deferred as shipping_methods;
import 'package:erb_system/view/orders/load_order.dart' deferred as LoadOrder;
import 'package:erb_system/view/orders/order_maintenance.dart'
deferred as OrderMaintenance;
import 'package:erb_system/view/orders/orders_details.dart' deferred as Talabat;
import 'package:erb_system/view/print/Check_receipt.dart'
deferred as Check_receipt;
import 'package:erb_system/view/print/Coding_orders.dart'
deferred as Coding_orders;
import 'package:erb_system/view/print/Documentation_of_delivery_requests.dart'
deferred as Documentation_of_delivery_requests;
import 'package:erb_system/view/print/Payment_permission.dart'
deferred as Payment_permission;
import 'package:erb_system/view/print/Price_Quotation.dart'
deferred as Price_Quotation;
import 'package:erb_system/view/print/Price_Quotation1.dart'
deferred as Price_Quotation1;
import 'package:erb_system/view/print/Receipt_cash.dart'
deferred as Receipt_cash;
import 'package:erb_system/view/print/invoice.dart' deferred as invoice;
import 'package:erb_system/view/print/order_bills.dart' deferred as order_bills;
import 'package:erb_system/view/print/print_takwid.dart'
deferred as print_takwid;
import 'package:erb_system/view/purchases/add_purchase_bill.dart'
deferred as add_purchase_bill;
import 'package:erb_system/view/purchases/confirm_back_purchase.dart'
deferred as confirm_back_purchase;
import 'package:erb_system/view/purchases/confirm_purchase.dart'
deferred as confirm_purchase;
import 'package:erb_system/view/purchases/purchases.dart' deferred as purchases;
import 'package:erb_system/view/reports/Product_sales_report.dart'
deferred as Product_sales_report;
import 'package:erb_system/view/reports/Statement_financial_position.dart'
deferred as Statement_financial_position;
import 'package:erb_system/view/reports/Stock_report.dart'
deferred as Stock_report;
import 'package:erb_system/view/reports/audit_pudget.dart'
deferred as audit_pudget;
import 'package:erb_system/view/reports/category_profitability_report.dart'
deferred as category_profitability_report;
import 'package:erb_system/view/reports/cost_goods_sold.dart'
deferred as cost_goods_sold;
import 'package:erb_system/view/reports/list_input.dart' deferred as list_input;
import 'package:erb_system/view/reports/payment_shoping.dart'
deferred as payment_shoping;
import 'package:erb_system/view/reports/procurement_report.dart'
deferred as procurement_report;
import 'package:erb_system/view/reports/revenue_details.dart'
deferred as revenue_details;
import 'package:erb_system/view/reports/shipping_companies_report.dart'
deferred as shipping_companies_report;
import 'package:erb_system/view/store/PO_fiper.dart' deferred as PO_fiper;
import 'package:erb_system/view/store/add_store.dart' deferred as store;
import 'package:erb_system/view/home/homepage.dart' deferred as home;
import 'package:erb_system/view/store/d1_fiper.dart' deferred as d1_fiper;
import 'package:erb_system/view/store/fiber_details.dart'
deferred as fiber_details;
import 'package:erb_system/view/store/mo4_details.dart' deferred as mo4_details;
import 'package:erb_system/view/store/mo_fiber.dart' deferred as mo_fiber;
import 'package:erb_system/view/store/po1_details.dart' deferred as po1_details;
import 'package:erb_system/view/store/store_dtails.dart'
deferred as store_dtails;
import 'package:erb_system/view/store/store_transfer/balance_modification.dart'
deferred as balance_modification;
import 'package:erb_system/view/store/store_transfer/damage_details_transfer.dart'
deferred as damage_details_transfer;
import 'package:erb_system/view/store/store_transfer/store_transfer.dart'
deferred as Stores_transfer;
import 'package:erb_system/view/store/store_transfer/transfer_material.dart'
deferred as transfer_material;
import 'package:erb_system/view/store/store_transfer/transfir_to_under_work.dart'
deferred as transfir_to_under_work;
import 'package:erb_system/view/store/stores.dart' deferred as stores;
import 'package:erb_system/view/suppliers/add_cat_sup.dart'
deferred as add_cat_sup;
import 'package:erb_system/view/suppliers/add_sup.dart' deferred as AddSup;
import 'package:erb_system/view/suppliers/cat_details.dart'
deferred as cat_details;
import 'package:erb_system/view/suppliers/sup_cat.dart' deferred as sup_cat;
import 'package:erb_system/view/suppliers/sup_money_details.dart'
deferred as sup_money_details;
import 'package:erb_system/view/suppliers/sup_pay.dart' deferred as sup_pay;
import 'package:erb_system/view/suppliers/suppliers.dart' deferred as suppliers;
import 'package:erb_system/view/system_admin/add_user.dart'
deferred as add_user;
import 'package:erb_system/view/system_admin/follow_user_details.dart'
deferred as follow_user_details;
import 'package:erb_system/view/system_admin/follow_users.dart'
deferred as follow_users;
import 'package:erb_system/view/system_admin/permission.dart'
deferred as permission;
import 'package:erb_system/view/system_admin/users.dart' deferred as users;
import 'package:qlevar_router/qlevar_router.dart';

import '../view/auth/login.dart';

//updated
class Routes {
  static final routes = <QRoute>[
    QRoute(path: '/', builder: () => const Login()),

    QRoute(
      path: '/home',
      builder: () => home.HomePage(),
      middleware: [
        DefferedLoader(home.loadLibrary),
      ],
    ),

    // route Store
    QRoute(
      path: '/addStore',
      builder: () => store.add_Stock(),
      middleware: [
        DefferedLoader(store.loadLibrary),
      ],
    ),

    QRoute(
      path: '/balance_modification',
      builder: () => balance_modification.ModificationBalance(),
      middleware: [
        DefferedLoader(balance_modification.loadLibrary),
      ],
    ),
    QRoute(
      path: '/damage_details_transfer',
      builder: () => damage_details_transfer.ExchangePart(),
      middleware: [
        DefferedLoader(damage_details_transfer.loadLibrary),
      ],
    ),


    QRoute(
      path: '/transfir_to_under_work',
      builder: () => transfir_to_under_work.transfer_to_under_work(),
      middleware: [
        DefferedLoader(transfir_to_under_work.loadLibrary),
      ],
    ),
    QRoute(
      path: '/transfer_material',
      builder: () => transfer_material.transfer_to_under_work(),
      middleware: [
        DefferedLoader(transfer_material.loadLibrary),
      ],
    ),

    QRoute(
      path: '/mo4_details',
      builder: () => mo4_details.MO4Details(),
      middleware: [
        DefferedLoader(mo4_details.loadLibrary),
      ],
    ),
    QRoute(
      path: '/mo_fiber',
      builder: () => mo_fiber.MODetails(),
      middleware: [
        DefferedLoader(mo_fiber.loadLibrary),
      ],
    ),
    QRoute(
      path: '/PO_fiper',
      builder: () => PO_fiper.POFiper(),
      middleware: [
        DefferedLoader(PO_fiper.loadLibrary),
      ],
    ),
    QRoute(
      path: '/d1_fiper',
      builder: () => d1_fiper.D1Details(),
      middleware: [
        DefferedLoader(d1_fiper.loadLibrary),
      ],
    ),
    QRoute(
      path: '/po1_details',
      builder: () => po1_details.PO1Details(),
      middleware: [
        DefferedLoader(po1_details.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Stores',
      builder: () => stores.Stock(),
      middleware: [
        DefferedLoader(stores.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Stores_transfer',
      builder: () => Stores_transfer.StoreTransfer(),
      middleware: [
        DefferedLoader(Stores_transfer.loadLibrary),
      ],
    ),
    QRoute(
      path: '/store_dtails',
      builder: () => store_dtails.StoreDetails(),
      middleware: [
        DefferedLoader(store_dtails.loadLibrary),
      ],
    ),

    //route supplier
    QRoute(
      path: '/AddSup',
      builder: () => AddSup.AddSup(),
      middleware: [
        DefferedLoader(AddSup.loadLibrary),
      ],
    ),

    QRoute(
      path: '/cat_details',
      builder: () => cat_details.CatDetails(),
      middleware: [
        DefferedLoader(cat_details.loadLibrary),
      ],
    ),
    QRoute(
      path: '/sup_cat',
      builder: () => sup_cat.SupCat(),
      middleware: [
        DefferedLoader(sup_cat.loadLibrary),
      ],
    ),
    QRoute(
      path: '/add_cat_sup',
      builder: () => add_cat_sup.AddSupCat(),
      middleware: [
        DefferedLoader(add_cat_sup.loadLibrary),
      ],
    ),
    QRoute(
      path: '/suppliers',
      builder: () => suppliers.Suppliers(),
      middleware: [
        DefferedLoader(suppliers.loadLibrary),
      ],
    ),


    // route category
    QRoute(
      path: '/AddCats',
      builder: () => AddCats.AddCats(),
      middleware: [
        DefferedLoader(AddCats.loadLibrary),
      ],
    ),

    // route category
    QRoute(
      path: '/addcat',
      builder: () => Addcat.AddCat(),
      middleware: [
        DefferedLoader(Addcat.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Categories',
      builder: () => Categories.Categories(),
      middleware: [
        DefferedLoader(Categories.loadLibrary),
      ],
    ),
    QRoute(
      path: '/AddNyotin',
      builder: () => AddNyotin.AddNyotin(),
      middleware: [
        DefferedLoader(AddNyotin.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Nyotins',
      builder: () => Nyotins.Nyotins(),
      middleware: [
        DefferedLoader(Nyotins.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Production',
      builder: () => Production.Production(),
      middleware: [
        DefferedLoader(Production.loadLibrary),
      ],
    ),
    QRoute(
      path: '/category',
      builder: () => category.Categories(),
      middleware: [
        DefferedLoader(category.loadLibrary),
      ],
    ),

    //route purchases
    QRoute(
      path: '/add_purchase_bill',
      builder: () => add_purchase_bill.AddPurchaseBill(),
      middleware: [
        DefferedLoader(add_purchase_bill.loadLibrary),
      ],
    ),
    QRoute(
      path: '/purchases',
      builder: () => purchases.Purchases(),
      middleware: [
        DefferedLoader(purchases.loadLibrary),
      ],
    ),

    QRoute(
      path: '/confirm_purchase',
      builder: () => confirm_purchase.ConfirmPurchase(),
      middleware: [
        DefferedLoader(confirm_purchase.loadLibrary),
      ],
    ),
    QRoute(
      path: '/confirm_back_purchase',
      builder: () => confirm_back_purchase.ConfirmBackPurchases(),
      middleware: [
        DefferedLoader(confirm_back_purchase.loadLibrary),
      ],
    ),

    //industry
    QRoute(
      path: '/AddDescIndustry',
      builder: () => AddDescIndustry.AddDescIndustry(),
      middleware: [
        DefferedLoader(AddDescIndustry.loadLibrary),
      ],
    ),
    QRoute(
      path: '/IndustryDesc',
      builder: () => IndustryDesc.IndustryDesc(),
      middleware: [
        DefferedLoader(IndustryDesc.loadLibrary),
      ],
    ),
    QRoute(
      path: '/ConfirmIndus',
      builder: () => ConfirmIndus.ConfirmIndus(),
      middleware: [
        DefferedLoader(ConfirmIndus.loadLibrary),
      ],
    ),
    QRoute(
      path: '/IndustryOrder',
      builder: () => IndustryOrder.IndustryOrder(),
      middleware: [
        DefferedLoader(IndustryOrder.loadLibrary),
      ],
    ),
    QRoute(
      path: '/IndustrySpecialAddition',
      builder: () => IndustrySpecialAddition.IndustrySpecialAddition(),
      middleware: [
        DefferedLoader(IndustrySpecialAddition.loadLibrary),
      ],
    ),

    // route orders
    //orders
    QRoute(
      path: '/AddOrderv',
      builder: () => AddOrderv.AddOrder(),
      middleware: [
        DefferedLoader(AddOrderv.loadLibrary),
      ],
    ),



    QRoute(
      path: '/Talabat',
      builder: () => Talabat.Talabat(),
      middleware: [
        DefferedLoader(Talabat.loadLibrary),
      ],
    ),

    QRoute(
      path: '/shipping_methods',
      builder: () => shipping_methods.ShippingMethods(),
      middleware: [
        DefferedLoader(shipping_methods.loadLibrary),
      ],
    ),

    QRoute(
      path: '/shipping_lines',
      builder: () => shipping_lines.OrderSources(),
      middleware: [
        DefferedLoader(shipping_lines.loadLibrary),
      ],
    ),
    QRoute(
      path: '/companies_representatives',
      builder: () => companies_representatives.companies_representatives(),
      middleware: [
        DefferedLoader(companies_representatives.loadLibrary),
      ],
    ),
    QRoute(
      path: '/add_company',
      builder: () => add_company.AddCompany(),
      middleware: [
        DefferedLoader(add_company.loadLibrary),
      ],
    ),


    QRoute(
      path: '/required_list',
      builder: () => required_list.RequiredList(),
      middleware: [
        DefferedLoader(required_list.loadLibrary),
      ],
    ),
    QRoute(
      path: '/LoadOrder',
      builder: () => LoadOrder.LoadOrder(),
      middleware: [
        DefferedLoader(LoadOrder.loadLibrary),
      ],
    ),
    QRoute(
      path: '/OrderShip',
      builder: () => OrderMaintenance.OrderShipment(),
      middleware: [
        DefferedLoader(OrderMaintenance.loadLibrary),
      ],
    ),
    QRoute(
      path: '/CollectionOrder',
      builder: () => CollectionOrder.CollectionOrder(),
      middleware: [
        DefferedLoader(CollectionOrder.loadLibrary),
      ],
    ),
    QRoute(
      path: '/CollectionOrderDetails',
      builder: () => CollectionOrderDetails.CollectionOrderDetails(),
      middleware: [
        DefferedLoader(CollectionOrderDetails.loadLibrary),
      ],
    ),
    QRoute(
      path: '/order_sources',
      builder: () => order_sources.OrderSources(),
      middleware: [
        DefferedLoader(order_sources.loadLibrary),
      ],
    ),

    QRoute(
      path: '/AddCat',
      builder: () => Addcat.AddCat(),
      middleware: [
        DefferedLoader(Addcat.loadLibrary),
      ],
    ),

    QRoute(
      path: '/payment_home',
      builder: () => payment_home.PaymentHome(),
      middleware: [
        DefferedLoader(payment_home.loadLibrary),
      ],
    ),
    QRoute(
      path: '/add_revenue',
      builder: () => add_revenue.AddRevenue(),
      middleware: [
        DefferedLoader(add_revenue.loadLibrary),
      ],
    ),
    QRoute(
      path: '/add_expenses',
      builder: () => add_expenses.AddExpenses(),
      middleware: [
        DefferedLoader(add_expenses.loadLibrary),
      ],
    ),QRoute(
      path: '/ConfirmOrder',
      builder: () => ConfirmOrder.ConfirmOrder(),
      middleware: [
        DefferedLoader(ConfirmOrder.loadLibrary),
      ],
    ),
    QRoute(
      path: '/add_obligations',
      builder: () => add_obligations.AddObligations(),
      middleware: [
        DefferedLoader(add_obligations.loadLibrary),
      ],
    ),
    QRoute(
      path: '/add_origins',
      builder: () => add_origins.AddOrigins(),
      middleware: [
        DefferedLoader(add_origins.loadLibrary),
      ],
    ),
    QRoute(
      path: '/covenant',
      builder: () => covenant.Covenant(),
      middleware: [
        DefferedLoader(covenant.loadLibrary),
      ],
    ),
    QRoute(
      path: '/discount_obligations',
      builder: () => discount_obligations.DiscountObligations(),
      middleware: [
        DefferedLoader(discount_obligations.loadLibrary),
      ],
    ),
    QRoute(
      path: '/expenses',
      builder: () => expenses.Expenses(),
      middleware: [
        DefferedLoader(expenses.loadLibrary),
      ],
    ),
    QRoute(
      path: '/individual_clients',
      builder: () => individual_clients.IndividualClients(),
      middleware: [
        DefferedLoader(individual_clients.loadLibrary),
      ],
    ),
    QRoute(
      path: '/origins',
      builder: () => origins.Origins(),
      middleware: [
        DefferedLoader(origins.loadLibrary),
      ],
    ),
    QRoute(
      path: '/other_revenue',
      builder: () => other_revenue.OtherRevenue(),
      middleware: [
        DefferedLoader(other_revenue.loadLibrary),
      ],
    ),
    QRoute(
      path: '/types_expenses',
      builder: () => types_expenses.TypesExpenses(),
      middleware: [
        DefferedLoader(types_expenses.loadLibrary),
      ],
    ),
    QRoute(
      path: '/company_and_customer',
      builder: () => company_and_customer.CompanyAndCustomer(),
      middleware: [
        DefferedLoader(company_and_customer.loadLibrary),
      ],
    ),
    QRoute(
      path: '/customer_account_details',
      builder: () => customer_account_details.CustomerAccountDetails(),
      middleware: [
        DefferedLoader(customer_account_details.loadLibrary),
      ],
    ),
    QRoute(
      path: '/covenent_settlement',
      builder: () => covenent_settlement.CovenantSettlement(),
      middleware: [
        DefferedLoader(covenent_settlement.loadLibrary),
      ],
    ),
    QRoute(
      path: '/pay_convenent',
      builder: () => pay_convenent.PayCovenant(),
      middleware: [
        DefferedLoader(pay_convenent.loadLibrary),
      ],
    ),

    //users
    QRoute(
      path: '/follow_users',
      builder: () => follow_users.FollowUser(),
      middleware: [
        DefferedLoader(follow_users.loadLibrary),
      ],
    ),
    QRoute(
      path: '/permission',
      builder: () => permission.Permission(),
      middleware: [
        DefferedLoader(permission.loadLibrary),
      ],
    ),
    QRoute(
      path: '/add_user',
      builder: () => add_user.AddUser(),
      middleware: [
        DefferedLoader(add_user.loadLibrary),
      ],
    ),
    QRoute(
      path: '/users',
      builder: () => users.Users(),
      middleware: [
        DefferedLoader(users.loadLibrary),
      ],
    ),
    QRoute(
      path: '/follow_user_details',
      builder: () => follow_user_details.FollowUsersDetails(),
      middleware: [
        DefferedLoader(follow_user_details.loadLibrary),
      ],
    ),

    // HR

    QRoute(
      path: '/payroll',
      builder: () => payroll.Payroll(),
      middleware: [
        DefferedLoader(payroll.loadLibrary),
      ],
    ),
    QRoute(
      path: '/employees',
      builder: () => employees.Employees(),
      middleware: [
        DefferedLoader(employees.loadLibrary),
      ],
    ),
    QRoute(
      path: '/advance_exchange',
      builder: () => advance_exchange.AdvanceExchange(),
      middleware: [
        DefferedLoader(advance_exchange.loadLibrary),
      ],
    ),
    QRoute(
      path: '/add_employee',
      builder: () => add_employee.AddEmployee(),
      middleware: [
        DefferedLoader(add_employee.loadLibrary),
      ],
    ),
    QRoute(
      path: '/account_statement_hr',
      builder: () => account_statement_hr.AccountStatement(),
      middleware: [
        DefferedLoader(account_statement_hr.loadLibrary),
      ],
    ),

    //reports
    QRoute(
      path: '/cost_goods_sold',
      builder: () => cost_goods_sold.CostGoodsSold(),
      middleware: [
        DefferedLoader(cost_goods_sold.loadLibrary),
      ],
    ),
    QRoute(
      path: '/list_input',
      builder: () => list_input.ListInput(),
      middleware: [
        DefferedLoader(list_input.loadLibrary),
      ],
    ),
    QRoute(
      path: '/audit_pudget',
      builder: () => audit_pudget.Auditbudget(),
      middleware: [
        DefferedLoader(audit_pudget.loadLibrary),
      ],
    ),
    QRoute(
      path: '/payment_shoping',
      builder: () => payment_shoping.PaymentShoping(),
      middleware: [
        DefferedLoader(payment_shoping.loadLibrary),
      ],
    ),
    QRoute(
      path: '/revenue_details',
      builder: () => revenue_details.RevenueDetails(),
      middleware: [
        DefferedLoader(revenue_details.loadLibrary),
      ],
    ),

    QRoute(
      path: '/category_profitability_report',
      builder: () =>
          category_profitability_report.CategoryProfitabilityReport(),
      middleware: [
        DefferedLoader(category_profitability_report.loadLibrary),
      ],
    ),
    QRoute(
      path: '/procurement_report',
      builder: () => procurement_report.ProcurementReport(),
      middleware: [
        DefferedLoader(procurement_report.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Product_sales_report',
      builder: () => Product_sales_report.ProductSalesReport(),
      middleware: [
        DefferedLoader(Product_sales_report.loadLibrary),
      ],
    ),
    QRoute(
      path: '/shipping_companies_report',
      builder: () => shipping_companies_report.ShippingCompaniesReport(),
      middleware: [
        DefferedLoader(shipping_companies_report.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Statement_financial_position',
      builder: () => Statement_financial_position.StatementFinancialPosition(),
      middleware: [
        DefferedLoader(Statement_financial_position.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Stock_report',
      builder: () => Stock_report.StockReport(),
      middleware: [
        DefferedLoader(Stock_report.loadLibrary),
      ],
    ),

    //print
    QRoute(
      path: '/Receipt_cash',
      builder: () => Receipt_cash.CheckCash(),
      middleware: [
        DefferedLoader(Receipt_cash.loadLibrary),
      ],
    ),
    QRoute(
      path: '/print_takwid',
      builder: () => print_takwid.PrintTakwid(),
      middleware: [
        DefferedLoader(print_takwid.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Price_Quotation1',
      builder: () => Price_Quotation1.PriceQuotation1(),
      middleware: [
        DefferedLoader(Price_Quotation1.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Price_Quotation',
      builder: () => Price_Quotation.PriceQuotation(),
      middleware: [
        DefferedLoader(Price_Quotation.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Payment_permission',
      builder: () => Payment_permission.PaymentPermission(),
      middleware: [
        DefferedLoader(Payment_permission.loadLibrary),
      ],
    ),
    QRoute(
      path: '/order_bills',
      builder: () => order_bills.OrderBills(),
      middleware: [
        DefferedLoader(order_bills.loadLibrary),
      ],
    ),
    QRoute(
      path: '/invoice',
      builder: () => invoice.Invoice(),
      middleware: [
        DefferedLoader(invoice.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Documentation_of_delivery_requests',
      builder: () =>
          Documentation_of_delivery_requests.DocumentationDeliveryRequests(),
      middleware: [
        DefferedLoader(Documentation_of_delivery_requests.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Coding_orders',
      builder: () => Coding_orders.CodingOrders(),
      middleware: [
        DefferedLoader(Coding_orders.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Check_receipt',
      builder: () => Check_receipt.CheckReceipt(),
      middleware: [
        DefferedLoader(Check_receipt.loadLibrary),
      ],
    ),
  ];
}