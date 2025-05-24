<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vn.iotstar.entity.User"%>

<%
    User currentUser = (User) session.getAttribute("user");
    request.setAttribute("currentUser", currentUser);
%>

<style>
    :root {
        --primary-color: #34a6b7;
        --primary-darker: #2c8a98;
        --text-color: #212529;
        --text-secondary: #6c757d;
        --bg-light: #f8f9fa;
        --border-color: #dee2e6;
        --box-shadow: 0 1px 3px rgba(0,0,0,0.05);
    }

    .header {
        background-color: var(--bg-light);
        display: flex;
        align-items: center;
        padding: 10px 20px;
        box-shadow: var(--box-shadow);
        font-family: 'Roboto', sans-serif;
        border-bottom: 1px solid var(--border-color);
    }

    .header-logo {
        margin-right: 20px;
    }

    .header-logo img {
        height: 36px;
    }

    .header-nav {
        display: flex;
        align-items: center;
        flex-grow: 1;
    }

    .header-nav a {
        text-decoration: none;
        color: var(--text-color);
        margin-right: 16px;
        font-weight: 500;
        transition: color 0.3s ease;
    }

    .header-nav a:hover {
        color: var(--primary-color);
    }

    .header-search-form {
        display: flex;
        margin-left: auto;
        margin-right: 16px;
    }

    .header-search-input {
        padding: 8px 12px;
        border: 1px solid var(--border-color);
        border-radius: 4px 0 0 4px;
        outline: none;
        font-size: 0.9rem;
    }

    .header-search-button {
        background-color: var(--primary-color);
        color: white;
        border: none;
        padding: 8px 12px;
        border-radius: 0 4px 4px 0;
        cursor: pointer;
        font-size: 0.9rem;
        transition: background-color 0.3s ease;
    }

    .header-search-button:hover {
        background-color: var(--primary-darker);
    }

    .header-auth {
        display: flex;
        align-items: center;
    }

    .header-auth a {
        text-decoration: none;
        transition: color 0.3s ease, background-color 0.3s ease;
        border-radius: 4px;
        padding: 8px 12px;
        font-size: 0.9rem;
        font-weight: 500;
    }

    .header-auth a:hover {
        color: white;
        background-color: var(--primary-color);
    }

    .header-auth .login-link {
        color: var(--primary-color);
        border: 1px solid var(--primary-color);
        margin-left: 16px;
    }

    .header-auth .register-link {
        background-color: var(--primary-color);
        color: white;
        margin-left: 8px;
    }

    .header-avatar {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        overflow: hidden;
        cursor: pointer;
        margin-left: 16px;
        border: 1px solid var(--border-color);
    }

    .header-avatar img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .logout-button {
        background-color: transparent;
        color: var(--primary-color);
        border: 1px solid var(--primary-color);
        padding: 8px 12px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 0.9rem;
        font-weight: 500;
        margin-left: 16px;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .logout-button:hover {
        background-color: var(--primary-color);
        color: white;
    }

    .logout-modal {
        display: none;
        position: fixed;
        top: 0; left: 0; right: 0; bottom: 0;
        background: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
        z-index: 999;
    }

    .logout-modal.show {
        display: flex;
    }

    .logout-modal .modal-content {
        background: white;
        padding: 24px;
        border-radius: 8px;
        text-align: center;
        width: 300px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.2);
    }

    .logout-modal .modal-content h3 {
        margin-bottom: 12px;
        color: var(--text-color);
    }

    .logout-modal .modal-content p {
        color: var(--text-secondary);
        margin-bottom: 16px;
    }

    .logout-modal .buttons {
        margin-top: 16px;
        display: flex;
        justify-content: space-between;
    }

    .logout-modal .buttons button {
        padding: 10px 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .logout-modal .buttons .confirm {
        background-color: #dc3545;
        color: white;
    }

    .logout-modal .buttons .confirm:hover {
        background-color: #c82333;
    }

    .logout-modal .buttons .cancel {
        background-color: var(--text-secondary);
        color: white;
    }

    .logout-modal .buttons .cancel:hover {
        background-color: #5a6268;
    }
</style>

<div class="header">
    <div class="header-logo">
        <a href="${pageContext.request.contextPath}/">
            <img src="https://baomoi-static.zadn.vn/web/styles/img/logo.png" alt="Logo">
        </a>
    </div>

    <div class="header-nav">
        <a href="${pageContext.request.contextPath}/user/category">Chủ Đề</a>
    </div>

    <form class="header-search-form" action="${pageContext.request.contextPath}/user/search" method="get">
        <input type="text" class="header-search-input" name="keyword" placeholder="Tìm kiếm...">
        <button type="submit" class="header-search-button">Tìm</button>
    </form>

    <div class="header-auth">
        <c:choose>
            <c:when test="${currentUser != null}">
                <div class="header-avatar" onclick="showLogoutModal()">
                    <img src="${currentUser.avatarUrl}" alt="Avatar">
                </div>
                <button class="logout-button" onclick="showLogoutModal()">Đăng xuất</button>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/user/login" class="login-link">Đăng nhập</a>
                <a href="${pageContext.request.contextPath}/register" class="register-link">Đăng ký</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div id="logoutModal" class="logout-modal" role="dialog" aria-modal="true">
    <div class="modal-content">
        <h3>Xác nhận đăng xuất</h3>
        <p style="color: var(--text-secondary);">Bạn có chắc chắn muốn đăng xuất?</p>
        <div class="buttons">
            <button class="confirm" onclick="confirmLogout()">Đăng xuất</button>
            <button class="cancel" onclick="hideLogoutModal()">Hủy</button>
        </div>
    </div>
</div>

<form id="logoutForm" action="${pageContext.request.contextPath}/user/logout" method="get" style="display: none;"></form>

<script>
    function showLogoutModal() {
        document.getElementById("logoutModal").classList.add("show");
    }

    function hideLogoutModal() {
        document.getElementById("logoutModal").classList.remove("show");
    }

    function confirmLogout() {
        document.getElementById("logoutForm").submit();
    }

    // Tắt modal khi bấm bên ngoài
    document.getElementById("logoutModal").addEventListener("click", function(e) {
        if (e.target === this) hideLogoutModal();
    });

    // Tắt bằng ESC
    document.addEventListener("keydown", function(e) {
        if (e.key === "Escape") hideLogoutModal();
    });
</script>