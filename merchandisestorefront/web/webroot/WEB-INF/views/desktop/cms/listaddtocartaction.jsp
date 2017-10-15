<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="buttonType">submit</c:set>
<c:choose>
	<c:when test="${product.stock.stockLevelStatus.code eq 'outOfStock' }">
		<c:set var="buttonType">button</c:set>
		<spring:theme code="text.addToCart.outOfStock" var="addToCartText"/>
	</c:when>
	<c:when test="${product.stock.stockLevelStatus.code eq 'lowStock' }">
		<div class='lowStock'>
			<spring:theme code="product.variants.only.left" arguments="${product.stock.stockLevel}"/>
		</div>
	</c:when>
</c:choose>
</a>
<!-- make product unavailable if user external and product internal onlyy -->
		<h1><c:out value="${product.internalOnly}">Internal only product</c:out></h1>
		<h1><c:out value="${user.internal}">Internal only user</c:out></h1>
       <c:if test="${product.internalOnly and !user.internal}">
            <c:set var="buttonType">button</c:set>
            <h1>Hello Not internal customer</h1>
            <spring:theme code="text.addToCart.unavailable" var="addToCartText"/>
        </c:if>
<div class="cart clearfix">
    <c:url value="/cart/add" var="addToCartUrl"/>
    <ycommerce:testId code="searchPage_addToCart_button_${product.code}">
        <form:form id="addToCartForm${product.code}" action="${addToCartUrl}" method="post" class="add_to_cart_form">
            <input type="hidden" name="productCodePost" value="${product.code}"/>
            <button type="${buttonType}" class="addToCartButton <c:if test="
            ${product.stock.stockLevelStatus.code eq 'outOfStock' }">out-of-stock</c:if>"
            <c:if test="${(product.stock.stockLevelStatus.code eq 'outOfStock') || fn:contains(buttonType, 'button') }"> disabled="disabled" aria-disabled="true"</c:if>
            >${addToCartText}</button>
        </form:form>
    </ycommerce:testId>
</div>