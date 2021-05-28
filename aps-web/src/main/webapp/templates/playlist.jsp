<%@page import="models.Usuario"%>
<%@page import="models.Video"%>
<%@page import="models.Playlist"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Playlist playlist = (Playlist) session.getAttribute("playlist");
	Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");
%>    
    

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="css/lista.css">
    <link href="https://fonts.googleapis.com/css2?family=Candal&display=swap" rel="stylesheet">
    <title>PlayList</title>
</head>
<body class="container-fluid bg-light">
    <!-- ################################################ navbar ####################################################### -->
    <header class="cabecalho">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="/aps-web/dashboard">Playlist</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/aps-web/dashboard">Dashboard<span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-criar-lista">Nova
                                Lista</a>
                            <a class="dropdown-item" href="#">Informações</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/aps-web/logout">Sair</a>
                        </div>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </div>
        </nav>
    </header>


    <main class="container-fluid bg-light">
        <h1 class="titulo fonte-titulo"><%=playlist.getTitulo() %></h1>
        <p><% 
        	if(playlist.getDescricao()!=null){
        		out.println(playlist.getDescricao());
        	}
        %></p>
        
        <div class="dropdown d-flex justify-content-end">
            <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img src="img/settings-tool.png">
            </a>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-criar-tarefa">Inserir Vídeo</a>
                <a class="dropdown-item" href="/aps-web/playlist?playlist_id=<%=playlist.getId() %>&action=editar">Editar Lista</a>
                <a class="dropdown-item" href="/aps-web/playlist?playlist_id=<%=playlist.getId() %>&action=excluir">Excluir Lista</a>
            </div>
        </div>            
		
		
		<% for(Video video : playlist.getVideos()) { %>
			
			
			<div class="card justify-content-center mt-3">
            <h5 class="card-header"><% out.println(video.getTitulo()); %></h5>
            
            <div class="card-body">
                
                <div class="d-flex justify-content-center mb-3">          
                    <div class="embed-responsive embed-responsive-16by9 w-75">  
                        <!--modal-dialog modal-lg m-5-->            
                        <iframe width="560" height="315" src="<% out.println(video.getUrl()); %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                    </div>
                </div>
                
                <p class="card-text">
                   <% out.println(video.getDescricao()); %>
                </p>
                <a href="/aps-web/video?id=<% out.println(video.getId()); %>&action=excluir" class="btn btn-secondary">Remover</a>

            </div>
        </div>
			
			
		<% } %>
		


    </main>

    <nav class="d-flex justify-content-center mt-5" aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>

    <footer class="d-flex justify-content-center mt-5">
        <p>PlayList</p>
    </footer>


    <!-- ########################### Modal Inserir Vídeo ########################################### -->
    <div class="modal fade" id="modal-criar-tarefa" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <dialog class="modal-content">
                <header class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Novo Vídeo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </header>

                <main class="modal-body">
                    <form action="/aps-web/video" method="POST">
                    
                        <input type="hidden" name="playlist_id" value="<% out.println(playlist.getId()); %>">
                        
                        <div class="form-group">
                            <label for="lista_nome">Título</label>
                            <input type="text" class="form-control" id="video_titulo" name="video_titulo"
                                placeholder="Insira o título da lista" required>
                        </div>

                        <div class="form-group">
                            <label for="lista_nome">link</label>
                            <input type="text" class="form-control" id="video_url" name="video_url"
                                placeholder="Insira a url do vídeo" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="tarefa_desc">Descrição</label>
                            <textarea class="form-control" id="video_descricao" name="video_descricao" rows="3"></textarea>
                        </div>
                        
                        <footer class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn botao-cor-especial">Salvar</button>
                        </footer>
                        
                    </form>
                    
                </main>
            </dialog>
        </div>
    </div>


    <!-- ########################### Modal Editar Lista ###########################################-->
    <!-- Modal - Editar Lista -->
    <div class="modal fade" id="modal-editar-lista" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <dialog class="modal-content">
                <header class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Editar PlayList</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </header>

                <main class="modal-body">
                    <form action="" method="POST" enctype="multipart/form-data">
                        
                        <input type="hidden" name="" value="">
                        <div class="form-group">
                            <label for="formGroupExampleInput">Título</label>
                            <input type="text" class="form-control" id="formGroupExampleInput" name="lista_nome"
                                value="" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Descrição</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"
                                name="lista_desc"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="imagem">Imagem</label>
                            <input type="file" class="form-control-file" id="imagem" name="lista_imagem"
                                value="{{lista.imagem}}">
                        </div>
                        <footer class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn botao-cor-especial">Salvar</button>
                        </footer>

                    </form>
                </main>


            </dialog>
        </div>
    </div>
    
        <!-- Modal - Criar Lista -->
    <div class="modal fade" id="modal-criar-lista" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <dialog class="modal-content">
                <header class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Nova PlayList</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    <span aria-hidden="true">&times;</span>
                    </button>
                </header>

                <main class="modal-body">
                    <form action="/aps-web/playlist" method="POST">
                        <div class="form-group">
                            <label for="formGroupExampleInput">Título</label>
                            <input type="text" class="form-control" id="formGroupExampleInput" name="lista_titulo"
                                placeholder="Insira o título da lista" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Descrição</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" name="lista_desc" rows="3"
                                placeholder="Dê uma descrição"></textarea>
                        </div>

                        <div class="form-group">
                            <label for="imagem">Endereço da Imagem</label>
                            <input type="text" class="form-control-file" id="imagem" name="lista_imagem" value="">
                        </div>

                        <footer class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            <button type="submit" class="btn botao-cor-especial" name="submit"
                                value="submit">Criar</button>
                        </footer>

                    </form>
                </main>



            </dialog>
        </div>
    </div>


    <main class="container-fluid bg-light"></main>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>


</body>

</html>