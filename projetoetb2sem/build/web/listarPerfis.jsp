<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="template/header.jsp"></jsp:include>
<jsp:include page="template/menu.jsp"></jsp:include>



<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Gerenciar Perfil</h1>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <jsp:include page="cadastrarPerfil.jsp"></jsp:include>
                            <button type="button" class="btn btn-secondary" data-toggle="modal"
                                data-target="#modal-default">
                                Cadastrar Perfil <i class="fa-solid fa-floppy-disk"></i>
                            </button>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Código</th>
                                        <th>Nome</th>
                                        <th>Data de Cadastro</th>
                                        <th>Status</th>
                                        <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${perfis}" var="p">
                                        <td>${p.idPerfil}</td>
                                        <td>${p.nome}</td>
                                        <td>
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${p.dataCadastro}" />
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${p.status == 1}">
                                                    ativado
                                                </c:when>
                                                <c:otherwise>
                                                    desativado
                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                        <td>
                                            <script type="text/javascript">
                                                function confirmDesativar(id, nome) {
                                                    if (confirm('Deseja desativar o perfil ' +
                                                        nome + '?')) {
                                                        location.href = "gerenciarPerfil?acao=desativar&idPerfil=" + id;
                                                    }
                                                }

                                                function confirmAtivar(id, nome) {
                                                    if (confirm('Deseja ativar o perfil ' +
                                                        nome + '?')) {
                                                        location.href = "gerenciarPerfil?acao=ativar&idPerfil=" + id;
                                                    }
                                                }
                                            </script>
                                            <a href="gerenciarPerfil?acao=alterar&idPerfil=${p.idPerfil}"
                                                class="btn btn-primary btn-sm" role="button">
                                                Alterar&nbsp;<i class="fa-solid fa-pen-to-square"></i>
                                            </a>
                                            <c:choose>
                                                <c:when test="${p.status == 1}">
                                                    <button class="btn btn-danger btn-sm"
                                                        onclick="confirmDesativar('${p.idPerfil}', '${p.nome}')">
                                                        Desativar&nbsp;
                                                        <i class="fas fa-user fa-user-lock"></i>
                                                    </button>

                                                </c:when>
                                                <c:otherwise>
                                                    <button class="btn btn-success btn-sm"
                                                        onclick="confirmAtivar('${p.idPerfil}', '${p.nome}')">
                                                        Ativar&nbsp;
                                                        <i class="fa-solid fa-user-shield"></i>
                                                    </button>

                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Código</th>
                                        <th>Nome</th>
                                        <th>Data de Cadastro</th>
                                        <th>Status</th>
                                        <th>Ação</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
</div>


<jsp:include page="template/footer.jsp"></jsp:include>
<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    });
</script>
