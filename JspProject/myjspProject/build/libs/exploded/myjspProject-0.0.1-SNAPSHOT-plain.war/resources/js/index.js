$(document).ready(function() {

    $('.handle-save').on('click', function(){
        let title = $("[name=title]").val();
        let content = $("[name=content]").val();
        let borderData = {title,content};
        $.ajax({
            "url": "http://localhost:8000/border/data/saves",
            "method": "POST",
            "timeout": 0,
            "headers": {
                "Content-Type": "application/json",
            },
            "data":JSON.stringify(borderData)
        })
            .done(function (response) {
                location.href = "/"
            })
            .fail(function(xhr, textStatus, error){
                console.log(error);
            });
    });

    $('.main-container .btn-danger').on('click', function(){

        let getId =$(this).parents('.panel').data('id');
        let id ={
            "id":getId
        }

        $.ajax({
            type:'GET',
            url:`/delete?id=${getId}`,
            data:{id:id},
            dataType: 'application/json',
        }).done(function(response){
            console.log(response)
            console.log('eqweqweqwe');
            // location.href= "/"
        })

    });
})