<%-- 
    Document   : home
    Created on : May 22, 2019, 7:45:47 PM
    Author     : burakzengin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Download Manager</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap -->
        <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="static/fontawesome/css/fontawesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

        <style>
            .btn-circle {
                width: 30px;
                height: 30px;
                text-align: center;
                padding: 6px 0;
                font-size: 12px;
                line-height: 1.428571429;
                border-radius: 15px;
            }
            .btn-circle.btn-lg {
                width: 50px;
                height: 50px;
                padding: 10px 16px;
                font-size: 18px;
                line-height: 1.33;
                border-radius: 25px;
            }
            html,body{ 
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                font-family: 'Numans', sans-serif;
            }
            .vertical-center {
                min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
                min-height: 100vh; /* These two lines are counted as one :-)       */
                display: flex;
                align-items: center;
            }
            ul {
                height:200px; width:100%;
                overflow:hidden; overflow-y:scroll;
            }

            #b1 { 
                background-image: url('static/images/moshtari_1280x800.jpg'); 
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                font-family: 'Numans', sans-serif;
            }
            #b2 { background-image: url('static/images/tylerm_1280x800.jpg'); 
                  background-size: cover;
                  background-repeat: no-repeat;
                  height: 100%;
                  font-family: 'Numans', sans-serif;
            }
            #b3 { 
                background-image: url('static/images/yongjulee_1280x800.jpg'); 
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                font-family: 'Numans', sans-serif;
            }
            #b4 { 
                background-image: url('static/images/cashflow_1280x800.jpg'); 
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                font-family: 'Numans', sans-serif;
            }
            #b5 { 
                background-image: url('static/images/koffee_1280x800.jpg'); 
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                font-family: 'Numans', sans-serif;
            }
            #b6 { 
                background-image: url('static/images/dante_1680x1050.jpg'); 
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                font-family: 'Numans', sans-serif;
            }
            #b7 { 
                background-image: url('static/images/mariab_1680x1050.jpg'); 
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                font-family: 'Numans', sans-serif;
            }
            #b8 { background: hsl(210, 50%, 50%); }
            #b9 { background: hsl(240, 50%, 50%); }
            #b10 { background: hsl(270, 50%, 50%); }
        </style>

        <script>
            function run(interval, frames) {
                var int = 1;
                function func() {
                    document.body.id = "b" + int;
                    int++;
                    if (int === frames) {
                        int = 1;
                    }
                }
                var swap = window.setInterval(func, interval);
            }
            run(7000, 10); //milliseconds, frames
        </script>
    </head>
    <body>
        <div class="row">
            <div class="col-md" style="margin-top: 10px; margin-left: 15px;">

            </div>
            <div class="col-md"></div>
            <div class="col-md" style="margin-top: 10px; margin-right: 10px;" align="right">
                <button type="button" class="btn btn-light">About Project</button>
                <button type="button" class="btn btn-light">Download Project</button>
            </div>
        </div>
        <div class="container vertical-center">
            <div class="row">
                <div class="col-md">
                    <div class="card" style="width: 22rem; height: 550px;">
                        <div class="card-body">
                            <div class="row" style="margin-top: 75px; margin-bottom: 75px;">
                                <div class="col-md-3" style="margin-left: 10px;">
                                    <button id="file" type="button" class="btn btn-primary btn-circle btn-lg"><i class="fa fa-plus"></i></button>
                                </div>
                                <div class="col-md-7" style="margin-top: 13px;">
                                    <p class="card-text" style="font-size:19px;">Add your music</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row justify-content-center" style="margin-top: 35px; margin-bottom: 35px;">
                                <div class="col-md-10">
                                    <select class="form-control form-control-sm">
                                        <option>To Be in Mara - Stavroz</option>
                                        <option>The Finishing - Stavroz</option>
                                        <option>Gold Town - Stavroz</option>
                                        <option>The Ginning - Stavroz</option>
                                        <option>The Finishing - Stavroz</option>
                                        <option>Gold Town - Stavroz</option>
                                        <option>The Ginning - Stavroz</option>
                                        <option>The Finishing - Stavroz</option>
                                        <option>Gold Town - Stavroz</option>
                                        <option>The Ginning - Stavroz</option>
                                    </select>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md">
                                    <h6>Server 1</h6>
                                </div>
                                <div class="col-md">
                                    <h6 style="color: green;">Connected</h6>
                                </div>
                                <div class="col-md">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md">
                                    <h6>Server 2</h6>
                                </div>
                                <div class="col-md">
                                    <h6 style="color: green;">Connected</h6>
                                </div>
                                <div class="col-md">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md">
                                    <h6>Server 3</h6>
                                </div>
                                <div class="col-md">
                                    <h6 style="color: green;">Connected</h6>
                                </div>
                                <div class="col-md">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center" style="margin-top: 25px;">
                                <form id="transferButton" action="Transfer" method="POST">
                                    <button type="submit" style="padding: 8px 54px;" class="btn btn-secondary">Transfer</button>
                                </form>
                            </div>
                            <input type="file" style="display: none" />
                        </div>
                    </div>
                </div>
                <div class="col-md"></div>
                <div class="col-md"></div>
            </div>
        </div>

        <!-- Bootstrap -->
        <script src="static/bootstrap/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
        <script>
            $("#file").on("click", function () {
                $("input").trigger("click");
            });
        </script>
    </body>
</html>
