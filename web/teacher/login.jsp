<%-- 
    Document   : login
    Created on : Jun 18, 2021, 2:53:10 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <title>Teacher's Login</title>
        <link href="../MDB/LoginUI/bootstrap.min.css" rel="stylesheet" />
        <link href="../MDB/LoginUI/all.css" rel="stylesheet" />
        <link href="../MDB/LoginUI/LoginStyle.css" rel="stylesheet" />
    </head>



<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">

                        <h5 class="card-title text-center">Lecturer's Login</h5>
                        <hr>
                        <br>
                        <form action="processLL.jsp" method="post">
                            <div class="form-label-group">
                                <input name="lecid" type="text" id="inputEmail" class="form-control"
                                       placeholder="Lecturer ID" required autofocus>
                                <label for="inputEmail">ID</label>
                            </div>
                            <br>
                            <div class="form-label-group">
                                <input name="password" type="password" id="inputPassword" class="form-control"
                                       placeholder="Password" required>
                                <label for="inputPassword">Password</label>
                            </div>
                            <br>
                            <button name="submit" class="btn btn-lg btn-primary btn-block text-uppercase"
                                    type="submit">Sign in</button>
                            <br>
                            <script src="../MDB/LoginUI/bootstrap.bundle.min.js"></script>
                            <script src="../MDB/LoginUI/jquery.slim.min.js"></script>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>