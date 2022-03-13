$(function() {
    $("#show-number").on("click", function(){
        var $this = $(this);
        $this.find("span").text($this.data("number"));  
    });


    $("#toggleDescriptionBtn").on("click", function(){
        const details = $("#description-wrapper");
        details.toggleClass("open");
        if(details.hasClass("open")){
            $(this).text("Read less");
        } else {
            $(this).text("Read more");
        }
    });

    $("#send-email-to-agent").on("click", function(){
        const agentId = $("#agent_id").val();
        const senderName = $("#sender-name").val();
        const senderEmail = $("#sender-email").val();
        const senderMessage = $("#sender-message").val();
        $.ajax({
            url: "/agent/email",
            method: "POST",
            dataType: "JSON",
            data: {
                agent_id: agentId,
                sender_name: senderName,
                sender_email: senderEmail,
                sender_message: senderMessage

            },
            success: function(data){
                $("#contact-modal form").remove();
                $("#send-email-to-agent").remove();
                $("#contact-modal").html("<p>Your message has been successfully sent!</p>");
    
            }
        });
    });




    var exampleModal = document.getElementById('email-agent')
    exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var recipient = button.getAttribute('data-bs-whatever')
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
    });


});