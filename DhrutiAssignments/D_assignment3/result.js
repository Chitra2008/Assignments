window.addEventListener('load', () => {

    // Via Query parameters - GET
    /* const params = (new URL(document.location)).searchParams;
    const name = params.get('name');
    const surname = params.get('surname'); */

    // Via local Storage
    /* const name = localStorage.getItem('NAME');
    const surname = localStorage.getItem('SURNAME'); */
    
    const name = sessionStorage.getItem('NAME');
    const email = sessionStorage.getItem('EMAIL');
    const phone = sessionStorage.getItem('PHONE');
    const gender = sessionStorage.getItem('GENDER');
    const birthday = sessionStorage.getItem('BIRTHDAY');
    const dept = sessionStorage.getItem('DEPT');
    
    document.getElementById('result-name').innerHTML = name;
    document.getElementById('result-email').innerHTML = email;
    document.getElementById('result-phone').innerHTML = phone;
    document.getElementById('result-gender').innerHTML = gender;
    document.getElementById('result-birthday').innerHTML = birthday;
    document.getElementById('result-dept').innerHTML = dept;

})