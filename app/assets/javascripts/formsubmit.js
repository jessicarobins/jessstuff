$(document).ready(function () {
      

  $.validator.setDefaults({
    errorClass: 'invalid',
    validClass: "valid",
    errorPlacement: function (error, element) {
        $(element)
            .closest("form")
            .find("label[for='" + element.attr("id") + "']")
            .attr('data-error', error.text());
    },
    submitHandler: function (form) {
        $(form).find('[type=submit]').prop('disabled', true);
        $.rails.handleRemote( $(form) );
    }
  });

    
});