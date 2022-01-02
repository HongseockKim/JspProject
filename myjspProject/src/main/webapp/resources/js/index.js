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
                console.log('ewqeqwe');
                location.reload();
            })
            .fail(function(xhr, textStatus, error){
                console.log(error);
            });
    });

    $('.main-container .btn-danger').on('click', function(){
        let getId =$(this).parents('.panel').data('id');
        $.ajax({
            type:'GET',
            url:`/delete?id=${getId}`,
            dataType: 'application/json',
        });
        setTimeout(function(){
            location.href = "/"
        },300)
    });
})