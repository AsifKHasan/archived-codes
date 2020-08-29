var url_retrieve_ua = "http://localhost:9090/csb/abl/utilitybill/gas/jalalabad/retrieve-ua"
var url_pay_bill = "http://localhost:9090/csb/abl/utilitybill/gas/jalalabad/pay-bill"
var xhr = new XMLHttpRequest();

function view_retriveua(){
	document.getElementById("btnRetrieveua").style.display = "inline-block";
	document.getElementById("btnPaybill").style.display = "none";
	document.getElementById("btnRetry").style.display = "none";
	document.getElementById("btnNewpayment").style.display = "none";
	
	document.getElementById("msg").style.display = "none";
	document.getElementById("rowMobile").style.display = "inline-block";
	document.getElementById("rowUaid").style.display = "inline-block";
	document.getElementById("rowName").style.display = "none";
	document.getElementById("rowAmount").style.display = "none";
	
	document.getElementById("textMobile").value = "01714169606";
	document.getElementById("textUaid").value = "JG00091346";

	//document.getElementById("textMobile").className = "text-input";
	//document.getElementById("textUaid").className = "text-input";
	//document.getElementById("textName").className = "text-input";
	document.getElementById("textMobile").readOnly = false;
	document.getElementById("textUaid").readOnly = false;
	document.getElementById("textName").readOnly = false;
	document.getElementById("textAmount").readOnly = false;
}

function view_payBillNotRegistered(data){
	document.getElementById("btnRetrieveua").style.display = "none";
	document.getElementById("btnPaybill").style.display = "inline-block";
	document.getElementById("btnRetry").style.display = "none";
	document.getElementById("btnNewpayment").style.display = "none";
	
	document.getElementById("msg").className = "label-warning";
	document.getElementById("msg").style.display = "inline-block";
	document.getElementById("rowMobile").style.display = "inline-block";
	document.getElementById("rowUaid").style.display = "inline-block";
	document.getElementById("rowName").style.display = "inline-block";
	document.getElementById("rowAmount").style.display = "inline-block";

	document.getElementById("textMobile").value = data["mobile"];
	document.getElementById("textUaid").value = data["uaid"];
	document.getElementById("textName").value = "";
	document.getElementById("textAmount").value = "";

	//document.getElementById("textMobile").className = "text-input";
	//document.getElementById("textUaid").className = "text-input";
	//document.getElementById("textName").className = "text-input";
	document.getElementById("textMobile").readOnly = false;
	document.getElementById("textUaid").readOnly = false;
	document.getElementById("textName").readOnly = false;
	document.getElementById("textAmount").readOnly = false;

	document.getElementById("msg").textContent = "We could not register your uitility account with your mobile number. However you can review your mobile number and account and proceed with paying the bill."
}

function view_payBillNewRegistration(data){
	document.getElementById("btnRetrieveua").style.display = "none";
	document.getElementById("btnPaybill").style.display = "inline-block";
	document.getElementById("btnRetry").style.display = "none";
	document.getElementById("btnNewpayment").style.display = "none";
	
	document.getElementById("msg").className = "label-info";
	document.getElementById("msg").style.display = "inline-block";
	document.getElementById("rowMobile").style.display = "inline-block";
	document.getElementById("rowUaid").style.display = "inline-block";
	document.getElementById("rowName").style.display = "inline-block";
	document.getElementById("rowAmount").style.display = "inline-block";
	
	document.getElementById("textMobile").value = data["mobile"];
	document.getElementById("textUaid").value = data["uaid"];
	document.getElementById("textName").value = "";
	document.getElementById("textAmount").value = "";

	//document.getElementById("textMobile").className = "text-input-readonly";
	//document.getElementById("textUaid").className = "text-input-readonly";
	//document.getElementById("textName").className = "text-input";
	document.getElementById("textMobile").readOnly = true;
	document.getElementById("textUaid").readOnly = true;
	document.getElementById("textName").readOnly = false;
	document.getElementById("textAmount").readOnly = false;
	
	document.getElementById("msg").textContent = "Your mobile phone was successfully registered with your account number so that in future your information can be accessed easily."
}

function view_payBillRegisteredByApp(data){
	document.getElementById("btnRetrieveua").style.display = "none";
	document.getElementById("btnPaybill").style.display = "inline-block";
	document.getElementById("btnRetry").style.display = "none";
	document.getElementById("btnNewpayment").style.display = "none";
	
	document.getElementById("msg").className = "label-info";
	document.getElementById("msg").style.display = "inline-block";
	document.getElementById("rowMobile").style.display = "inline-block";
	document.getElementById("rowUaid").style.display = "inline-block";
	document.getElementById("rowName").style.display = "inline-block";
	document.getElementById("rowAmount").style.display = "inline-block";
	
	document.getElementById("textMobile").value = data["mobile"];
	document.getElementById("textUaid").value = data["uaid"];
	document.getElementById("textName").value = data["name"];
	document.getElementById("textAmount").value = "";

	//document.getElementById("textMobile").className = "text-input-readonly";
	//document.getElementById("textUaid").className = "text-input-readonly";
	//document.getElementById("textName").className = "text-input";
	document.getElementById("textMobile").readOnly = true;
	document.getElementById("textUaid").readOnly = true;
	document.getElementById("textName").readOnly = false;
	document.getElementById("textAmount").readOnly = false;
	
	document.getElementById("msg").textContent = "Previous information from our system was reterieved from your earlier bill payment record. Please review if there is any change in your information."
}

function view_payBillRegisteredByProcess(data){
	document.getElementById("btnRetrieveua").style.display = "none";
	document.getElementById("btnPaybill").style.display = "inline-block";
	document.getElementById("btnRetry").style.display = "none";
	document.getElementById("btnNewpayment").style.display = "none";
	
	document.getElementById("msg").className = "label-info";
	document.getElementById("msg").style.display = "inline-block";
	document.getElementById("rowMobile").style.display = "inline-block";
	document.getElementById("rowUaid").style.display = "inline-block";
	document.getElementById("rowName").style.display = "inline-block";
	document.getElementById("rowAmount").style.display = "inline-block";
	
	document.getElementById("textMobile").value = data["mobile"];
	document.getElementById("textUaid").value = data["uaid"];
	document.getElementById("textName").value = data["name"];
	document.getElementById("textAmount").value = data["amount"];

	//document.getElementById("textMobile").className = "text-input-readonly";
	//document.getElementById("textUaid").className = "text-input-readonly";
	//document.getElementById("textName").className = "text-input-readonly";
	document.getElementById("textMobile").readOnly = true;
	document.getElementById("textUaid").readOnly = true;
	document.getElementById("textName").readOnly = true;
	document.getElementById("textAmount").readOnly = false;
	
	document.getElementById("msg").textContent = "Your bill related information was pulled from database. To change your registration and billing details please contact your bank or utility company."
}

function view_paymentOk(data){
	document.getElementById("msg").className = "label-info";
	document.getElementById("msg").textContent = "Bill payment was successful. The details of the payment is shown."

	document.getElementById("textMobile").readOnly = true;
	document.getElementById("textUaid").readOnly = true;
	document.getElementById("textName").readOnly = true;
	document.getElementById("textAmount").readOnly = true;

	document.getElementById("btnRetrieveua").style.display = "none";
	document.getElementById("btnPaybill").style.display = "none";
	document.getElementById("btnRetry").style.display = "none";
	document.getElementById("btnNewpayment").style.display = "inline-block";
}

function view_paymentFailed(data){
	document.getElementById("msg").className = "label-warning";
	document.getElementById("msg").textContent = "Bill payment failed. You may retry the payment or start a new Bill Payment process."

	//document.getElementById("textMobile").readOnly = true;
	//document.getElementById("textUaid").readOnly = true;
	//document.getElementById("textName").readOnly = true;
	//document.getElementById("textAmount").readOnly = true;

	document.getElementById("btnRetrieveua").style.display = "none";
	document.getElementById("btnPaybill").style.display = "none";
	document.getElementById("btnRetry").style.display = "inline-block";
	document.getElementById("btnNewpayment").style.display = "inline-block";
}

function retrieve_ua() {
	var paytload = {
		"mobile": document.getElementById("textMobile").value,
		"uaid": document.getElementById("textUaid").value
	};
	var data = JSON.stringify(paytload);
	xhr.open('POST', url_retrieve_ua, true);
	xhr.send(data);
	xhr.onreadystatechange = process_reponse_retrieve_ua;
}

function process_reponse_retrieve_ua(e) {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var response = JSON.parse(xhr.responseText);
		if(response.registrationStatus == "NotRegistered"){
			view_payBillNotRegistered(response);
		} else if(response.registrationStatus == "NewRegistration"){
			view_payBillNewRegistration(response);
		} else if(response.registrationStatus == "RegisteredByApp"){
			view_payBillRegisteredByApp(response);
		} else if(response.registrationStatus == "RegisteredByProcess"){
			view_payBillRegisteredByProcess(response);
		}
	}
}

function pay_bill() {
	var paytload = {
		"mobile": document.getElementById("textMobile").value,
		"uaid": document.getElementById("textUaid").value,
		"name": document.getElementById("textName").value,
		"amount": document.getElementById("textAmount").value
	};
	var data = JSON.stringify(paytload);
	xhr.open('POST', url_pay_bill, true);
	xhr.send(data);
	xhr.onreadystatechange = process_reponse_pay_bill;
}

function process_reponse_pay_bill(e) {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var response = JSON.parse(xhr.responseText);
		if(response.paymentStatus == "Ok"){
			view_paymentOk(response);
		} else if(response.paymentStatus == "Failed"){
			view_paymentFailed(response);
		}
	}
}

function new_payment() {
	view_retriveua();
}

document.addEventListener('DOMContentLoaded', function() {
	var buttonRetrieveua = document.getElementById('btnRetrieveua');
	buttonRetrieveua.addEventListener("click", retrieve_ua);
	
	var buttonPaybill = document.getElementById('btnPaybill');
	buttonPaybill.addEventListener("click", pay_bill);

	var buttonRetry = document.getElementById('btnRetry');
	buttonRetry.addEventListener("click", pay_bill);

	var buttonNewpayment = document.getElementById('btnNewpayment');
	buttonNewpayment.addEventListener("click", new_payment);

	view_retriveua();
});
