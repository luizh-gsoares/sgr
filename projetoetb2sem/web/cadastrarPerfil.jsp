<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% String msg=(String) request.getAttribute("msg"); if(msg !=null){ out.println( "<script type='text/javascript'>" + "alert('" + msg + "');" + "</script>" ); } %> -->

<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Default Modal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- form start -->
                <form action="gerenciarPerfil" method="POST" accept-charset="iso-8859-1,utf-8">
                    <div class="card-body">
                        <div class="form-group">
                            <input type="hidden" id="idperfil" name="idPerfil" value="${perfil.idPerfil}">
                        </div>
                        <div class="form-group">
                            <label for="idnome">Nome do Perfil :</label>
                            <input type="text" class="form-control" id="idNome" value="${perfil.nome}">
                        </div>
                        <div class="form-group">
                            <label for="iddata">Data de Cadastro :</label>
                            <input type="date" class="form-control" id="idData" value="${perfil.data}">
                        </div>
                        <div class="form-group">
                            <label for="idstatus">Status</label>
                            <select id="idstatus" name="status" class="form-control custom-select rounded-0">
                                <option value="">Escolha uma Opção</option>
                                <option value="1" <c:if test="${perfil.status == 1}">
                                    selected=""
                                    </c:if>>Ativado</option>
                                <option value="0" <c:if test="${perfil.status == 0}">
                                    selected=""
                                    </c:if>>Desativado</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar&nbsp;</button>
                <button type="button" class="btn btn-primary">Gravar&nbsp;</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->