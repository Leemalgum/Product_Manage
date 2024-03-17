<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>List</title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Search </h5>
                        <form action="/product/list" method="get">
                            <input type="hidden" name="size" value="${pageRequestDTO.size}">
                            <div class="mb-3">
                                <input type="checkbox" name="types"
                                       value="t" ${pageRequestDTO.checkType("t")?"checked":""}>제품이름
                                <input type="text" name="keyword" class="form-control"
                                       value='<c:out value="${pageRequestDTO.keyword}"/>'>
                            </div>
                            <div class="input-group mb-3">
                                <div class="float-end">
                                    <button class="btn btn-primary" type="submit">Search</button>
                                    <button class="btn btn-info clearBtn" type="reset">Clear</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>

        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Pno</th>
                                <th scope="col">Pname</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${responseDTO.dtoList}" var="dto">
                                <tr>
                                    <th scope="row"><c:out value="${dto.pno}"/></th>
                                    <td>
                                        <a href="/product/read?pno=${dto.pno}&${pageRequestDTO.link}"
                                           class="text-decoration-none" data-tno="${dto.pno}">
                                            <c:out value="${dto.pname}"/>
                                        </a>
                                    </td>
                                    <td><c:out value="${dto.price}"/></td>
                                    <td><c:out value="${dto.quantity}"/></td>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>

                        </table>

                        <div class="float-end">
                            <ul class="pagination flex-wrap">
                                <c:if test="${responseDTO.prev}">
                                    <li class="page-item">
                                        <a class="page-link" data-num="${responseDTO.start -1}">Previous</a>
                                    </li>
                                </c:if>

                                <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
                                    <li class="page-item ${responseDTO.page == num? "active":""} ">
                                        <a class="page-link" data-num="${num}">${num}</a></li>
                                </c:forEach>

                                <c:if test="${responseDTO.next}">
                                    <li class="page-item">
                                        <a class="page-link" data-num="${responseDTO.end + 1}">Next</a>
                                    </li>
                                </c:if>
                            </ul>

                        </div>

                        <script>

                            document.querySelector(".pagination").addEventListener("click", function (e) {
                                e.preventDefault()
                                e.stopPropagation()

                                const target = e.target
                                if (target.tagName != 'A') {
                                    return
                                }
                                const num = target.getAttribute("data-num")
                                self.location = `/todo/list?page=\${num}}`

                            }, false)


                            // document.querySelector(".pagination").addEventListener("click", function (e) {
                            //         e.preventDefault()
                            //         e.stopPropagation()
                            //
                            //         const target = e.target
                            //
                            //
                            //         if(target.tagName !== 'A') {
                            //             return
                            //         }
                            //         const num = target.getAttribute("data-num")
                            //
                            //         self.location = `/todo/list?page=\${num}` //백틱(` `)을 이용해서 템플릿 처리
                            //     },false)

                            document.querySelector(".pagination").addEventListener("click", function (e) {
                                e.preventDefault()
                                e.stopPropagation()

                                const target = e.target

                                if (target.tagName !== 'A') {
                                    return
                                }
                                const num = target.getAttribute("data-num")

                                const formObj = document.querySelector("form")

                                formObj.innerHTML += `<input type='hidden' name='page' value='\${num}'>`

                                formObj.submit();

                            }, false)


                            document.querySelector(".clearBtn").addEventListener("click", function (e) {
                                e.preventDefault()
                                e.stopPropagation()

                                self.location = '/product/list'

                            }, false)


                        </script>

                    </div>

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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>