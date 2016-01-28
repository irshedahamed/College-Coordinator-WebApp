<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Case</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/bootstrap.min.css">

        <script src="../js/tabsjs.js"></script>

        <script src="../js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function() {
                $(".nav-tabs a").click(function() {
                    $(this).tab('show');
                });
            });
        </script>
    </head>
    <body>

        <div class="container">
            <h2>Dynamic Tabs</h2>
            <ul class="nav nav-tabs">

                <li class="active"><a href="#sem1">SEM 1</a></li>
                <li><a href="#sem2">SEM 2</a></li>
                <li><a href="#sem3">SEM 3</a></li>
                <li><a href="#sem4">SEM 4</a></li>
                <li><a href="#sem5">SEM 5</a></li>
                <li><a href="#sem6">SEM 6</a></li>
                <li><a href="#sem7">SEM 7</a></li>
                <li><a href="#sem8">SEM 8</a></li>

            </ul>

            <div class="tab-content">
                <%
                    String rollno = request.getParameter("rollno");

                %>
                <div id="menu1" class="tab-pane fade">
                    <h3>Menu 1</h3>
                    <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <h3>Menu 2</h3>
                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                </div>
                <div id="menu3" class="tab-pane fade">
                    <h3>Menu 3</h3>
                    <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                </div>
            </div>
        </div>



    </body>
</html>
