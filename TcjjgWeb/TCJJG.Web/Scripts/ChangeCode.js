/// is not index and login

function ChangeCode() {
    document.getElementById('imgCode').src = '/UserCenter/ValidateCode.aspx?' + Math.random();
}
