"use strict";

var isEnqueued = false;

function enqueue() {
    if (isEnqueued){
        if(confirm("Are you sure?")){
            document.getElementById("you").innerHTML = "<input type=\"button\" value=\"Enqueue\" id=\"en_button\" onclick=\"enqueue()\"/>";
            isEnqueued = false;
        }
    } else {
        if(confirm("Are you sure?")){
            document.getElementById("you").innerHTML = "You! <input type=\"button\" value=\"Delete\" id=\"en_button\" onclick=\"enqueue()\"/>";
            isEnqueued = true;
        }
    }
}