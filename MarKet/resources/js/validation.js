function CheckAddProduct() {
	
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");

	//상품 아이디 체크
	if (!check(/^P[0-9]{4,11}$/,productId,"[상품코드]\np와 숫자를 조합하여 5~12까지 입력하세요")) {
		return false;
	}
	//상품명 체크
	if (name.value.length <4 || name.value.length > 12) {
		alert("[상품명]\n최소 4자에서 12자까지");
		name.select();
		name.focus();
		return false;
	}
	//가격 체크
	if (unitPrice.value == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n을 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice,"[가격]\n소수점둘때 자리까지만"))
		return false;
	//제고 수 체크
	if (isNaN(unitsInStock.value)) {
		alert("[제고 수]\n 숫자만 입려하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	function check(regExp,e,msg){
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	document.newProduct.submit()
}