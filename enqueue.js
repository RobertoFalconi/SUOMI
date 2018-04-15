"use strict";

var isEnqueued = false;

function enqueue() {
    if (isEnqueued){
        if(confirm("Are you sure?")){
            document.getElementById("you").innerHTML = "<input type=\"button\" class=\"button\" value=\"Enqueue\" id=\"en_button\" onclick=\"enqueue()\"/>";
            isEnqueued = false;
            
        }
    } else {
        if(confirm("Are you sure?")){
            document.getElementById("you").innerHTML = "You! &nbsp;&nbsp;&nbsp;&nbsp; <input type=\"button\" class=\"button\" value=\"Delete\" id=\"en_button\" onclick=\"enqueue()\"/> &nbsp;&nbsp;&nbsp;&nbsp; <input type=\"button\" class=\"button\" value=\"Make an order!\" id=\"en_button\" onclick=\"go_restaurant()()\"/>";
            isEnqueued = true;
            
        }
    }
}