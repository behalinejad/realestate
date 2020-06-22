

import 'package:realestateadvisor/models/user.dart';

String getStatusCode(int status) {


  if (status == 100) {
    return 'The client SHOULD continue with its request.';

  } else if (status == 101) {
    return 'The server understands and is willing to comply with the client\'s request, via the Upgrade message header field (section 14.42), for a change in the application protocol being used on this connection.';
  } else if (status == 200) {
    return  'The request has succeeded.';
  } else if (status == 201) {
    return 'The request has been fulfilled and resulted in a new resource being created.';
  } else if (status == 202) {
    return 'The request has been accepted for processing, but the processing has not been completed.';
  } else if (status == 203) {
    return 'The returned metainformation in the entity-header is not the definitive set as available from the origin server, but is gathered from a local or a third-party copy.';
  } else if (status == 204) {
    return 'The server has fulfilled the request but does not need to return an entity-body, and might want to return updated metainformation.';
  } else if (status == 205) {
    return 'The server has fulfilled the request and the user agent SHOULD reset the document view which caused the request to be sent.';
  } else if (status == 206) {
    return 'The server has fulfilled the partial GET request for the resource.';
  } else if (status == 300) {
    return 'User (or user agent) can select a preferred representation and redirect its request to that location.';
  } else if (status == 301) {
    return 'The requested resource has been assigned a new permanent URI and any future references to this resource SHOULD use one of the returned URIs.';
  } else if (status == 302) {
    return 'The requested resource resides temporarily under a different URI.';
  } else if (status == 303) {
    return 'The response to the request can be found under a different URI and SHOULD be retrieved using a GET method on that resource.';
  } else if (status == 304) {
    return 'If the client has performed a conditional GET request and access is allowed, but the document has not been modified, the server SHOULD respond with this status code.';
  } else if (status == 305) {
    return 'The requested resource MUST be accessed through the proxy given by the Location field.';
  } else if (status == 307) {
    return 'The requested resource resides temporarily under a different URI.';
  } else if (status == 400) {
    return 'The request could not be understood by the server due to malformed syntax.';
  } else if (status == 401) {
    return 'The request requires user authentication.';
  } else if (status == 403) {
    return 'The server understood the request, but is refusing to fulfill it.';
  } else if (status == 404) {
    return 'The server has not found anything matching the Request-URI.';
  } else if (status == 405) {
    return 'The method specified in the Request-Line is not allowed for the resource identified by the Request-URI.';
  } else if (status == 406) {
    return 'The resource identified by the request is only capable of generating response entities which have content characteristics not acceptable according to the accept headers sent in the request.';
  } else if (status == 407) {
    return 'This code is similar to 401 (Unauthorized), but indicates that the client must first authenticate itself with the proxy.';
  } else if (status == 408) {
    return 'The client did not produce a request within the time that the server was prepared to wait.';
  } else if (status == 409) {
    return 'The request could not be completed due to a conflict with the current state of the resource.';
  } else if (status == 410) {
    return 'The requested resource is no longer available at the server and no forwarding address is known.';
  } else if (status == 411) {
    return 'The server refuses to accept the request without a defined Content- Length.';
  } else if (status == 412) {
    return 'The precondition given in one or more of the request-header fields evaluated to false when it was tested on the server.';
  } else if (status == 413) {
    return 'The server is refusing to process a request because the request entity is larger than the server is willing or able to process.';
  } else if (status == 414) {
    return 'The server is refusing to service the request because the Request-URI is longer than the server is willing to interpret.';
  } else if (status == 415) {
    return 'The server is refusing to service the request because the entity of the request is in a format not supported by the requested resource for the requested method.';
  } else if (status == 416) {
    return 'A server SHOULD return a response with this status code if a request included a Range request-header field (section 14.35), and none of the range-specifier values in this field overlap the current extent of the selected resource, and the request did not include an If-Range request-header field.';
  } else if (status == 417) {
    return 'The expectation given in an Expect request-header field (see section 14.20) could not be met by this server.';
  } else if (status == 500) {
    return 'The server encountered an unexpected condition which prevented it from fulfilling the request.';
  } else if (status == 501) {
    return 'The server does not support the functionality required to fulfill the request.';
  } else if (status == 502) {
    return 'The server, while acting as a gateway or proxy, received an invalid response from the upstream server it accessed in attempting to fulfill the request.';
  } else if (status == 503) {
    return 'The server is currently unable to handle the request due to a temporary overloading or maintenance of the server.';
  } else if (status == 504) {
    return 'The server, while acting as a gateway or proxy, did not receive a timely response from the upstream server specified by the URI.';
  } else if (status == 505) {
    return 'The server does not support, or refuses to support, the HTTP protocol version that was used in the request message.';
  }
  return 'Somthing went wrong ' ;
}

bool isNullOrEmpty(String string ){
  if (string.isEmpty || string == '' || string == null)
    return true;
  else
    return false;
}

bool isDefault(User user ){
  if ((user.id == -1 && user.username=='')|| user == null)
    return true;
  else
    return false;
}
List<int> toUtf8List(String strValue){
  List<int> utf8List;
  if(strValue.isNotEmpty) {
    var charMove = 0;
    strValue = strValue.trim();
    String strTemp = '';
    for (int i = 1; i < strValue.length; i++) {
      if (strValue[i] != ',') {
        strTemp = strTemp + strValue[i];
      } else {
        utf8List.add(int.parse(strTemp));
        strTemp = '';
      }
    }
  }
  return utf8List;


}