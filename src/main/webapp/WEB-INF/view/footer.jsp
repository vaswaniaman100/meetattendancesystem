{% load static %}



<div class="mt-3" style="background-color : black ; width:100% ; height:350px">
<div class="container">
    <div class="row">
        <div class="col-md-4 mt-3">
            <h3 class="text-white">Contact Information</h3>
            <p style="color : yellow ; font-size : 18px"><i class="fa fa-map-marker text-danger"></i> Shivajinagar Pune</p>
            <p style="color : yellow ; font-size : 18px"><i class="fa fa-envelope text-danger"></i>aman.4@gmail.com</p>
            <p style="color : yellow ; font-size : 18px"><i class="fa fa-mobile text-danger"></i> P: +91 8459107455 / +91 9021491272</p>
            <p style="color : yellow ; font-size : 18px"><i class="fa fa-globe text-danger"></i> W: www.E-placement.com</p>
        </div>
        <div class="col-md-4 mt-3">
            <h3 class="text-white">Meet Attendance</h3>
            <p style="color : yellow ; font-size : 18px"> </p>

        </div>
        <div class="col-md-4 mt-3">
            <h3 class="text-white">Newsletter</h3>
            <p style="color : yellow ; font-size : 18px">If you want the any extra information then send me your Email ID</p>
            <form method="post" class="form-inline">
                {% csrf_token %}
                <input type="email" name="emailid" placeholder="Email ID" required class="form-control mr-2">
                <input type="Submit" value="Send" class="btn btn-primary">

            </form>

        </div>
    </div>
</div>
</div>
