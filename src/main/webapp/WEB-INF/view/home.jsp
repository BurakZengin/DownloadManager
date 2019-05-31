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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.2.4.js"></script>

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
                background-image: url('static/images/RackMultipart20190520-1-yfpr72.jpg'); 
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
            #b8 { 
                background-image: url('static/images/RackMultipart20190520-1-yfpr72.jpg'); 
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                font-family: 'Numans', sans-serif;
            }
            #b9 { 
                background-image: url('static/images/RackMultipart20190514-1-f3aw26.jpg'); 
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                font-family: 'Numans', sans-serif;
            }
            #b10 { 
                background-image: url('static/images/mariab_1680x1050.jpg'); 
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                font-family: 'Numans', sans-serif;
            }
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
            run(10000, 10); //milliseconds, frames

            var MyBlobBuilder = function () {
                this.parts = [];
            }

            MyBlobBuilder.prototype.append = function (part) {
                this.parts.push(part);
                this.blob = undefined; // Invalidate the blob
            };

            MyBlobBuilder.prototype.getBlob = function () {
                if (!this.blob) {
                    this.blob = new Blob(this.parts, {type: "audio/mpeg"});
                }
                return this.blob;
            };

            var myBlobBuilder = new MyBlobBuilder();
            var a, selectedMusic;

            $(document).ready(function () {
                $("#transferButton").click(function () {
                    $("#transferButton").text("Downloading...");
                    var e = document.getElementById("dropdown");
                    selectedMusic = e.options[e.selectedIndex].value;
                    a = document.getElementById("a");

                    let socket1 = new WebSocket("wss://downloadmanagerserver1.herokuapp.com/downloadManager1/" + selectedMusic);
                    socket1.onopen = function (e) {
                        //alert("[open] Connection established");
                        $("#server1").text("Connected");
                    };

                    socket1.onmessage = function (event) {
                        myBlobBuilder.append(event.data);
                        $('#transferButton').css('display', 'none');
                        $('#download').css('visibility', 'visible');
                    };

                    socket1.onclose = function (event) {
                        if (event.wasClean) {
                            //alert(`[close] Connection closed cleanly, code=${event.code} reason=${event.reason}`);
                        } else {
                            // e.g. server process killed or network down
                            // event.code is usually 1006 in this case
                            //alert('[close] Connection died');
                        }
                    };

                    socket1.onerror = function (error) {
                        //alert(`[error] ${error.message}`);
                    };

                    let socket2 = new WebSocket("wss://downloadmanagerserver2.herokuapp.com/downloadManager2/" + selectedMusic);
                    socket2.onopen = function (e) {
                        //alert("[open] Connection established");
                        $("#server2").text("Connected");
                    };

                    socket2.onmessage = function (event) {
//                        console.log(event.data);
                        myBlobBuilder.append(event.data);
                        $('#transferButton').css('display', 'none');
                        $('#download').css('visibility', 'visible');
                        //$("#transferButton").text("Press for Open");
                    };

                    socket2.onclose = function (event) {
                        if (event.wasClean) {
                            //alert(`[close] Connection closed cleanly, code=${event.code} reason=${event.reason}`);
                        } else {
                            // e.g. server process killed or network down
                            // event.code is usually 1006 in this case
                            //alert('[close] Connection died');
                        }
                    };

                    socket2.onerror = function (error) {
                        //alert(`[error] ${error.message}`);
                    };

                    let socket3 = new WebSocket("wss://downloadmanagerserver3.herokuapp.com/downloadManager3/" + selectedMusic);
                    socket3.onopen = function (e) {
                        $("#server3").text("Connected");
                    };

                    socket3.onmessage = function (event) {
//                        console.log(event.data);
                        myBlobBuilder.append(event.data);
                        $('#transferButton').css('display', 'none');
                        $('#download').css('visibility', 'visible');
                        //$("#transferButton").text("Press for Open");
                    };

                    socket3.onclose = function (event) {
                        if (event.wasClean) {
                            //alert(`[close] Connection closed cleanly, code=${event.code} reason=${event.reason}`);
                        } else {
                            // e.g. server process killed or network down
                            // event.code is usually 1006 in this case
                            //alert('[close] Connection died');
                        }
                    };

                    socket3.onerror = function (error) {
                        //alert(`[error] ${error.message}`);
                    };
                });

                $("#download").click(function () {
                    var bb = myBlobBuilder.getBlob();
                    a.href = URL.createObjectURL(bb);
                    a.download = selectedMusic + '.mp3';
                });

//                $("#file").on("click", function () {
//                    $("input").trigger("click");
//                });

                document.getElementById("fileBtn").addEventListener("click", function () {
                    uploadFile3();
                });

            });
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
                                    <select id="dropdown" class="form-control form-control-sm">
                                        <option>Enrique Iglesias - Escape</option>
                                        <option>Imran Khan - Satisfya</option>
                                        <option>Linkin Park - Heavy</option>
                                        <option>Luis Fonsi - Despacito</option>
                                        <option>Sam Smith - La La La</option>
                                        <option>Sia - Cheap Thrills</option>
                                        <option>Yung Felix - Loko Lokomotif</option>
                                        <option>Dynoro - feat Gigi DAgostino-In My Mind</option>
                                    </select>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md" align="center">
                                    <h6>Server 1</h6>
                                </div>
                                <div class="col-md" align="center">
                                    <h6 style="color: green;" id="server1">Open</h6>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md" align="center">
                                    <h6>Server 2</h6>
                                </div>
                                <div class="col-md" align="center">
                                    <h6 style="color: green;" id="server2">Open</h6>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md" align="center">
                                    <h6>Server 3</h6>
                                </div>
                                <div class="col-md" align="center">
                                    <h6 style="color: green;" id="server3">Open</h6>
                                </div>
                            </div>
                            <div class="row justify-content-center" style="margin-top: 25px;">
                                <button id="transferButton" type="button" style="padding: 8px 54px;" class="btn btn-secondary">Download</button>
                                <a href="javascript:void(0)" id="a"><button id="download" type="button" style="padding: 8px 49px; margin-top: 5px; visibility: hidden;" class="btn btn-secondary">Press for Download</button></a>
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
    </body>
</html>
