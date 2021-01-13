<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SU-CHAT</title>
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="lib/jquery-2.1.0.min.js"></script>
<script src="assets/js/jquery.swipebox.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	rel="stylesheet" type="text/css">
<link href="assets/css/chatbot.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/swipebox.css">
<script>
	(function($) {
		$('.swipebox').swipebox({
			removeBarsOnMobile : false
		})
	})(jQuery)

	var getTime = function() {
		var today = new Date()

		if (today.getHours() <= 12) {
			if (today.getHours() == 0) {
				time = '오전 ' + (today.getHours() + 12) + ':'
			} else {
				time = '오전 ' + today.getHours() + ':'
			}
		} else {
			time = '오후 ' + (today.getHours() - 12) + ':'
		}
		if (today.getMinutes() <= 9) {
			time += '0' + today.getMinutes()
		} else {
			time += today.getMinutes()
		}
		return time
	}

	var setRequest = function(msg) {
		var date_time = getTime()
		$('.msg_history').append($(
				'<div class="outgoing_msg">' + '<div class="sent_msg">' + '<p>'
						+ msg + '</p>' + '<span class="time_date">' + date_time
						+ '</span>' + '</div>' + '</div>').fadeIn())
		$('.msg_history').scrollTop($('.msg_history')[0].scrollHeight)
	}

	var postRequestToController = function() {
		var msg = $('.write_msg').val()
		var param = { "text" : msg }

		$('.write_msg').val('')

		if (msg == '') {
			$('.write_msg').focus()
			return null
		}
		setRequest(msg)

		$.ajax({
			type : 'POST',
			url : 'ChatAPIController',
			data : JSON.stringify(param),
			dataType: "json",
			contentType : 'application/json; charset=utf-8',
			success : function(resdata) {
				console.log("data", resdata)
				urlTypeParsor(resdata.content)
			},
			beforeSend : function() {
				$('.wait').addClass('loading')
			},
			complete : function() {
				$('.wait').removeClass('loading')
			},
			error : function(e) {
				console.log(e)
			}
		})
	}

	var enterkeypress = function() {
		if (event.keyCode == 13)
			postRequestToController()
	}

	var urlTypeParsor = function(content) {
		console.log("data", content)

		if (content[0].includes('.png')) {
			setImgResponse(content)
		} else {
			setResponse(content)
		}
	}

	var setResponse = function(content) {
		var date_time = getTime()

		$('.msg_history')
				.append(
						$(
								'<div class="incoming_msg">'
										+ '<div class="incoming_msg_img">'
										+ '<img src="assets/images/bot-icon.png" alt="SU CHAT">'
										+ '</div>'
										+ '<div class="received_msg">'
										+ '<div class="received_with_msg">'
										+ '<p>' + content + '</p>'
										+ '<span class="time_date">'
										+ date_time + '</span>' + '</div>'
										+ '</div>' + '</div>').fadeIn())
		$('.msg_history').scrollTop($('.msg_history')[0].scrollHeight)
	}

	var setImgResponse = function(images) {
		var date_time = getTime()

		for (index in images) {
			$('.msg_history')
					.append(
							$(
									'<div class="incoming_msg">'
											+ '<div class="incoming_msg_img">'
											+ '<img src="assets/images/bot-icon.png" alt="image">'
											+ '</div>'
											+ '<div class="received_msg">'
											+ '<div class="received_with_img">'
											+ '<a href="' + images[index] + '" class="swipebox">'
											+ '<img src="' + images[index] + '" alt="image">'
											+ '</a>' + '</div>'
											+ '<span class="time_date">'
											+ date_time + '</span>' + '</div>'
											+ '</div>' + '</div>').fadeIn())
			$('.msg_history').scrollTop($('.msg_history')[0].scrollHeight)
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div class="mesgs">
			<div class="mesg_header">
				<h2>SU CHAT</h2>
			</div>
			<div class="msg_history">
				<div class="wait"></div>
			</div>
			<div class="messaging">
				<div class="type_msg">
					<div class="input_msg_write">
						<input type="text" class="write_msg" placeholder="메시지 입력"
							onkeydown="javascript:enterkeypress()">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

