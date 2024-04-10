# CR Consig - 1.0

### Sistema desenvolvido sob demanda para intermediação de compra e venda de insumos agrícolas.

### Funcionalidades:

  - Cadastro de Clientes;
  - Cadastro de Produtos;
  - Cadastro de Usuários;
  - Cadastro de Orçamentos;
  - Cadastro de Ofertas.

### Features ainda em desenvolvimento:
  
  - Linkagem de produto Ofertado com Orçado;
  - Exportação de dados via XLSX e PDF;
  - Importação de cadastros via CSV ou XLSX;
  - Internacionalização.


## Dependências
  
  - Ruby 3.1.2
  - Rails 7.0.4
  - NPM > 7.1

Após instalar o Ruby com o gerenciador de versões de preferência instale as gems:

```console
bundle install
```

Crie o Banco de Dados:

```console
rails db:create db:migrate
```

Rode o seeds:

```console
rails db:seed
```

Verifique se já tem o npm e depois rode:

```console
npm install
```

Suba o servidor:

```console
bin/dev
```


