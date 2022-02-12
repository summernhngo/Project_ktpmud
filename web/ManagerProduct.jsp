
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
         <style>
             
	body {
		background: #C1CDC1;
	}
            </style>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            <a href="home" class="btn btn-primary" role="button"><i class="material-icons">&#xe88a;</i> <span>RETURN HOME</span></a>
                            
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                          
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>                         
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="o">
                            <tr>
                                
                                <td>${o.product_id}</td>
                                <td>${o.product_name}</td>
                                <td>
                                    <img src="${o.images}">
                                </td>
                                <td>${o.price} vnd</td>
                                <td>
                                    <a href="loadProduct?pid=${o.product_id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="delete?pid=${o.product_id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>${count}</b> entries</div>
                    <ul class="pagination">
                        <c:if test="${tag > 1}">
                        <li class="page-item "><a href="page?index=${tag-1}">Previous</a></li>
                        </c:if>
                             <c:forEach begin = "1" end = "${endP}" var ="i">
                             <li class="page-item ${tag == i?"active":""}""><a href="page?index=${i}" class="page-link">${i}</a>
                      </c:forEach>
                                 <c:if test="${tag < endP}">
                        <li class="page-item"><a href="page?index=${tag+1}" class="page-link">Next</a></li>
                        </c:if>
                        
                    </ul>
                </div>
            </div>
        </div>
            
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>product_id</label>
                                <input name="product_id" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="product_name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>quantity</label>
                                <input name="quantity" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>exp date</label>
                                <input name="exp" type="date" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>mfg date</label>
                                <input name="mfg" type="date" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="images" type="text" class="form-control" required>
                            </div>
                              <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>  
                           <div class="form-group">
                                    <label>Category</label>
                                  <select name="category_id" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCC}" var="o">
                                        <option  value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                </select>
                                </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
       
        <script src="js/manager.js" type="text/javascript"></script>
        <script>
               
        </script>
    </body>
</html>