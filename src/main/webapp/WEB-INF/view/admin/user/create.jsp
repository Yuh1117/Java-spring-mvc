<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Manage Users</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({"display": "block"});
            });
        });
    </script>

</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content" class="bg-light">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Manage Users</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">User</li>
                </ol>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <a href="/admin/user" class="btn btn-outline-secondary"><i
                                    class="fa-solid fa-caret-left fa-xl"></i></a>
                            <h1 class="text-center">Create a user</h1>
                            <%--@elvariable id="newUser" type="" --%>
                            <form:form action="/admin/user/create" method="post"
                                       modelAttribute="newUser" class="row" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <c:set var="emailError">
                                        <form:errors path="email" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Email:</label>
                                    <form:input type="email"
                                                class="form-control ${not empty emailError ? 'is-invalid' : '' }"
                                                path="email"/>
                                        ${emailError}
                                </div>
                                <div class="mb-3">
                                    <c:set var="passwordError">
                                        <form:errors path="password" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Password:</label>
                                    <form:input type="password"
                                                class="form-control ${not empty passwordError ? 'is-invalid' : '' }"
                                                path="password"/>
                                        ${passwordError}
                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <c:set var="fullNameError">
                                        <form:errors path="fullName" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Full Name:</label>
                                    <form:input type="text"
                                                class="form-control ${not empty fullNameError ? 'is-invalid' : '' }"
                                                path="fullName"/>
                                        ${fullNameError}
                                </div>

                                <div class="mb-3 col-12 col-md-6">
                                    <label class="form-label">Phone number:</label>
                                    <form:input type="text" class="form-control" path="phone"/>
                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <label class="form-label">Address:</label>
                                    <form:input type="text" class="form-control" path="address"/>
                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <label class="form-label">Role:</label>
                                    <form:select class="form-select" path="role.name">
                                        <option value="Admin">Admin</option>
                                        <option value="User">User</option>
                                    </form:select>
                                </div>
                                <div class="mb-3">
                                    <label for="avatarFile" class="form-label">Avatar:</label>
                                    <input class="form-control" type="file" id="avatarFile"
                                           accept=".png, .jpg, .jpeg" name="avatarFile"/>
                                </div>
                                <div class="col-12 mb-3" style="max-width: 80%;">
                                    <img style="display: none; width: 100%;" alt="avatar preview"
                                         id="avatarPreview"/>
                                </div>
                                <div class="mb-3">
                                    <button type="submit"
                                            class="btn btn-primary form-control">Create
                                    </button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>

    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>

</html>