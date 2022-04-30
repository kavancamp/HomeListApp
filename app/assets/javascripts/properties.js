$(function() {
    $("#show-number").on("click", function(){
         $this = $(this);
        $this.find("span").text($this.data("number"));  
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

    let exampleModal = document.getElementById('email-agent')
    exampleModal.addEventListener('show.bs.modal', function (event) {
        let button = event.relatedTarget
        let recipient = button.getAttribute('data-bs-whatever')
        let modalTitle = exampleModal.querySelector('.modal-title')
        let modalBodyInput = exampleModal.querySelector('.modal-body input')
    });

});