$( ".updateQte" ).each(function( index ) {
	$(this).on("change", function(){
		$(this).parent().submit();
	});
});

$('#boutonPayer').on('click', function () {
  $("#actionLogin").val("payer");
});

$('#formLogin').on('hidden.bs.modal', function () {
  $("#actionLogin").val("");
});

