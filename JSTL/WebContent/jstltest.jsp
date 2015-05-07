<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@  taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>JSTL Testing</title>
</head>
<body>

<c:set var="names" value=":x000000F0:000003CD:,:000000F0:000003B9:,:000000F0:000003CC:" scope="page" />
<c:set var="string3" value="${fn:split(names,',')}" />

<c:set var="totalCount" scope="session" value="${fn:length(string3)}"/>

Total Count: ${totalCount}

XX ${string3[0]}


<c:set var="balance" value="$1250003.350" />

<fmt:parseNumber var="i" type="number" value="${balance}" />
<p>Parsed Number (1) : <c:out value="${i}" /></p>
<fmt:parseNumber var="i" integerOnly="true" 
                       type="number" value="${balance}" />
<p>Parsed Number (2) : <c:out value="${i}" /></p>


</body>
</html>