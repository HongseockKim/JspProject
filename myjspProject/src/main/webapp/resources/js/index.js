$(document).ready(function() {

    $('.handle-save').on('click', function(){
        let title = $("[name=title]").val();
        let content = $("[name=content]").val();
        let borderData = {title,content};

        if(title === "") {
            $("[name=title]").focus();
            return false
        }
        if(content === "") {
            $("[name=content]").focus();
            return  false
        }
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
                $('.modal').append('<div class="alert-tag alert alert-success" role="alert">저장되었습니다.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>')
                let reload = setTimeout(function () {
                    $("button[data-dismiss='alert']").trigger('click');
                    location.href = "/"
                },2000);

                $("button[data-dismiss='alert']").on('click',function () {
                    clearTimeout(reload)
                    location.href = "/"
                })
            })
            .fail(function(xhr, textStatus, error){
                console.log(error);
            });
    });

    $('.main-container .btn-danger').on('click', function(){
        let getId =$(this).parents('.panel').data('id');
        $.ajax({
            type:'GET',
            url:`/border/delete?id=${getId}`,
            headers:'application/x-www-form-urlencoded; charset=UTF-8;',
        }).done(function (response) {
            console.log(response)
            location.href = "/"
        })
    });

    $('.panel-body .thumbnail').on('click', function(e){
        e.preventDefault();
        let getId = $(this).parents('.panel').data('id');

        $.ajax({
            type:'GET',
            url:`/page/border?id=${getId}`,
            headers:'application/x-www-form-urlencoded; charset=UTF-8;',
        }).done(function (response) {
            console.log(response)
            location.href = `/page/border?id=${getId}`
        })
    });

    $('.pagination a').on('click', function(e){
        e.preventDefault();
        let getPage = $(this).data('number');

        $.ajax({
            type:'GET',
            url:`/index?page=${getPage}`,
            headers:'application/x-www-form-urlencoded; charset=UTF-8;',
        }).done(function (response) {
            console.log(response)
        })

    });
})