<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <title>Sign up - QASurge Technologies</title>
    </head>
    <body >
        <%@include file="normal_navbar.jsp" %>

        <div class="container pt-0 mt-0" style="max-width:500px;" >
            <div class="row">
                <div class="col">
                    <div class="card border border-primary">
                        <div class="card-header text-center bg-primary">
                            <i class='fas fa-users' style='font-size:36px; color:white'></i>
                            <h4 class="card-title text-white">Register here!</h4>
                        </div>
                        <div class="card-body">
                            <form id="form1" action="signUpServlet" method="post">
                                <div class="form-group">
                                    <label for="usr">User Name:</label>
                                    <input type="text" class="form-control" id="usr" name="username">
                                </div><div class="form-group">
                                    <label for="email">Email address:</label>
                                    <input type="email" class="form-control" id="email" name="mail1">
                                </div>
                                <div class="form-group">
                                    <label for="pwd">Password:</label>
                                    <input type="password" class="form-control" id="pwd" name="password">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" name="gender" value="M">Male
                                    <input type="radio" name="gender" value="F">Female
                                </div>

                                <div class="form-check mt-4">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" name="check" value="">I agree with terms and condition
                                    </label>
                                </div>
                                <div id="loader" class="mt-4 mb-2"  style="display:none">
                                    <i class="fa fa-spinner fa-spin" style="font-size:24px;"></i>
                                </div>
                                <button id="submitbutton" class="mt-4 mb-2" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                    <div class="card-footer">    
                    </div>
                </div>
            </div>
            <!--End of first Card row-->
        </div>
    </div>
    <!--End of Container-->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#form1').on('submit', function (event) {
                event.preventDefault();
                $('#submitbutton').hide();
                $('#loader').show();
                console.log("Hello");

                let form = new FormData(this);
//                for (var pair of form.entries()) {
//                    console.log(pair[0] + ', ' + pair[1]);
//                }



                $.ajax({
                    url: "signUpServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqxhr) {
                        console.log("Success: " + data);
                        $('#loader').hide();
                        $('#submitbutton').show();
                        swal("Good job!", "Data is saved!", "success").then((value) => {
                            window.location="index.jsp";
                        });
                    },
                    error: function (jqxhr, textStatus, errorThrown) {
                        console.log("Error: " + errorThrown);
                        $('#loader').hide();
                        $('#submitbutton').show();
                        swal("Something went wrong!", "Data not saved!", "error").then((value) => {
                            window.location="index.jsp";
                        });
                    },
                    processData: false,
                    contentType: false

                });
            });
        });
    </script>
</body>
</html>
