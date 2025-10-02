function validation()
{
let regform = document.getElementById("myreg");

let name = regform.name.value;
let email = regform.email.value;
let password = regform.password.value;
let gender = regform.gender.value;
let city = regform.city.value;
let fields = document.querySelectorAll('input[name="fields"]:checked');

let errorMsg = document.getElementById("error");

const namepattern = /^[A-Za-z\s]{3,30}$/;
const emailpattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
const passwordpattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,16}$/;

let doisubmit = true;

if(name === "" || !name.match(namepattern))
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Name cannot be empty and must contain only letters and spaces";
    doisubmit = false;
}
else if(email === "" || !email.match(emailpattern))
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Email cannot be empty and must be valid";
    doisubmit = false;
}
else if(password === "" || !password.match(passwordpattern))
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Password must be at least 8 characters and include uppercase, lowercase, number, and special character";
    doisubmit = false;
}
else if(gender === "")
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Please select gender";
    doisubmit = false;
}
else if(city === "")
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Please select city";
    doisubmit = false;
}
else if(fields.length === 0)
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Please select atleast one field";
    doisubmit = false;
}

	return doisubmit;
}

function val()
{
let errorMsg = document.getElementById("error");
errorMsg.parentElement.classList.remove("show");
errorMsg.parentElement.classList.add("d-none");
errorMsg.textContent="";
}function validation()
{
let regform = document.getElementById("myreg");

let name = regform.name.value;
let email = regform.email.value;
let password = regform.password.value;
let gender = regform.gender.value;
let city = regform.city.value;
let fields = document.querySelectorAll('input[name="fields"]:checked');

let errorMsg = document.getElementById("error");

const namepattern = /^[A-Za-z\s]{3,30}$/;
const emailpattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
const passwordpattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,16}$/;

let doisubmit = true;

if(name === "" || !name.match(namepattern))
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Name cannot be empty and must contain only letters and spaces";
    doisubmit = false;
}
else if(email === "" || !email.match(emailpattern))
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Email cannot be empty and must be valid";
    doisubmit = false;
}
else if(password === "" || !password.match(passwordpattern))
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Password must be at least 8 characters and include uppercase, lowercase, number, and special character";
    doisubmit = false;
}
else if(gender === "")
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Please select gender";
    doisubmit = false;
}
else if(city === "")
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Please select city";
    doisubmit = false;
}
else if(fields.length === 0)
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Please select atleast one field";
    doisubmit = false;
}

	return doisubmit;
}

function val()
{
let errorMsg = document.getElementById("error");
errorMsg.parentElement.classList.remove("show");
errorMsg.parentElement.classList.add("d-none");
errorMsg.textContent="";
}function validation()
{
let regform = document.getElementById("myreg");

let name = regform.name.value;
let email = regform.email.value;
let password = regform.password.value;
let gender = regform.gender.value;
let city = regform.city.value;
let fields = document.querySelectorAll('input[name="fields"]:checked');

let errorMsg = document.getElementById("error");

const namepattern = /^[A-Za-z\s]{3,30}$/;
const emailpattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
const passwordpattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,16}$/;

let doisubmit = true;

if(name === "" || !name.match(namepattern))
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Name cannot be empty and must contain only letters and spaces";
    doisubmit = false;
}
else if(email === "" || !email.match(emailpattern))
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Email cannot be empty and must be valid";
    doisubmit = false;
}
else if(password === "" || !password.match(passwordpattern))
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Password must be at least 8 characters and include uppercase, lowercase, number, and special character";
    doisubmit = false;
}
else if(gender === "")
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Please select gender";
    doisubmit = false;
}
else if(city === "")
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Please select city";
    doisubmit = false;
}
else if(fields.length === 0)
{
    errorMsg.parentElement.classList.add("show");
    errorMsg.parentElement.classList.remove("d-none");
    errorMsg.textContent="Please select atleast one field";
    doisubmit = false;
}

	return doisubmit;
}

function val()
{
let errorMsg = document.getElementById("error");
errorMsg.parentElement.classList.remove("show");
errorMsg.parentElement.classList.add("d-none");
errorMsg.textContent="";
}