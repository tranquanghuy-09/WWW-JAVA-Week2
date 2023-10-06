<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.backend.models.CartDetail" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static java.awt.SystemColor.window" %><%--
  Created by IntelliJ IDEA.
  User: ASUS-VIVOBOOK
  Date: 10/6/2023
  Time: 1:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    long productid = Long.parseLong(request.getParameter("id"));
    List<CartDetail> cartDetailList;
    Object objCartDetailList = session.getAttribute("cartDetailList");
    if(objCartDetailList==null) {
        cartDetailList = new ArrayList<>();
    }else{
        cartDetailList = (List<CartDetail>) objCartDetailList;
    }
    session.setAttribute("cartDetailList", cartDetailList);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Điện Thoại</title>
    <link rel="icon" type="image/x-icon" href="./img/favicon.png">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./font-awesome/css/font-awesome.min.css">
    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="./css/bootstrap.min.css">

    <script src="./js/products.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const productUrl = "http://localhost:8080/labweek02/api/products/<%= productid%>";
            fetch(productUrl)
                .then(response => response.json())
                .then(product => {
                    document.getElementById("productName").textContent = product.name;
                    document.getElementById("productManufacturer").textContent = product.manufacturer;
                    document.getElementById("productDescription").textContent = product.description;
                    var productPrice = product.productPriceList[0].price;
                    var formattedPrice = productPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                    document.getElementById("productPrice").textContent = formattedPrice+"₫";
                    document.getElementById("productImage").src = product.productImageList[0].path;
                    // document.getElementById("productStatus").textContent = product.status;
                    // document.getElementById("productUnit").textContent = product.unit;
                })
                .catch(error => console.error("Lỗi: " + error));
        });
    </script>
    <style>
        .contai {
            background-color: rgb(251, 243, 234);
        }

        .slider {
            margin: 30px;
            height: 250px;
        }

        .slider-container-right {
            display: block;
            flex-wrap: wrap;
            padding: 0;
            justify-content: space-around;
        }

        .slider-container-right li {
            width: 100%;
            height: 50%;
            text-align: center;
            margin-bottom: 2px;

        }

        .slider-container-right li img {
            width: 320px;
            height: 122px;
            border-radius: 5px;
        }

        .slider-container-left-top {
            height: 250px;
        }

        .slider-container-left-bottom {
            height: 0px;
        }

        .container a {
            color: #ddd;
            text-decoration: none;
        }

        .footer-container a {
            text-decoration: none;
        }

        .menu-bar-container {
            margin-top: -16px;
        }

        .baner-one {
            height: 200px;
        }

        .img1 {
            border-radius: 60px;
            background-color: rgb(62, 178, 241);
            width: 100px;
        }

        .img2 {
            border-radius: 60px;
            background-color: rgb(244, 145, 207);
            width: 100px;
        }

        .img3 {
            border-radius: 60px;
            background-color: rgb(252, 195, 104);
            width: 100px;
        }

        .img4 {
            border-radius: 60px;
            background-color: rgb(178, 255, 152);
            width: 100px;
        }

        .img5 {
            border-radius: 60px;
            background-color: rgb(170, 243, 238);
            width: 100px;
        }

        .baner-one-content-text h4 {
            font-weight: bold;
            font-size: 22px;
            padding: 10px;
        }

        .baner-one-content a {
            color: #333;
            font-size: 15px;
            align-items: center;
        }

        .baner-two-content-one img {
            width: 140px;
        }

        .baner-two-content-one p {
            width: 140px;
            height: 15px;
            color: rgb(71, 118, 247);
            font-size: 17px;
            line-height: 30px;
        }

        .baner-three {
            margin-top: 50px;
        }

        .baner-three-content img {
            width: 100%;
        }

        .product-gallery-three-content-title li {
            background-color: rgb(252, 252, 252);
            width: auto;
        }

        .product-gallery-three-content-title ul li a {
            font-size: 15px;
        }

        .product-gallery-three-content-title {
            justify-content: center;
        }

        .product-gallery-three-content-product {
            margin-top: -20px;
        }

        .baner-one-text {
            display: flex;
            border-top: 3px solid #ddd;
            margin-top: -10px;
            padding-top: 10px;
        }

        .baner-one-text h1 {
            font-weight: bold;
            font-size: 21px;
        }

        .baner-one-text i {
            color: rgb(255, 140, 0);
            font-size: 14px;
        }

        .baner-one-text div {
            padding: 0px 8px;
        }

        .baner-one-product img {
            width: 100%;
            height: 100%;
        }

        .baner-one-product-text1 {
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
        }

        h2 {
            color: rgb(255, 85, 0);
            font-weight: bold;
        }

        .baner-one-product-text1 h3 {
            font-weight: bold;
            font-size: 15px;
        }

        .baner-one-product-text1 span {
            font-size: 14px;
        }

        .baner-one-product-text2 {
            margin-top: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            line-height: 23px;
        }

        .baner-one-product-text2 span {
            color: rgb(0, 136, 255);
            font-size: 15px;
        }

        .baner-one-product-text3 {
            margin-top: 10px;
            padding: 10px;
            color: #ddd;
        }

        .btn {
            border-radius: 5px;
            width: 100%;
            height: 50px;
            background-color: #FB6E2E;
            color: #ddd;
            font-size: 18px;
        }

        .baner-one-product-text3:hover .btn {
            color: #ddd;
        }

        .baner-one-product-text4 {
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .baner-one {
            height: 500px;
        }

        .product-gallery-one-content-title {
            background-color: #FB6E2E;
            border-radius: 20px;
        }

        .product-gallery-one-content-title h2 {
            color: white;
            margin-left: 40%;
            font-size: 24px;
            margin-top: 10px;
        }

        .st-card {
            box-shadow: 0 0 3px 0 #dee2e6;
            border-radius: 6px;
            border: 1px solid white;
        }

        h3.card-title {
            font-size: 20px;
            line-height: 20px;
            margin-top: 10px;
        }

        .card-body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .st-pd-table {
            margin: 0 auto;
        }

        .st-pd-table tr:nth-child(odd) {
            background-color: #f3f4f7;
        }

        .st-pd-table td:first-child {
            width: 120px;
        }

        .st-pd-table td {
            border: 1px solid #dee2e6;
            padding: 6px 10px;
            font-size: 15px;
            line-height: 25px;
        }

        td {
            vertical-align: top;
        }

        .chitiet {
            height: 500px;
        }

        .baner-one-product {
            display: flex;
            position: relative;
        }

        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 24px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 18px;
            transition: 0.4s;
        }

        .active,
        .accordion:hover {
            background-color: #ccc;
        }

        .accordion:after {
            content: '\002B';
            color: #777;
            font-weight: bold;
            float: right;
            margin-left: 5px;
        }

        .active:after {
            content: "\2212";
        }

        .panel {
            padding: 0 18px;
            background-color: white;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
        }

        .panel h3#tieude {
            color: black;
            font-weight: bold;
            font-size: 28px;
            text-align: justify;
            line-height: 30px;
            margin: 20px 0 15px 0;
        }

        .panel h3#ndchinh {
            color: rgb(254, 51, 51);
            font-weight: bold;
        }

        .panel>p {
            text-align: justify;
            line-height: 1.5;
            margin-bottom: 10px;
            font-size: 20px;
        }

        .panel img {
            display: inline-block;
            position: relative;
            left: 50%;
            transform: translateX(-50%);
        ;
        }
    </style>
</head>

<body>
<nav style="padding-top: 10px; height:75px">
    <div class="container">
        <ul>
            <li><a href="index.jsp"><img src="./img/THAD Mobile-logo.png" alt="" style="width: 200px;height: 40px;"></a>
            </li>
            <li id="adress-form"><a href="#">Đà Nẵng <i class="fa fa-caret-down" aria-hidden="true"></i></a> </li>
            <li><input type="text" placeholder="Bạn tìm gì...."><i class="fa fa-search" aria-hidden="true"></i></li>
            <li>
                <a href="cart.jsp">
                    <button style="position: relative; display: inline-block; padding-left:10px; padding-right: 38px;">
                        Giỏ hàng <i class="fa fa-shopping-cart"></i> &nbsp;
                        <span class="badge badge-danger" style="font-size: 15px; position: absolute; top: -8px;"><%= cartDetailList.size()%></span>
                    </button>
                </a>
            </li>
            <li><a href="">Lịch sử <br> đơn hàng</a></li>
            <li><a href=""> <span class="btn-content"><span class="btn-top"></span></span>Mua thẻ nạp ngay</a></li>
            <li><a href="">14h Công nghệ</a></li>
            <li><a href="">Hỏi đáp</a></li>

            <div class="adress-form">
                <div class="adress-form-content">
                    <h2>Chọn địa chỉ nhận hàng <span id="adress-close">X Đóng</span></h2>
                    <form action="">
                        <p>Chọn đầy đủ địa chỉ nhận hàng để biết chính xác thời gian giao</p>
                        <select name="">
                            <option value="#">-- Chọn địa điểm</option>
                            <option value="#">Đà Nẵng</option>
                            <option value="#" selected>Thành phố Hồ Chí Minh</option>
                            <option value="#">Hà Nội</option>
                        </select>
                        <select name="" class="mt-1">
                            <option value="#">-- Chọn Quận\Huyện</option>
                            <option value="#">Quận 1</option>
                            <option value="#">TP. Thủ Đức</option>
                            <option value="#">Quận 3</option>
                            <option value="#">Quận 4</option>
                            <option value="#">Quận 5</option>
                            <option value="#">Quận 6</option>
                            <option value="#">Quận 7</option>
                            <option value="#">Quận 8</option>
                            <option value="#">Quận 9</option>
                            <option value="#">Quận Bình Tân</option>
                            <option value="#">Quận Bình Thạnh</option>
                            <option value="#">Quận Gò Vấp</option>
                        </select>
                        <select name="" class="mt-1">
                            <option value="#">-- Chọn Phường\Xã</option>
                            <option value="#">Phường 1</option>
                            <option value="#">Phường 2</option>
                            <option value="#">Phường 3</option>
                            <option value="#">Phường 4</option>
                        </select>
                        <input type="text" placeholder="Số nhà, tên, đường">
                        <button>Xác nhận</button>
                    </form>
                </div>
            </div>
        </ul>
    </div>
</nav>
<section class="menu-bar">
    <div class="container">
        <div class="menu-bar-container">
            <ul>
                <li><a href="index.jsp" style="padding-left: 20px; padding-right: 20px;">Trang chủ</a></li>
                <li><a href="index.jsp" style="padding-left: 20px; padding-right: 20px;"><i class="fa fa-mobile" aria-hidden="true"></i> Điện thoại </a></li>
                <li><a href="phukien.html" style="padding-left: 20px; padding-right: 20px;"><i class="fa fa-headphones" aria-hidden="true"></i> Phụ kiện <i
                        class="fa fa-caret-down" aria-hidden="true"></i></a>
                    <div class="submenu">
                        <ul>
                            <li><a href="">Pin sạc dự phòng</a></li>
                            <li><a href="">Ốp lưng điện thoại</a></li>
                            <li><a href="">Sạc, cáp</a></li>
                            <li><a href="">Tai nghe</a></li>
                            <li><a href="">Loa</a></li>
                            <li><a href="">Miếng dán điện thoại</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="DiaChi.html" style="padding-left: 20px; padding-right: 20px;"> Địa Chỉ</a></li>
                <li><a href="#" style="padding-left: 20px; padding-right: 20px;"> Giới thiệu</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="GioiThieuWeb.html">Giới thiệu trang web</a></li>
                            <li><a href="GioiThieuThanhVien.html">Giới thiệu thành viên</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="dangnhap.html" style="padding-left: 20px; padding-right: 20px;"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Đăng nhập</a>
                </li>


            </ul>
        </div>
    </div>
</section>

<!-- ------------------Chi tiết----------------------- -->
<section class="chitiet">
    <div class="baner-one">
        <div class="container">
            <div class="baner-one-text">
                <h1>Điện thoại</h1> &nbsp;
                <h1 id="productName"></h1>
                <div id="danhgia">
                    <div>
                        <i class="fa fa-star" aria-hidden="true"></i> &nbsp;
                        <i class="fa fa-star" aria-hidden="true"></i> &nbsp;
                        <i class="fa fa-star" aria-hidden="true"></i> &nbsp;
                        <i class="fa fa-star" aria-hidden="true"></i> &nbsp;
                        <i class="fa fa-star-half-o" aria-hidden="true"></i>
                    </div>
                </div>
                <p id="review" style="margin-left: -5px;">142</p>
                <p>&nbspĐánh giá</p>
            </div>
            <div class="baner-one-product">
                <div class="col-5">
                    <img src="" alt="" id="productImage" style="height: 440px; width: 440px;">
                </div>
                <div class="col-3">
                    <h2 id="productPrice"></h2>
                    <div class="baner-one-product-text1">
                        <h3>KHUYẾN MÃI</h3>
                        <input type="checkbox" checked> <span>Khách hàng sẽ được giảm <b>500.000 <sup>đ</sup></b>
                                khi thanh toán bằng VNPAY</span>
                    </div>
                    <div class="baner-one-product-text2">
                        <i style="font-size: 20px;" class="fa fa-archive" aria-hidden="true"></i>
                        <span>Trong hộp có: Sạc, Tai nghe, Sách hướng dẫn, Cây cậy sim, Ốp lưng.</span> <br>
                        <img src="./img/baohanh.jfif" alt="" style="width: 30px; height: 25px;">
                        <span>Bảo hành chính hãng 12 tháng.</span> <br>
                        <span> 1 đổi 1 trong 1 tháng nếu lỗi, đổi sản phẩm tại nhà trong 1 ngày.</span>
                    </div>
                    <script>

                    </script>
                    <div class="baner-one-product-text3">
                        <a href="control-servlet?action=addToCart&id=<%= productid%>"><button class="btn"><i class="fa fa-cart-plus"
                                                                              aria-hidden="true"></i>Thêm vào giỏ hàng</button>
                        </a>
                    </div>

                </div>

                <div class="col-4 thongsokythuat">
                    <div class="card re-card st-card">
                        <h3 class="card-title text-center font-weight-bold">Thông số kỹ thuật</h3>
                        <div class="card-body ">
                            <table class="st-pd-table ">
                                <tbody>
                                <tr>
                                    <td>Hãng sản xuất</td>
                                    <td id="productManufacturer"></td>
                                </tr>
                                <tr>
                                    <td>Màn hình</td>
                                    <td id="manhinh"></td>
                                </tr>
                                <tr>
                                    <td>Hệ điều hành</td>
                                    <td id="hedieuhanh"></td>
                                </tr>
                                <tr>
                                    <td>Camera sau</td>
                                    <td id="camerasau"></td>
                                </tr>
                                <tr>
                                    <td>Camera trước</td>
                                    <td id="cameratruoc"></td>
                                </tr>
                                <tr>
                                    <td>Chip</td>
                                    <td id="chip"></td>
                                </tr>
                                <tr>
                                    <td>Ram</td>
                                    <td id="ram"></td>
                                </tr>
                                <tr>
                                    <td>Rom</td>
                                    <td id="rom"></td>
                                </tr>
                                <tr>
                                    <td>Pin, Sạc</td>
                                    <td id="pin"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="container">
    <section class="section product-details__section">
        <div class="product-detail__bottom">
            <div class="title__container tabs">
                <br>
                <button class="accordion">Thông tin sản phẩm</button>
                <div class="panel">
                    <br>
                    <h3 id="tieude"></h3>
                    <br>
                    <h3 id="productDescription">Thay đổi thiết kế mới sau 6 năm</h3>
                    <br>
                    <img src="" alt="" id="hinhanhchitiet">
                    <br><br>
                    <p id="noidungchitiet"></p>
                    <br>
                </div>
            </div>
        </div>

        <!-- ---------------------footer thông tin ------------------------------- -->
        <footer class="footer">
            <div class="footer-container">
                <div class="content-one">
                    <ul>
                        <li>
                            <h2>Sản phẩm</h2>
                        </li>
                        <li><a href="">Điện thoại mới</a></li>
                        <li><a href="">Điện thoại cũ</a></li>
                        <li><a href="">Linh kiện điện thoại mới</a></li>
                        <li><a href="">Linh kiện nổi bật</a></li>
                    </ul>
                </div>
                <div class="content-two">
                    <ul>
                        <li>
                            <h2>Thông tin</h2>
                        </li>
                        <li><a href="">Giới thiệu về công ty</a></li>
                        <li><a href="">Chính sách bảo mật</a></li>
                        <li><a href="">Chính sách bảo hành</a></li>
                        <li><a href="">Khách hàng thân thiết</a></li>
                        <li><a href="">Chính sách đổi trả</a></li>
                        <li><a href="">Chính sách trả góp</a></li>
                    </ul>
                </div>
                <div class="content-three">
                    <ul>
                        <li>
                            <h2>Tài khoản</h2>
                        </li>
                        <li><a href="">Lịch sử mua hàng</a></li>
                        <li><a href="">Tài khoản của tôi</a></li>
                        <li><a href="">Khuyến mãi</a></li>
                        <li><a href="">Sản phẩm yêu thích</a></li>
                    </ul>
                </div>
                <div class="content-four">
                    <ul>
                        <li>
                            <h2>Liên hệ với chúng tôi</h2>
                        </li>
                        <li><a href="">Địa chỉ: Nguyễn Văn Bảo, phường 4, Quận Gò Vấp, thành phố Hồ Chí Minh</a>
                        </li>
                        <li><a href="">Tư vấn mua hàng: 0368636452</a></li>
                        <li><a href="">Tư vấn kĩ thuật: 0327003644</a></li>
                        <li><a href="">Email: 20024591.iuh@gmail.com</a></li>
                        <li><a href="../html/sitemap.html"> Site Map</a></li>
                    </ul>
                </div>
            </div>
        </footer>
        <script>
            var acc = document.getElementsByClassName("accordion");
            var i;
            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight) {
                        panel.style.maxHeight = null;
                    } else {
                        panel.style.maxHeight = panel.scrollHeight + "px";
                    }
                });
            }
        </script>
        <script src="../script.js"></script>
</body>

</html>