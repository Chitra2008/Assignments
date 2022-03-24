function handleSubmit () {
    const name = document.getElementById('ename').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const gender = document.getElementById('customRadio').value;
    const gender2 = document.getElementById('customRadio2').value;
    const birthday = document.getElementById('birthday').value;
    const dept = document.getElementById('dept').value;

    // to set into local storage
     
    sessionStorage.setItem("NAME", name);
    sessionStorage.setItem("EMAIL", email);
    sessionStorage.setItem("PHONE", phone);


    
    if(document.getElementById('customRadio').checked) {
        //Female radio button is checked 
        sessionStorage.setItem("GENDER", gender);
        }else if(document.getElementById('customRadio2').checked) {
        //Male radio button is checked
        sessionStorage.setItem("GENDER", gender2);
    }
    sessionStorage.setItem("BIRTHDAY", birthday);
    sessionStorage.setItem("DEPT", dept);

    return;
}