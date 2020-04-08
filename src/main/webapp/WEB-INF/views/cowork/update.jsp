<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>needPopup demo</title>
		

	  <!-- Styles just for demo -->
		

	</head>
	<body>
		<div class="wrapper">
			<a href="#" data-needpopup-show="#small-popup">Show small popup</a>
			<a href="#" data-needpopup-show="#big-popup">Show big popup</a>
			<a href="#" data-needpopup-show="#custom-popup">Show custom options popup</a>


			<div id='small-popup' class="needpopup">
				<a href="#">Go to big popup</a>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
			</div>

		<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="/SRC2/modal/dist/needpopup.min.js"></script>
		<script>  
			needPopup.config.custom = {
				'removerPlace': 'outside',
				'closeOnOutside': false,
				onShow: function() {
					console.log('needPopup is shown');
				},
				onHide: function() {
					console.log('needPopup is hidden');
				}
			};
			needPopup.init();
		</script>
	</body>
</html>