const formSelect = document.querySelector(".form-select");
const formBtn = document.querySelector(".form-btn");
const info = document.querySelector(".info");
const info2 = document.querySelector(".info2");
const container = document.querySelector(".container");

function formClick() {

    const product_name = document.getElementById('product_name').value;
    const date = document.getElementById("select").value;

    fetch(`./php/request_bd.php?dat=${date}`).then(function(resp) {
        return (resp.json());
    }).then(function(data) {
        let priceDay = ((data.price / 100) * 30) + parseInt(data.price);
        info.innerHTML = `<p>Цена:${priceDay}</p>`;
        container.classList.remove('display-none');
        container.classList.add('display');
    }).catch(function(data) {
        console.log("Неправильный запрос");
    });
    fetch(`./php/sklad_bd.php?product_name=${product_name}`).then(function(resp) {
        return (resp.json());
    }).then(function(data) {
        info2.innerHTML = `<p>Количество на складе:${data.remains}</p>`;
    }).catch(function(data) {
        console.log("Неправильный запрос");
    });

}

formBtn.addEventListener("click", formClick);