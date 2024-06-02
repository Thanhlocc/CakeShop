<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="control.*"%>
<%@page import="model.*"%>
<%@page import = "java.util.*"%>
<!--<aside class="sidebar" style="position: fixed">
    <div class="sidebar-container">
        <div class="sidebar-header">
            <div class="brand">
                <div class="logo" style="background-image: url('../img/logo.png'); background-size: contain"></div>Administrator
            </div>
        </div>
        <nav class="menu">
            <ul class="sidebar-menu metismenu" id="sidebar-menu">
                <li>
                    <a href="./PageDirect?page=dashboard">
                        <i class="fa fa-home"></i> Dashboard </a>
                </li>
                <li class="active open">
                    <a href="">
                        <i class="fa fa-tag"></i> Items Manager <i class="fa arrow"></i>
                    </a>
                    <ul class="sidebar-nav">
                        <li class="active">
                            <a href="./PageDirect?page=itemlist"> Items List </a>
                        </li>
                        <li>
                            <a href="./PageDirect?page=itemeditor"> Item Editor </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="">
                        <i class="fa fa-group"></i> Custommer Manager <i class="fa arrow"></i>
                    </a>
                    <ul class="sidebar-nav">
                        <li>
                            <a href="./PageDirect?page=customerlist"> Custommer List </a>
                        </li>
                        <li>
                            <a href="./PageDirect?page=customereditor"> Custommer Editor </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="">
                        <i class="fa fa-user"></i> Employee Manager <i class="fa arrow"></i>
                    </a>
                    <ul class="sidebar-nav">
                        <li>
                            <a href="./PageDirect?page=employeelist"> Employee List </a>
                        </li>
                        <li>
                            <a href="./PageDirect?page=employeeeditor"> Employee Editor </a>
                        </li>
                    </ul>
                </li> 
            </ul>
        </nav>
    </div>
</aside>
<div class="sidebar-overlay" id="sidebar-overlay"></div>
<div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
<div class="mobile-menu-handle"></div>-->
<article class="content items-list-page">
    <div class="title-search-block">
        <div class="title-block">
            <div class="row">
                <div class="col-md-6">
                    <h3 class="title"> Quản lí khách hàng <a href="./PageDirect?page=customereditor" class="btn btn-primary btn-sm rounded-s"> Thêm khách hàng </a>
                        <!--
                        -->
                        <!--                        <div class="action dropdown">
                                                    <button class="btn  btn-sm rounded-s btn-secondary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> More actions... </button>
                                                    <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                        <a class="dropdown-item" href="#"><i class="fa fa-pencil-square-o icon"></i>Mark as a draft</a>
                                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#confirm-modal"><i class="fa fa-close icon"></i>Delete</a>
                                                    </div>
                                                </div>-->
                    </h3>
                    <p class="title-description">Danh sách khách hàng</p>
                </div>
            </div>
        </div>
        <div class="items-search">
            <form class="form-inline">
                <div class="input-group">
                    <input type="text" class="form-control boxed rounded-s" placeholder="Search for...">
                    <span class="input-group-btn">
                        <button class="btn btn-secondary rounded-s" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
            </form>
        </div>
    </div>
    <div class="card items">
        <ul class="item-list striped">
            <li class="item item-list-header">
                <div class="item-row">
                    <!--                    <div class="item-col fixed item-col-check">
                                            <label class="item-check" id="select-all-items">
                                                <input type="checkbox" class="checkbox">
                                                <span></span>
                                            </label>
                                        </div>-->
                    <div class="item-col item-col-header item-col-stats">
                        <div>
                            <span>Mã khách hàng</span>
                        </div>
                    </div>
                    <div class="item-col item-col-header item-col-title">
                        <div>
                            <span>Tên khách hàng</span>
                        </div>
                    </div>
                    <div class="item-col item-col-header item-col-stats">
                        <div>
                            <span>Giới tính</span>
                        </div>
                    </div>
                    <div class="item-col item-col-header item-col-stats">
                        <div class="no-overflow">
                            <span>SĐT</span>
                        </div>
                    </div>
                    <div class="item-col item-col-header item-col-stats">
                        <div class="no-overflow">
                            <span>Email</span>
                        </div>
                    </div>
                    <div class="item-col item-col-header item-col-stats">
                        <div class="no-overflow">
                            <span>Địa chỉ</span>
                        </div>
                    </div>
                    <div class="item-col item-col-header item-col-stats">
                        <div>
                            <span> Tài khoản </span>
                        </div>
                    </div>
                    <div class="item-col item-col-header fixed item-col-actions-dropdown">
                    </div>
                </div>
            </li>
            <c:forEach var="kh" items="${listKH}">
                <li class="item">
                    <div class="item-row">
                        <!--                    <div class="item-col fixed item-col-check">
                                                <label class="item-check" id="select-all-items">
                                                    <input type="checkbox" class="checkbox">
                                                    <span></span>
                                                </label>
                                            </div>-->
                        <div class="item-col item-col-header item-col-stats">
                            <div>
                                <span>${kh.getMaKhachHang()}</span>
                            </div>
                        </div>
                        <div class="item-col fixed pull-left item-col-title">
                            <!--<div class="item-heading">Name</div>-->
                            <div>
                                <a href="./PageDirect?page=customerupdate&id=${kh.getMaKhachHang()}" class="" style="text-decoration: none">
                                    <h4 class="item-title"> ${kh.getHoVaTen()}</h4>
                                </a>
                            </div>
                        </div>
                        <div class="item-col item-col-stats">
                            <!--<div class="item-heading">Số lượng</div>-->
                            <div> ${kh.getGioiTinh()} </div>
                        </div>
                        <div class="item-col item-col-stats no-overflow">
                            <!--<div class="item-heading">Stats</div>-->
                            <div class="no-overflow">
                                <div>${kh.getSoDienThoai()}</div>
                            </div>
                        </div>
                        <div class="item-col item-col-stats no-overflow">
                            <!--<div class="item-heading">Category</div>-->
                            <div class  ="no-overflow">
                                <a style="text-decoration: none">${kh.getEmail()}</a>
                            </div>
                        </div>
                        <div class="item-col item-col-stats">
                            <!--<div class="item-heading">Author</div>-->
                            <div class="no-overflow">
                                ${kh.getDiaChi()}
                            </div>
                        </div>
                        <div class="item-col item-col-stats">
                            <!--<div class="item-heading">Published</div>-->
                            <div class="no-overflow"> ${kh.getTaiKhoan().getTenTaiKhoan()}</div>
                        </div>
                        <div class="item-col fixed item-col-actions-dropdown">
                            <div class="item-actions-dropdown">
                                <a class="item-actions-toggle-btn">
                                    <span class="inactive">
                                        <i class="fa fa-cog"></i>
                                    </span>
                                    <span class="active">
                                        <i class="fa fa-chevron-circle-right"></i>
                                    </span>
                                </a>
                                <div class="item-actions-block">
                                    <ul class="item-actions-list">
                                        <li>
                                            <a class="remove" href="#" data-customer-id="${kh.getMaKhachHang()}" data-toggle="modal" data-target="#confirm-modal">
                                                <i class="fa fa-trash-o "></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="edit" data-customer-id="${kh.getMaKhachHang()}" style="cursor: pointer">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="modal fade" id="confirm-modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"><i class="fa fa-warning"></i> Alert</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Are you sure want to do this?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="confirmDelete()">Yes</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                </div>
            </div>
        </div>
    </div>
    <nav class="text-right">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href=""> Prev </a>
            </li>
            <li class="page-item active">
                <a class="page-link" href=""> 1 </a>
            </li>
            <li class="page-item">
                <a class="page-link" href=""> 2 </a>
            </li>
            <li class="page-item">
                <a class="page-link" href=""> 3 </a>
            </li>
            <li class="page-item">
                <a class="page-link" href=""> 4 </a>
            </li>
            <li class="page-item">
                <a class="page-link" href=""> 5 </a>
            </li>
            <li class="page-item">
                <a class="page-link" href=""> Next </a>
            </li>
        </ul>
    </nav>
</article>
<script>
    var MaKhachHang;
    $('.edit').on('click', function () {
        MaKhachHang = $(this).data('customer-id');

        window.location.href = './PageDirect?page=customerupdate&id=' + MaKhachHang;
    });
    $('.remove').on('click', function () {
        MaKhachHang = $(this).data('customer-id');
    });
    function confirmDelete() {

        var DeleteKhachHang = 'DeleteKhachHang';

        $.ajax({
            type: "POST",
            url: "Delete",
            data: {
                MaKhachHang: MaKhachHang,
                action: DeleteKhachHang
            },
            success: function (response, status, xhr) {

                if (response === 'success') {
                    alert("Đã xóa thành công!");
                } else {
                    alert("Xóa thất bại!");
                }

                // Đóng modal
                $("#confirm-modal").modal("hide");
            },
            error: function () {
                alert("Error deleting product");

            },
            complete: function () {
                // Sau khi Ajax hoàn thành, load lại trang
                location.reload();
            }
        });
    }
</script>