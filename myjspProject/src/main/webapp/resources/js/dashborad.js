$(document).ready(function(){

	/*달력보기*/
	$('.calendar-view').on('click',function(e){
		e.preventDefault();
		console.log("eqweqwe");
		$('.ui.modal.calendar').modal('show');

		 $( "#datepicker" ).datepicker({
			showOn : 'button',
			dateFormat: 'yymmdd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
		});

	});

	/*modal 글등록 */
	$('.registrationButton').on('click',function(){
		$('.ui.modal.data-reg').modal('show');
		dataReg();
	});

	function dataReg(){
		$('.reg-btn').on('click',function(){
			/*data register */
			let value1 = $('.data-reg #title').data("target");
			let value2 = $('.data-reg #content').data("target");
			let value3 = $('.data-reg #check').data("target");
			let title = $('.data-reg #title').val();
			let content = $('.data-reg #content').val();
			let dashBoardeDataDTO = {"title":title,"content":content};

			if(title === '' && content === '') {
				erroerAlert(value1,value2);
				return false;
			}else{
				if(title === ''){
					erroerAlert(value1,'');
					return false;
				}
				if(content === ''){
					erroerAlert('',value2);
					return false;
				}
			}
			console.log($('#check').prop("checked"));
			if($('#check').prop("checked") !== true){
				erroerAlert('','',value3)
				return false;
			}

			console.log(dashBoardeDataDTO);
			 $.ajax({
            "url": "http://localhost:8000/dashborad/data",
            "method": "POST",
            "timeout": 0,
            "headers": {
                "Content-Type": "application/json",
            },
            "data":JSON.stringify(dashBoardeDataDTO)
        })
            .done(function (response) {
               console.log(response)
				location.href = "/dashborad/main";
            })
            .fail(function(xhr, textStatus, error){
                console.log(error);
            });
		});

	}

	/*errorFunction */
	function erroerAlert(value1,value2,value3){
		console.log(value1)
		$('.ui.error.message').removeClass("hide");
		$('.ui.error.message').addClass("show");

		$(`${value1}`).removeClass('hide')
		$(`${value1}`).addClass('show')
		$(`${value2}`).removeClass('hide')
		$(`${value2}`).addClass('show')
		$(`${value3}`).removeClass('hide')
		$(`${value3}`).addClass('show')
		console.log($(`${value1}`))
		setTimeout(function(){
			$('.ui.error.message').removeClass("show");
			$('.ui.error.message').addClass("hide");
			$(`${value1}`).removeClass('show')
			$(`${value1}`).addClass('hide')
			$(`${value2}`).removeClass('show')
			$(`${value2}`).addClass('hide')
			$(`${value3}`).removeClass('show')
			$(`${value3}`).addClass('hide')
		},2000)
	}

	/*navigation-Link */
$('.left-area a').on('click',function(e){
	e.preventDefault();
	let urlLink = $(this).data("link");
	location.href= urlLink;
});


let labels = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
  ];

  let data = {
    labels: labels,
    datasets: [{
      label: 'My First dataset',
      backgroundColor: 'rgb(255, 99, 132)',
      borderColor: 'rgb(255, 99, 132)',
      data: [0, 10, 5, 2, 20, 30, 45],
    }]
  };

  let config = {
    type: 'bar',
    data: data,
    options: {

	animations: {
		duration: 1000,
        easing: 'linear',
        from: 1,
        to: 0,
        loop: true
	}
	},
	scales: {
		 y: { // defining min and max so hiding the dataset does not change scale range
	        min: 0,
	        max: 100
	      }
	}

  };



let myChart = new Chart(
    document.getElementById('myChart'),
    config
  );
});