/* All scripts and code used here are (c) copyright 2005 C. Porter and may not be used elsewhere without written permission. All rights reserved. */
/* RPC remote scripting 04/02/2005 */
if (top.frames.length > 1) {top.location="http://www.subnet-calculator.com/";} // break out of frames

function valueChange(index)
{
    document.getElementById("field_change").value=index;
    document.forms['calculator'].submit();
}
function updateCalc(oct_range, ipaddr, index, hexaddr, inverted, range, network, broadcastaddr, bitmap)
{
    document.getElementById("oct_range").value=oct_range;
    document.getElementById("ip_addr").value=ipaddr;
    document.getElementById("hex_addr").value=hexaddr;
    document.getElementById("subnet_mask").value=index;
    document.getElementById("inverted_mask").value=inverted;
    document.getElementById("subnet_bits").value=index;
    document.getElementById("mask_bits").value=index;
    document.getElementById("max_subnets").value=index;
    document.getElementById("max_hosts").value=index;
    document.getElementById("host_range").value=range;
    document.getElementById("subnet_id").value=network;
    document.getElementById("broadcast_addr").value=broadcastaddr;
// document.getElementById("subnet_bitmap").value=bitmap;
    document.getElementById("subnet_bitmap").innerHTML=bitmap;
}

function class_a_click() {
    document.calculator.class_a.checked=true;
    document.calculator.class_b.checked=false;
    document.calculator.class_c.checked=false;
    window.location = "subnet.php?net_class=A";
}
function class_b_click() {
    document.calculator.class_a.checked=false;
    document.calculator.class_b.checked=true;
    document.calculator.class_c.checked=false;
    window.location = "subnet.php?net_class=B";
}
function class_c_click() {
    document.calculator.class_a.checked=false;
    document.calculator.class_b.checked=false;
    document.calculator.class_c.checked=true;
    window.location = "subnet.php?net_class=C";
}