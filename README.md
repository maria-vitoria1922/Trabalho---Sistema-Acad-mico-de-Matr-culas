
# Trabalho---Sistema-Acadêmico-de-Matrículas

 <p> create database sistema_academico_de_matriculas; <p>
 <p> use sistema_academico_de_matriculas; <p>

<p> create table alunos( <br>
 	alu_id int auto_increment primary key, <br>
 	alu_nome varchar(100) not null, <br>
  alu_curso_id int <br>
); <p>

<p> create table cursos( <br>
   cur_id int primary key, <br>
   cur_nome varchar(100) <br>
); <p>

 <p> create table disciplinas( <br>
	  dis_id int primary key, <br>
    dis_nome varchar(100), <br>
    dis_prof_id int, <br>
    dis_curso_id int <br>
 ); <p>

 <p> create table professores( <br>
	prof_id int primary key, <br>
  prof_nome varchar(100) <br>
); <p>

<p> create table matriculas( <br>
    mat_id int primary key, <br>
    mat_alu_id int not null, <br>
    mat_dis_id int not null, <br>
    mat_ano int not null <br>
); <p>

<p> create table notas( <br>
	not_id int primary key, <br>
  not_mat_id int, <br>
  not_valor int <br>
); <p>
