import ballerina/http;
import ballerina/log;

// Filter1

public type Filter1 object {
    public {
        function (http:Request request, http:FilterContext context) returns (http:FilterResult) filterRequest;
        function (http:Response response, http:FilterContext context) returns (http:FilterResult) filterResponse;
    }

    public new (filterRequest, filterResponse) {
    }

    public function init () {
        log:printInfo("Initializing filter 1");
    }

    public function terminate () {
        log:printInfo("Stopping filter 1");
    }
};

public function interceptRequest1 (http:Request request, http:FilterContext context) returns (http:FilterResult) {
    log:printInfo("Intercepting request for filter 1");
    http:FilterResult filterResponse = {canProceed:true, statusCode:200, message:"successful"};
    return filterResponse;
}

public function interceptResponse1 (http:Response response, http:FilterContext context) returns (http:FilterResult) {
    log:printInfo("Intercepting response for filter 1");
    http:FilterResult filterResponse = {canProceed:true, statusCode:200, message:"successful"};
    return filterResponse;
}

Filter1 filter1 = new (interceptRequest1, interceptResponse1);

// Filter2

public type Filter2 object {
    public {
        function (http:Request request, http:FilterContext context) returns (http:FilterResult) filterRequest;
        function (http:Response response, http:FilterContext context) returns (http:FilterResult) filterResponse;
    }

    public new (filterRequest, filterResponse) {
    }

    public function init () {
        log:printInfo("Initializing filter 2");
    }

    public function terminate () {
        log:printInfo("Stopping filter 2");
    }
};

public function interceptRequest2 (http:Request request, http:FilterContext context) returns (http:FilterResult) {
    log:printInfo("Intercepting request for filter 2");
    http:FilterResult filterResponse = {canProceed:false, statusCode:403, message:"Authorization failure"};
    return filterResponse;
}

public function interceptResponse2 (http:Response response, http:FilterContext context) returns (http:FilterResult) {
    log:printInfo("Intercepting response for filter 2");
    http:FilterResult filterResponse = {canProceed:true, statusCode:200, message:"successful"};
    return filterResponse;
}

Filter2 filter2 = new (interceptRequest2, interceptResponse2);

endpoint http:Listener echoEP {
    port:9090,
    filters:[filter1,filter2]
};

@http:ServiceConfig {
    basePath:"/echo"
}
service<http:Service> echo bind echoEP {
    @http:ResourceConfig {
        methods:["GET"],
        path:"/test"
    }
    echo (endpoint client, http:Request req) {
        http:Response res = new;
        _ = client -> respond(res);
    }
}
