class ShowOrdersModel {
  String headingTitle;
  String columnOrderId;
  String columnCustomer;
  String columnProduct;
  String columnTotal;
  String columnStatus;
  String columnDateAdded;
  String totalOrders;
  List<Orders> orders;

  ShowOrdersModel(
      {this.headingTitle,
        this.columnOrderId,
        this.columnCustomer,
        this.columnProduct,
        this.columnTotal,
        this.columnStatus,
        this.columnDateAdded,
        this.totalOrders,
        this.orders});

  ShowOrdersModel.fromJson(Map<String, dynamic> json) {
    headingTitle = json['heading_title'];
    columnOrderId = json['column_order_id'];
    columnCustomer = json['column_customer'];
    columnProduct = json['column_product'];
    columnTotal = json['column_total'];
    columnStatus = json['column_status'];
    columnDateAdded = json['column_date_added'];
    totalOrders = json['total_orders'];
    if (json['orders'] != null) {
      orders = new List<Orders>();
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heading_title'] = this.headingTitle;
    data['column_order_id'] = this.columnOrderId;
    data['column_customer'] = this.columnCustomer;
    data['column_product'] = this.columnProduct;
    data['column_total'] = this.columnTotal;
    data['column_status'] = this.columnStatus;
    data['column_date_added'] = this.columnDateAdded;
    data['total_orders'] = this.totalOrders;
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String orderId;
  String name;
  String status;
  String dateAdded;
  int products;
  String total;

  Orders(
      {this.orderId,
        this.name,
        this.status,
        this.dateAdded,
        this.products,
        this.total});

  Orders.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    name = json['name'];
    status = json['status'];
    dateAdded = json['date_added'];
    products = json['products'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['date_added'] = this.dateAdded;
    data['products'] = this.products;
    data['total'] = this.total;
    return data;
  }
}
