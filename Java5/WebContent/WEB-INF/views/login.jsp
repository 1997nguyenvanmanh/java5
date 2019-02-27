<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link href="<c:url value="https://doc-0o-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/7uv8ls3qdh19t4pl122444qb6l18l07q/1550743200000/03000763563995590061/03000763563995590061/1UgYIka_aiOfA3DkUrdRPjXHZtIlshqYn?h=12019089771500364299&e=download" />" rel="stylesheet">
	<link href="<c:url value="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />" rel="stylesheet">
	<link href="<c:url value="https://doc-10-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/8ksjphppnd2edffm66f4rmgs0p99vkgo/1550743200000/03000763563995590061/03000763563995590061/1uzvWgkUlf6pefJQXkPk56-3W7HoPqMCf?h=12019089771500364299&e=download"/>" rel="stylesheet">
	<link href="<c:url value="https://doc-14-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/ud4sp9ibb22soh1tnsmv74el7ne2crt2/1550743200000/03000763563995590061/03000763563995590061/147FsunAiDGcZihzo8ItCExwLyI4OfI8y?h=12019089771500364299&e=download" />" rel="stylesheet">
	<link href="<c:url value="https://doc-0g-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/khhu5696ti35m76c82hg58h3012qv0il/1550743200000/03000763563995590061/03000763563995590061/1ssqE6BnkBXQWpp03dokxjs_9IXKfdDzG?h=12019089771500364299&e=download" />" rel="stylesheet">
	<link href="<c:url value="https://doc-14-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/f5ufl29jl1riqs61i17l325msvmmg067/1550743200000/03000763563995590061/03000763563995590061/1P3yqJQ7GwhQLwAFaAP0igrrKewY7F7wU?h=12019089771500364299&e=download" />" rel="stylesheet">
	<link href="<c:url value="https://doc-14-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/hh8m9kiia077esk8u7piqo7odb9iihkj/1550743200000/03000763563995590061/03000763563995590061/1RvXGcZN13XcvqoY5JNHzd_bFA5Iby3_w?h=12019089771500364299&e=download" />" rel="stylesheet">
	<link href="<c:url value="https://doc-0k-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/e8naathk1hapqk8qvbo4g8boup274bhl/1550743200000/03000763563995590061/03000763563995590061/1Tk0wy1nEakUtk4PrBCFtTW7MlwlGXA_N?h=12019089771500364299&e=download"/>" rel="stylesheet">
	<link href="<c:url value="https://doc-0k-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/sbpm1j46skb8kkqrp3ebsf06vha2aij6/1550743200000/03000763563995590061/03000763563995590061/1n83UDevh8OedKp0Srlv4sopmklV7ujkX?e=download&h=12019089771500364299&nonce=v97v9n2s4f28i&user=03000763563995590061&hash=1ni3e501oa1mmph00neobfbkjlthjlpj"/>" rel="stylesheet">
	<link rel="icon" type="image/png" href="https://doc-04-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/ui1sqh3n969bldbudgf3i81gsqassaq8/1550743200000/03000763563995590061/03000763563995590061/16D4QFA7412gLkLI6RWbNkSoZg7pBbi7j?h=12019089771500364299&e=download"/>
</head>
<body>
<div class="limiter">
		<div class="container-login100" style="background-image: url('https://doc-10-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/n71kh852bara2duga55k9857kcvuqmma/1550743200000/03000763563995590061/03000763563995590061/119aS4zCPj_qWwdHommiRXmIhMQgYW1l8?h=12019089771500364299&e=download');">
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33" style="opacity: 5;">
				<form class="login100-form validate-form flex-sb flex-w" action="/Java5/admin" method="post">
					<span class="login100-form-title p-b-53">
						Sign In With
					</span>

					<a href="#" class="btn-face m-b-20">
						<i class="fa fa-facebook-official"></i>
						Facebook
					</a>

					<a href="#" class="btn-google m-b-20">
						<img src="https://doc-04-40-docs.googleusercontent.com/docs/securesc/v59e6svcev51kn4c9u5a42ks8uojuvvs/rr6pggg2rbjacbcnmsdhiqial7h34q21/1550743200000/03000763563995590061/03000763563995590061/1oQ2vq09yOoOvCFRfRBtiZsNVGm7W05q3?h=12019089771500364299&e=download" alt="GOOGLE">
						Google
					</a>
					
					<div class="p-t-31 p-b-9">
						<span class="txt1">
							Username
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
						<input class="input100" type="text" name="user" >
						<span class="focus-input100"></span>
					</div>
					
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							Password
						</span>

						<a href="#" class="txt2 bo1 m-l-5">
							Forgot?
						</a>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" >
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn">
							Sign In
						</button>
					</div>

					<div class="w-full text-center p-t-55">
						<span class="txt2">
							Not a member?
						</span>

						<a href="#" class="txt2 bo1">
							Sign up now 
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>