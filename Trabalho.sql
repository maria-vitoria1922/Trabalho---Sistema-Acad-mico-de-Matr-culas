# Sistema-Acadêmico-de-Matrículas
create database sistema_academico_de_matriculas; 
use sistema_academico_de_matriculas; 

create table alunos(
 alu_id int auto_increment primary key, 
 alu_nome varchar(100) not null, 
 alu_curso_id int 
); 

create table cursos(
   cur_id int primary key, 
   cur_nome varchar(100) 
);

create table disciplinas(
	dis_id int primary key, 
    dis_nome varchar(100), 
    dis_prof_id int, 
    dis_curso_id int 
 );

 create table professores(
	  prof_id int primary key, 
	  prof_nome varchar(100) 
); 

create table matriculas( 
    mat_id int primary key,
    mat_alu_id int not null, 
    mat_dis_id int not null, 
    mat_ano int not null 
); 

create table notas(
  not_id int primary key,
  not_mat_id int, 
  not_valor int
);


