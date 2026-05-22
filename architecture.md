# goals_app

Portfolio backend project built with Rails API.

Main objective:
Learn and demonstrate professional backend engineering practices while building a real-world goal tracking API.

📌 DOCUMENTAÇÃO BASE DO PROJETO
Projeto

goals_app

Repositório:

goals_app GitHub Repository

🎯 Objetivo do Projeto

Construir uma API RESTful em Ruby on Rails (API Only) para gerenciamento de metas pessoais (“goal tracking system”).

O sistema permitirá que usuários:

criem metas

acompanhem progresso ao longo do tempo

registrem revisões periódicas

visualizem evolução em formato de timeline

acompanhem consistência e progresso

O projeto está sendo desenvolvido como projeto de portfólio para demonstrar:

conhecimento em Ruby on Rails API

modelagem relacional

arquitetura REST

autenticação

organização de código

boas práticas backend

evolução incremental de produto

🧱 Stack Atual

Ruby on Rails 7 (API Only)

PostgreSQL

ActiveRecord

Git + GitHub

📦 Estrutura Atual do Domínio
User

Representa o usuário do sistema.

Campos
email:string

Relacionamentos
has_many :goals

Goal

Representa uma meta criada pelo usuário.

Campos
title:string
description:text
specific:text
measurable:string
relevant:text
timeframe:date
user_id:bigint

Relacionamentos
belongs_to :user
has_many :goal_reviews

Conceito

A model Goal segue parcialmente a metodologia SMART goals:

Specific

Measurable

Relevant

Time-bound

GoalReview

Representa atualizações de progresso de uma meta ao longo do tempo.

Campos
progress:text
review_date:date
goal_id:bigint

Relacionamentos
belongs_to :goal

Conceito

Cada review representa um checkpoint/progresso da meta.

Esses dados futuramente serão usados para:

timeline

analytics

métricas

histórico de progresso

🔗 Relacionamentos
User has_many Goals
Goal belongs_to User

Goal has_many GoalReviews
GoalReview belongs_to Goal

🌐 Endpoints Implementados
Goals
List goals
GET /goals


Retorna apenas goals do current_user.

Create goal
POST /goals


Cria uma nova meta.

Delete goal
DELETE /goals/:id


Remove uma meta do usuário atual.

GoalReviews
Create review
POST /goals/:goal_id/goal_reviews


Cria uma review vinculada a uma meta específica.

🔐 Estado Atual da Autenticação

Atualmente o projeto utiliza autenticação temporária fake:

def current_user
  User.first
end


Objetivo futuro:

Implementar autenticação real via JWT.

Possível stack futura:

devise-jwt
OU

JWT custom auth

🧠 Convenções Arquiteturais
Escopo por usuário

Os recursos devem sempre ser acessados via:

current_user.goals.find(params[:id])


E NÃO:

Goal.find(params[:id])


Objetivo:

segurança

isolamento de dados

prevenção de acesso indevido

📌 Próximo Passo Atual

Implementar:

GET /goals/:goal_id/goal_reviews


Objetivo:

listar reviews de uma meta específica

ordenar por data

preparar base para timeline

🚀 Roadmap Planejado
Fase 1 — CRUD Base

 Setup Rails API

 PostgreSQL

 Models

 Relacionamentos

 Create Goal

 List Goals

 Delete Goal

 Create GoalReview

 List GoalReviews

Fase 2 — Melhorias REST

 Update Goal

 Update GoalReview

 Show Goal

 JSON serializers

 Error handling padrão

 Strong params refinados

Fase 3 — Autenticação

 JWT auth

 Signup

 Login

 User isolation

 Auth middleware

Fase 4 — Timeline e Analytics

 Timeline endpoint

 Progress history

 Last review

 Goal consistency metrics

 Progress percentage

Fase 5 — Qualidade Profissional

 Request specs

 Model specs

 Service objects

 Pagination

 API versioning

 Swagger/OpenAPI docs

 Docker

 CI/CD

🧩 Filosofia do Projeto

O projeto NÃO está sendo construído apenas para “funcionar”.

Objetivo principal:

Demonstrar:

evolução técnica

pensamento de arquitetura

organização

boas práticas

clareza de domínio

capacidade de construir APIs reais

📚 Documentações Oficiais Recomendadas
Ruby on Rails Guides

Ruby on Rails Guides

Active Record Associations

Rails Active Record Associations Guide

Rails Routing

Rails Routing Guide

Rails API Only Applications

Rails API Only Guide

Strong Parameters

Action Controller Strong Parameters

🧠 Instruções para o Cursor (IMPORTANTE)

Você pode literalmente colar isso no Cursor:

“Este projeto é uma API RESTful em Ruby on Rails 7 API-only chamada goals_app.

O sistema possui:

User

Goal

GoalReview

Relacionamentos:

User has_many Goals

Goal belongs_to User

Goal has_many GoalReviews

GoalReview belongs_to Goal

O projeto usa PostgreSQL.

Atualmente:

GET /goals

POST /goals

DELETE /goals/:id

POST /goals/:goal_id/goal_reviews

já estão implementados.

A autenticação atual é fake usando current_user = User.first.

As queries devem SEMPRE ser escopadas via current_user.goals.find(...).

O próximo passo é implementar:
GET /goals/:goal_id/goal_reviews

Objetivo futuro:

JWT authentication

timeline de progresso

analytics

serializers

request specs

arquitetura profissional Rails API.”