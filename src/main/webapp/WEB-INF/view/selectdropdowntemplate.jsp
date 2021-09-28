
<!DOCTYPE html>
<html>

<head>




<title>Home</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>



<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
<style type="text/css">
	.select2-container--open .select2-dropdown {
		left: 8px;
	}
</style>

</head>

<body>

	<h1>DropDown with Search using jQuery</h1>
	<div>
		<select id="country" style="width: 270px;">
			<!-- Dropdown List Option -->
			<option value="volvo">Volvo</option>
			<option value="saab">Saab</option>
			<option value="mercedes">Mercedes</option>
			<option value="audi">Audi</option>
			<option value="volvo">Volvo</option>
			<option value="saab">Saab</option>
			<option value="mercedes">Mercedes</option>
			<option value="audi">Audi</option>
			<option value="volvo">Volvo</option>
			<option value="saab">Saab</option>
			<option value="mercedes">Mercedes</option>
			<option value="audi">Audi</option>
		</select>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#country").select2({

			});
		});
	</script>
	


</body>

</html>