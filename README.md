Ordem de construção dos artefatos de código

### 1.Camada de domínio (domain)
1. Entidades (Entities)
2. Casos de Uso (Use Cases)
3. Repositórios (Repositories)
4. Testes dos artefatos
### 2. Dados (data)
1. Modelos (Models)
2. Fontes de Dados (Data Sources)
3. Repositórios e Implementações de cada fonte de dados (Repositories)
### 3. Apresentacao (Presentation)
1. Criar bloc com botão direito na pasta apresentacao New: Bloc
2. Criar os eventos 
3. criar os estados 
4. ajustar bloc
### 4. Adicionar as dependências do Get_it ou injectable


### Comando úteis


flutter pub run build_runner build --delete-conflicting-outputs
