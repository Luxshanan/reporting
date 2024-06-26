function createSalesReportTable(SalesReport salesReport) returns string {

    string[] headerCols = ["Product Name", " SKU ", "Unit Price", "Units Sold", "Total"];
    string delimiter = " | ";
    string reportTbl = delimiter;

    foreach string col in headerCols {
        reportTbl = reportTbl + col + delimiter;
    }
    
    reportTbl = reportTbl + "\n";
    
    foreach ProductSales productSales in salesReport.productSalesList {
        reportTbl = reportTbl + delimiter + 
        productSales.productName + delimiter +
        productSales.productSku + delimiter +
        (productSales.unitPrice).toString() + delimiter +
        (productSales.unitsSold).toString() + delimiter +
        (productSales.total).toString() + delimiter + "\n";
    }

    reportTbl = reportTbl + "--------------------------------------\n";
    return reportTbl;
}
