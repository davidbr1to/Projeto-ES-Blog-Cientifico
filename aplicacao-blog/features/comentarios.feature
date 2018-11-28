Feature: Comentarios
  As a usuario do sistema blog
  I want to comentar em algum post
  So that meu comentario fique disponivel para visualizacao neste post

  Scenario: Novo comentario
    Given Eu estou logado com o meu e-mail
    And Eu estou na pagina de um post
    When Eu preencho o campo de texto com  “Comentario de teste”
    And Eu preencho o campo de autor com “teste”
    And Eu clico no botao comentar
    Then Eu vejo que o comentario foi publicado

  Scenario: Novo comentario vazio
    Given Eu estou na pagina de um post
    When Eu clico no botao comentar
    Then Eu vejo uma mensagem de erro

  Scenario: Novo comentario sem autor
    Given Eu estou na pagina de um post
    When Eu preencho o campo texto com “comentario”
    And Eu clico no botao comentar
    Then Eu vejo uma mensagem de erro

  Scenario: Editar comentario
    Given Eu estou logado com o meu e-mail
    And Eu estou na pagina de algum post
    When Eu vejo o meu comentario “Comentario de teste”
    And Eu clico no botao para editar este comentario
    And Eu preencho o texto “Comentario editado teste” (clico no botao)
    Then Eu vejo que o meu comentario foi atualizado

  Scenario: Editar comentario com tamanho minimo invalido
    Given Eu estou na pagina de um post
    And o artigo possui um comentario
    When Eu clico no botao para editar
    And Eu preencho o texto “artigo excelente”
    And Eu clico no botão para editar
    Then Eu vejo uma mensagem de erro

  Scenario: Editar comentario invalido
    Given Eu estou logado com o meu e-mail
    And Eu estou na pagina de algum post
    When Eu vejo o meu comentario “Comentario de teste”
    And Eu clico no botao para editar
    And Eu preencho o texto “”
    Then Eu vejo uma mensagem de erro que “Comentario de teste” nao foi alterado

  Scenario: Excluir comentario
    Given Eu estou logado com o meu e-mail
    And Eu estou na pagina de algum post
    When Eu vejo o meu comentario “Comentario de teste”
    And Eu clico para excluir o comentario
    Then Eu vejo que o meu comentario foi excluido

  Scenario: Responder comentario
    Given Eu estou na pagina de um post
    When Eu vejo um comentario e eu clico no botao responder
    And eu preencho o campo texto com “concordo” e clico no botao  para comentar
    Then Eu vejo meu comentario abaixo do comentario respondido

  Scenario: Excluir comentario resposta
    Given Eu estou na pagina de um post
    And o post possui um comentario
    When Eu clico no botão para excluir comentario
    Then Eu recebo uma mensagem informando que  o comentario foi excluído

  Scenario: Avaliar um comentario positivamente
    Given Eu estou na pagina de um post
    And o post possui um comentario
    When eu clico no botao de Gostei de um comentario
    Then Eu vejo que o comentario foi avaliado positivamente

  Scenario: Avaliar um comentario negativamente
    Given Eu estou na pagina de um post
    And o post possui um comentario
    When eu clico no botao de Nao Gostei de um comentario
    Then Eu vejo que o comentario foi avaliado negativamente