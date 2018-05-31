"use strict";

var isEnqueuedSpa = false;
var isEnqueuedRes = false;

function enqueue_spa() {
    if (isEnqueuedSpa){
        if(confirm("Are you sure?")){
            document.getElementById("you").innerHTML = "<input type=\"button\" class=\"button\" value=\"Enqueue\" id=\"en_button\" onclick=\"enqueue_spa()\"/>";
            isEnqueuedSpa = false;
            
        }
    } else {
        if(confirm("Are you sure?")){
            document.getElementById("you").innerHTML = "You! &nbsp;&nbsp;&nbsp;&nbsp; <input type=\"button\" class=\"button\" value=\"Delete\" id=\"en_button\" onclick=\"enqueue_spa()\"/>";
            isEnqueuedSpa = true;
            
        }
    }
}

function enqueue_relax() {
    if (isEnqueuedRes){
        if(confirm("Are you sure?")){
            document.getElementById("you").innerHTML = "<input type=\"button\" class=\"button\" value=\"Enqueue\" id=\"en_button\" onclick=\"enqueue_relax()\"/>";
            isEnqueuedRes = false;
            
        }
    } else {
        if(confirm("Are you sure?")){
            document.getElementById("you").innerHTML = "You! &nbsp;&nbsp;&nbsp;&nbsp; <input type=\"button\" class=\"button\" value=\"Delete\" id=\"en_button\" onclick=\"enqueue_relax()\"/> &nbsp;&nbsp;&nbsp;&nbsp; <input type=\"button\" class=\"button\" value=\"Make an order!\" id=\"en_button\" onclick=\"go_restaurant()()\"/>";
            isEnqueuedRes = true;
            
        }
    }
}

function logout(){
    if (confirm("Are you sure?")){
        window.location.href = "login.html";
    }
}