<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Modify</title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        Product Modify
                    </div>
                    <div class="card-body">
                        <form action="/product/modify" method="post">



                            <div class="input-group mb-3">
                                <span class="input-group-text">PNO</span>
                                <input type="text" name="pno" class="form-control"
                                       value=<c:out value="${dto.pno}"></c:out> readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text">Pname</span>
                                <input type="text" name="pname" class="form-control"
                                       value=<c:out value="${dto.pname}"></c:out> >
                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text">Price</span>
                                <input type="text" name="Price" class="form-control" value=<c:out value="${dto.price}"></c:out>>

                            </div>

                            <div class="input-group mb-3">
                                <span class="input-group-text">Quantity</span>
                                <input type="text" name="quantity" class="form-control"
                                       value=<c:out value="${dto.quantity}"></c:out> readonly>

                            </div>
                            <div class="my-4">
                                <div class="float-end">
                                    <button type="button" class="btn btn-danger">Remove</button>
                                    <button type="button" class="btn btn-primary">Modify</button>
                                    <button type="button" class="btn btn-secondary">List</button>
                                </div>
                            </div>
                        </form>

                        <script>

                            const serverValidResult = {}

                            <c:forEach items="${errors}" var="error">

                            serverValidResult['${error.getField()}'] = '${error.defaultMessage}'

                            </c:forEach>

                            console.log(serverValidResult)
                        </script>

                    </div>
                    <script>

                        const formObj = document.querySelector("form")

                        document.querySelector(".btn-danger").addEventListener("click",function(e) {

                            e.preventDefault()
                            e.stopPropagation()

                            formObj.action =`/product/remove?${pageRequestDTO.link}`
                            formObj.method ="post"

                            formObj.submit()

                        },false);


                        document.querySelector(".btn-primary").addEventListener("click",function(e) {

                            e.preventDefault()
                            e.stopPropagation()

                            formObj.action ="/product/modify"
                            formObj.method ="post"

                            formObj.submit()

                        },false);

                        document.querySelector(".btn-secondary").addEventListener("click",function(e) {

                            e.preventDefault()
                            e.stopPropagation()

                            self.location= `/product/list?${pageRequestDTO.link}`

                        },false);


                    </script>

                </div>
            </div>
        </div>

    </div>
    <div class="row content">
    </div>
    <div class="row footer">
        <!--<h1>Footer</h1>-->

        <div class="row   fixed-bottom" style="z-index: -100">
            <footer class="py-1 my-1 ">
                <p class="text-center text-muted">Footer</p>
            </footer>
        </div>

    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>