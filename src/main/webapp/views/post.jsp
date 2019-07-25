<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<script type="text/javascript" src="../resources/js/jquery-2.1.4.min.js"></script>
</head>
<body>
	<button onclick="fuck()">fuckyouall</button>
</body>
</html>
<script type="text/javascript">
	function fuck(){
		//$.post("../action/UsrRegister", { username: "John", password: "2pmasdasd",email:"smjiba@qq.com",qq:"123123123" } );
		$.post("../TopicReadAll.action");
	}
</script>