import ballerina/http;
import wso2/choreo.sendemail;
import ballerina/io;

configurable string reportingServiceUrl = ?;
configurable string reportingEmail = ?;

const mailSubject = "Sales Report";

http:Client httpClient = check new (reportingServiceUrl);
sendemail:Client mailClient = check new ();

public function main() returns error? {

    http:Response response = check httpClient->/reports;
    io:println("Obtained sales data");

    json jsonResponse = check response.getJsonPayload();
    SalesReport salesReport = check jsonResponse.cloneWithType();
    string salesReportTableStr = createSalesReportTable(salesReport);

    string _ = check mailClient->sendEmail(reportingEmail, mailSubject, salesReportTableStr);
    io:println("Mail has been sent");
}