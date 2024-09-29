/* Lab 5 JavaScript File 
   Place variables and functions in this file */

function validate(formObj) {
   // put your validation code here
   // it will be a series of if statements
   let output = "";
   if (formObj.comments.value == "" || formObj.comments.value == "Please enter your comments") {
      output = "You must enter comments\n" + output;
      formObj.comments.focus();
   }
   if (formObj.pseudonym.value == "") {
      output = "You must enter a nickname\n" + output;
      formObj.pseudonym.focus();
   }
   if (formObj.org.value == "") {
      output = "You must enter an organization\n" + output;
      formObj.org.focus();
   }
   if (formObj.title.value == "") {
      output = "You must enter a title\n" + output;
      formObj.title.focus();
   }
   if (formObj.lastName.value == "") {
      output = "You must enter a last name\n" + output;
      formObj.lastName.focus();
   }
   if (formObj.firstName.value == "") {
      output = "You must enter a first name\n" + output;
      formObj.firstName.focus();
   }
   if (output != ""){
      alert(output)
      return false;
   }
   alert("Form sucessfully submitted")
   return true;
}
function updateText(){
   let currenttext = document.getElementById("comments");
   switch (currenttext.value){
      case (""):
         currenttext.value = "Please enter your comments";
         break;
      case ("Please enter your comments"):
         currenttext.value = "";
         break;
   }
}
function clickMe(){
   let out = document.getElementById("firstName").value + " " + document.getElementById("lastName").value + " is " + document.getElementById("pseudonym").value;
   alert(out);
}
