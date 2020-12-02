$(function() {
    $(".header").load("header.html");
    $(".main").load("home.html");
    $(".footer").load("footer.html");
});
var input = $('.validate-input .input100');

$('.validate-form').on('submit',function(){
    var check = true;

    for(var i=0; i<input.length; i++) {
        if(validate(input[i]) == false){
            showValidate(input[i]);
            check=false;
        }
    }

    return check;
});


$('.validate-form .input100').each(function(){
    $(this).focus(function(){
       hideValidate(this);
    });
});

function validate (input) {
    if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
        if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
            return false;
        }
    }
    else {
        if($(input).val().trim() == ''){
            return false;
        }
    }
}

function showValidate(input) {
    var thisAlert = $(input).parent();

    $(thisAlert).addClass('alert-validate');
}

function hideValidate(input) {
    var thisAlert = $(input).parent();

    $(thisAlert).removeClass('alert-validate');
}


function clickLogin() {
    $(".header").load("header.html");
    $(".main").load("login.html");
    $(".footer").load("footer.html");
}

function clickHome() {
    $(".header").load("header.html");
    $(".main").load("home.html");
    $(".footer").load("footer.html");
}

function clickAbout() {
    $(".container").load("viewlist.html");
    buildTable();
}


function reloadMain(){
    $(".main").load("home.html"); // Redirecting to other page.

}

function login(){
    var username = document.getElementById("email").value;
    var password = document.getElementById("pass").value;

    if ( username == "chuoichamchap" && password == "123"){
        reloadMain();
        return false;
        }else{
            alert("Nhap sai! Moi nhap lai!")
        }

}

function getIt(){
    $(".container").load("detail.html");

}


var books = [];
var counter = 0;

function book(name, price, description, stock) {
    this.id = ++counter;
    this.name = name;
    this.price = price;
    this.description = description;
    this.stock = stock
}

function initbooks() {
    if (null == books || books.length == 0) {
        // init data
        books.push(new book("Java Core", "$60", "Java the good begining","30"));
        books.push(new book("Java Core", "$60", "Java the good begining","30"));
        books.push(new book("Java Core", "$60", "Java the good begining","30"));
    }
}

function buildTable() {
    setTimeout(function name(params) {

        $('tbody').empty();
        initbooks();

        books.forEach(function(item) {
            $('tbody').append(
                '<tr>' +
                '<td>' + item.name + '</td>' +
                '<td>' + item.price + '</td>' +
                '<td>' + item.description + '</td>' +
                '<td>' + item.stock + '</td>' +
                '<td>' +
                '<a class="edit" title="Edit" data-toggle="tooltip" onclick="openUpdateModal(' + item.id + ')"><i class="material-icons">&#xE254;</i></a>' +
                '<a class="delete" title="Delete" data-toggle="tooltip" onClick="openConfirmDelete(' + item.id + ')"><i class="material-icons">&#xE872;</i></a>' +
                '</td>' +
                '</tr>')
        });

    }, 500);
}

function openAddModal() {
    resetForm();
    openModal();
}

function resetForm() {
    document.getElementById("id").value = "";
    document.getElementById("name").value = "";
    document.getElementById("price").value = "";
    document.getElementById("description").value = "";
    document.getElementById("stock").value = "";
}

function openModal() {
    $('#myModal').modal('show');
}

function hideModal() {
    $('#myModal').modal('hide');
}

function addbook() {
    var name = document.getElementById("name").value;
    var price = document.getElementById("price").value;
    var description = document.getElementById("description").value;

    // TODO validate
    // then fail validate ==> return;

    books.push(new book(name,price, description, stock));

    hideModal();
    showSuccessAlert();
    buildTable();
}

function openUpdateModal(id) {

    // get index from book's id
    var index = books.findIndex(x => x.id == id);

    // fill data
    document.getElementById("id").value = books[index].id;
    document.getElementById("name").value = books[index].name;
    document.getElementById("price").value = books[index].price;
    document.getElementById("description").value = books[index].description;
    document.getElementById("stock").value = books[index].stock;

    openModal();
}

function save() {
    var id = document.getElementById("id").value;

    if (id == null || id == "") {
        addbook();
    } else {
        updatebook();
    }
}

function updatebook() {
    var id = document.getElementById("id").value;
    var name = document.getElementById("name").value;
    var price = document.getElementById("price").value;
    var description = document.getElementById("description").value;
    var stock = document.getElementById("stock").value;

    // TODO validate
    // then fail validate ==> return;

    // get index from book's id
    var index = books.findIndex(x => x.id == id);

    // update book
    books[index].name = name;
    books[index].price = price;
    books[index].description = description;
    books[index].stock = stock;
  

    hideModal();
    showSuccessAlert();
    buildTable();
}


function openConfirmDelete(id) {
    // get index from book's id
    var index = books.findIndex(x => x.id == id);
    var name = books[index].name;

    var result = confirm("Want to delete " + name + "?");
    if (result) {
        deletebook(id);
    }
}

function deletebook(id) {
    // TODO validate
    var index = books.findIndex(x => x.id === id);
    books.splice(index, 1);

    showSuccessAlert();
    buildTable();
}

function showSuccessAlert() {
    $("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
        $("#success-alert").slideUp(500);
    });
}
function buy(){
    showSuccessAlert();
    clickHome()

}