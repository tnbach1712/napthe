$.ajax({
  type: "POST",
  url: "/" + payment_zingcard.urlSubmit,
  data: {
      pmcID: 1,
      pmOptID: 41,
      sID: 3659,
      roleID: '',
      roleName: '',
      productCode: 'volamfree',
      cardSerial: 'BD5732857699',
      cardPassword: '123123131',
      accountName: 'nnbcndo300'
  },
  dataType: "json"
}).done(function (data) {
  console.log(data)
  payment_zingcard.successCallback(data);
  payment_zingcard.isProcessing = false;
  payment_zingcard.hidePopupProcessing();
}).fail(function () {
  console.log('vo day 1')
  payment_zingcard.isProcessing = false;
  payment_zingcard.hidePopupProcessing();
}).always(function () {
  payment_zingcard.isProcessing = false;
  payment_zingcard.hidePopupProcessing();
});
