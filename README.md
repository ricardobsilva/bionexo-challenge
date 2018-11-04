# README

Guia para executar a aplicação:

* Criar banco de dados:
  - ```rails db:create db:migrate ```


* Importar dados do arquivo csv (documentation/ubs.csv)
  - execute o rake task para realizar a importação:
  ```rake usb:import```


* Iniciar aplicação:
  - ```rails s```


* Para rodar os testes:
  - ```rspec spec```
