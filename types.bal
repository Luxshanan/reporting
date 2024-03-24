type ProductSales record {
    string productSku;
    string productName;
    float unitPrice;
    int unitsSold;
    float total;
};


type SalesReport record {
 ProductSales[] productSalesList;
}
