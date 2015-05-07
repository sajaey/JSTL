<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@  taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>JSTL Testing</title>
</head>
<body>

<c:set var="names" value="Peter, Pat, Mark, Tracy,Peter1, Pat2, Mark3, Tracy4,Peter5, Pat6, Mark7, Tracy8,Peter9, Pat10, Mark11, Tracy12" scope="page" />
<c:set var="string3" value="${fn:split(names,',')}" />

<c:set var="totalCount" scope="session" value="${fn:length(string3)}"/>
<c:set var="perPage" scope="session" value="5"/>
<c:set var="totalPages" scope="session" value="${totalCount/perPage}"/>
<c:set var="pageIndex" scope="session" value="${param.start/perPage+1}"/>

${param.start}<br/>

<c:if test="${!empty param.start && param.start >(perPage-1) && param.start !=0 }">
<a href="?start=<c:out value="${param.start - perPage}"/>">Prev </a>
</c:if>
<c:forEach var="boundaryStart" varStatus="status" begin="0" end="${totalCount - 1}" step="${perPage}">
<c:choose>
<c:when test="${status.count>0 && status.count != pageIndex}">
<a href="?start=<c:out value='${boundaryStart}'/>"><c:out value="${status.count}"/> | </a>
</c:when>
<c:otherwise>
<c:out value="${status.count}"/> |
</c:otherwise>
</c:choose>
</c:forEach>

<c:if test="${empty param.start || param.start<(totalCount-perPage)}">
      <a href="?start=<c:out value="${param.start + perPage}"/>">Next </a>
</c:if>
<br/>

<c:set var="start" value="${pageIndex*perPage-perPage}"/>
<c:set var="stop" value="${pageIndex*perPage-1}"/>

   <c:forEach items="${pageScope.names}" var="currentName" varStatus="status" begin="${start}" end="${stop}">
         Family member #<c:out value="${status.count}" /> is
        <c:out value="${currentName}" /> <br />
    </c:forEach>
    

</body>
</html>