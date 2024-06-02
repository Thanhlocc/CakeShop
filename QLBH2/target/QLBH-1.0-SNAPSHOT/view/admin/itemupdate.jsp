<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="control.*"%>
<%@page import = "java.io.*"%>
<%@page import = "java.util.*"%>
<article class="content item-editor-page">
    <div class="title-block" style="display: flex">
        <h3 class="title"> Chỉnh sửa sản phẩm
            <a href="./PageDirect?page=itemlist" class="btn btn-primary btn-sm rounded-s"> Quay lại</a>
        </h3>

    </div>
    <form>
        <div class="card card-block">
            <div class="form-group row">
                <label class="col-sm-2 form-control-label text-xs-right"> ID : </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control boxed" value="${ctsp.getMaSanPham()}" readonly=""  id="MaSanPham" name="MaSanPham"">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 form-control-label text-xs-right"> Tên sản phẩm :  </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control boxed" placeholder="" id="TenSanPham" name="TenSanPham" value="${ctsp.getTenSanPham()}" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 form-control-label text-xs-right"> Giá Nhập : </label>
                <div class="col-sm-10">
                    <c:set var="gianhap" value="${ctsp.getGiaNhap()}"/>
                    <input type="text" class="form-control boxed" placeholder="" id="GiaNhap" name="GiaNhap" value="<fmt:formatNumber value="${gianhap}" pattern="###0.#" />" required>
                </div>
            </div>
            <div class="form-group row">
                <c:set var="giaban" value="${ctsp.getGiaBan()}"/>
                <label class="col-sm-2 form-control-label text-xs-right"> Giá Bán : </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control boxed" placeholder="" id="GiaBan" name="GiaBan" value="<fmt:formatNumber value="${giaban}" pattern="###0.#" />" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 form-control-label text-xs-right"> Hình ảnh : </label>
                <div class="col-sm-10">
                    <div class="images-container">
                        <input type="file" name="hinhAnh" accept="image/*" id="fileInput" style="display: none;" onchange="displayImage()"  />
                        <div class="image-container" id="selectedImageContainer" style="display: none;">               
                            <div class="controls">                              
                                <a href="#" class="control-btn remove" onclick="removeImage()">
                                    <i class="fa fa-trash-o"></i>
                                </a>
                            </div>
                            <div class="image" id="selectedImage" data-image-url="" style="background-image: none;"></div>
                        </div>
                        <a href="javascript:void(0);" onclick="chooseFile()" id="fileLink">
                            <div class="image-container new">
                                <div class="image">
                                    <i class="fa fa-plus"></i>
                                </div>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 form-control-label text-xs-right"> Số lượng : </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control boxed" placeholder="" id="SoLuong" name="SoLuong" value="${ctsp.getSoLuong()}" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 form-control-label text-xs-right"> Loại sản phẩm </label>
                <div class="col-sm-10">
                    <select class="c-select form-control boxed" id="LoaiSanPham" name="LoaiSanPham" required>
                        <option selected>Chọn loại sản phảm</option>
                        <c:forEach var="listlsp" items="${lslsp}">
                            <c:set var="lsp" value="${listlsp.getMaLoaiSanPham()}" />
                            <c:set var="lspsp" value="${ctsp.getMaLoaiSanPham()}" />
                            <c:choose>
                                <c:when test="${lsp == lspsp}">
                                    <option value="${listlsp.getMaLoaiSanPham()}" selected>${listlsp.getTenLoaiSanPham()}</option>
                                </c:when> 
                                <c:otherwise>
                                    <option value="${listlsp.getMaLoaiSanPham()}">${listlsp.getTenLoaiSanPham()}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-10 col-sm-offset-2">
                    <button onclick="Update()" class="btn btn-primary"> Lưu </button>
                </div>
            </div>
        </div>
    </form>
</article>
<script>
    function chooseFile() {
        // Kích thích sự kiện click của ô chọn file
        document.getElementById('fileInput').click();
    }

    function displayImage() {
        // Lấy đường dẫn hình ảnh từ ô chọn file
        var input = document.getElementById('fileInput');
        var imageUrl = URL.createObjectURL(input.files[0]);
        // Ẩn ô chọn file
        document.getElementById('fileInput').style.display = 'none';
        document.getElementById('fileLink').style.display = 'none';
        // Hiển thị hình ảnh được chọn
        var selectedImageContainer = document.getElementById('selectedImageContainer');
        selectedImageContainer.style.display = 'block';
        var selectedImage = document.getElementById('selectedImage');
        selectedImage.style.backgroundImage = 'url(' + imageUrl + ')';
        selectedImage.setAttribute('data-image-url', imageUrl);
        console.log(imageUrl);
    }

    function removeImage() {
        // Xóa hình ảnh và hiển thị ô chọn file lại
        var selectedImageContainer = document.getElementById('selectedImageContainer');
        selectedImageContainer.style.display = 'none';
        selectedImage.setAttribute('data-image-url', null);
        // Hiển thị ô chọn file
        document.getElementById('fileInput').style.display = 'none';
        document.getElementById('fileLink').style.display = 'block';
        imageUrl = undefined;
        var input = document.getElementById('fileInput');
        input.value = '';
    }


    function Update() {
        var formData = new FormData(); // Tạo đối tượng FormData

        var TenSanPham = $('#TenSanPham').val();
        var GiaNhap = $('#GiaNhap').val();
        var GiaBan = $('#GiaBan').val();
        var HinhAnh = $('#fileInput')[0].files[0];
        var SoLuong = $('#SoLuong').val();
        var LoaiSanPham = $('#LoaiSanPham').val();
        // Thêm giá trị từ các trường input/select vào FormData

        formData.append('TenSanPham', TenSanPham);
        formData.append('GiaNhap', GiaNhap);
        formData.append('GiaBan', GiaBan);
        formData.append('SoLuong', SoLuong);
        formData.append('LoaiSanPham', LoaiSanPham);
        // Kiểm tra xem người dùng đã chọn hình mới hay không
        if (HinhAnh) {
            formData.append('hinhAnh', HinhAnh); // File sẽ được thêm vào FormData
        }
        $.ajax({
            type: "POST",
            url: "UpdateItem", // Chỉ cần đặt tên của servlet ở đây
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response === 'success') {
                    alert("Product added successfully!");
                }
            },
            error: function (error) {
                console.error(error);
                alert("Error adding product: ");
                console.log(hinhAnh);
            }
        });


    }

    //    
</script>