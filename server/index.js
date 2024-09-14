const express = require('express')

console.log(express)

let i = 1
function f() {
    console.log(i++)
    setTimeout(f, 1000);
}
f()