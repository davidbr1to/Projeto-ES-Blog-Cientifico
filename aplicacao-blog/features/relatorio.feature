Feature: Relatorio
  As a usuario do sistema
  I want to gerar relatorios sobre informacoes dos artigos
  So that eu possa fazer download das informacoes atraves de um documento

  Scenario: Gerar relatorio de artigos mais visualizados
    Given Eu estou logado no blog
    And Eu estou na pagina de artigos
    When Eu clico na Scroll Bar Populares
    And Eu clico no botao Gerar relatorio
    Then O documento com as devidas informacoes e baixado

  Scenario: Gerar relatorio dos 10 artigos mais visualizados
    Given Eu estou logado no blog
    And Eu estou na pagina de artigos
    When Eu clico na Scroll Bar Populares
    And Eu seleciono a opcao “Top 10”
    And Eu clico no botao Gerar relatorio
    Then O documento com as devidas informacoes e baixado

  Scenario: Gerar relatorio sem escolher categoria
    Given Eu estou logado no blog
    And Eu estou na pagina de artigos
    When Eu clico no botao Gerar relatorio
    Then Eu vejo uma mensagem de erro informando que deve ser escolhida uma categoria

  Scenario: Gerar relatorio de todos os artigos de uma categoria selecionada
    Given Eu estou logado no blog
    And Eu estou na pagina de artigos
    When Eu clico na Scroll Bar de categoria “Area de Saude”
    And Eu clico no botao Gerar relatorio
    Then O documento com a quantidade e titulos de artigos da categoria escolhida e baixado

  Scenario: Gerar relatorio de todos os artigos de uma tag selecionada
    Given Eu estou logado no blog
    And Eu estou na pagina de artigos
    When Eu clico na Scroll Bar de tags “tecnologia”
    And Eu clico no botao Gerar relatorio
    Then O documento com a quantidade e titulos de artigos da tag escolhida e baixado

  Scenario: Gerar relatorio de todos os artigos entre um determinado espaco de tempo
    Given Eu estou logado no blog
    And Eu estou na pagina de artigos
    When Eu seleciono buscar artigos publicados com a data inicial “30/05/2018” e data final “24/11/2018”
    And Eu clico no botao Gerar relatorio
    Then O documento com a quantidade e titulos de artigos publicados no intervalo de tempo e baixado

  Scenario: Gerar relatorio com data final invalida
    Given Eu estou logado no blog
    And Eu estou na pagina de artigos
    When Eu seleciono buscar artigos publicados com a data inicial “30/05/2018” e data final “01/01/3000”
    And Eu clico no botao Gerar relatorio
    Then Eu vejo uma mensagem de erro informando que a data final ainda nao ocorreu

  Scenario: Gerar relatorio com data inicial invalida
    Given Eu estou logado no blog
    And Eu estou na pagina de artigos
    When Eu seleciono buscar artigos publicados com a data inicial “31/12/2999” e data final “01/01/3000”
    And Eu clico no botao Gerar relatorio
    Then Eu vejo uma mensagem de erro informando que a data inicial ainda nao ocorreu

  Scenario: Gerar relatorio com data inicial posterior a final
    Given Eu estou logado no blog
    And Eu estou na pagina de artigos
    When Eu seleciono buscar artigos publicados com a data inicial “24/05/2018” e data final “30/05/2018”
    And Eu clico no botao Gerar relatorio
    Then Eu vejo uma mensagem de erro informando que a data inicial nao pode ser posterior a data final

  Scenario: Gerar relatorio invalido com datas em branco
    Given Eu estou logado no blog
    And Eu estou na pagina de artigos
    When Eu seleciono buscar artigos publicados com data inicial “ / / ” e data final “ / / ”
    And Eu clico no botao Gerar relatorio
    Then Eu vejo uma mensagem de erro informando que as datas nao foram preenchidas

  Scenario: Gerar relatorio invalido com intervalo de tempo inviavel
    Given Eu estou logado no blog
    And Eu estou na pagina de artigos
    When Eu seleciono buscar artigos publicados com data inicial “ 01/01/2013 ” e data final “ 31/10/2018 ”
    And Eu clico no botao Gerar relatorio
    Then Eu vejo uma mensagem de erro informando que o intervalo entre as datas não devem ultrapassar 5 anos
