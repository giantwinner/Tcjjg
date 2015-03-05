/// is not index and login

function ChangeCode() {
    document.getElementById('imgCode').src = '/Index/ValidateCode.aspx?' + Math.random();
}
