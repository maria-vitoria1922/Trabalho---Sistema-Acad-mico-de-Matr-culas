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

insert into cursos values 
(1, 'Informática'),
(2, 'Eletrotécnica'),
(3, 'Vestuário'),
(4, 'Têxtil');

insert into alunos values
(1, 'Maria Eduarda', 1),
(2, 'Bianca Maria', 3),
(3, 'Luís Henrique', 2),
(4, 'Ana Beatriz', 4),
(5, 'Igor Gabriel', 1);
 
insert into disciplinas values
(1, 'POO', 2, 1),
(2, 'Banco de dados', 3, 1),
(3, 'Fibras', 4, 4),
(4, 'Modelagem', 1, 3);

insert into professores values
(1, 'Paulo Ricardo'),
(2, 'Max Miller'),
(3, 'Hugo Wendell'),
(4, 'Rafaela Luísa');
 
insert into matriculas values 
(1, 1, 1, 2025), 
(2, 2, 4, 2025), 
(3, 3, 1, 2024),  
(4, 4, 3, 2025),  
(5, 5, 2, 2024);  

insert into notas values 
(1, 1, 9),   
(2, 2, 8),   
(3, 3, 7),   
(4, 4, 6),   
(5, 5, 10);  

insert into alunos values
(6, 'Ana Letícia', 3);

insert into disciplinas values
(5, 'Sociologia',null, 1);
 
-- 1. Listar alunos e seus cursos.
select alu_nome, cur_nome from alunos 
inner join cursos
on alunos.alu_curso_id = cursos.cur_id;

-- 2. Exibir disciplinas ministradas por cada professor.
select dis_nome, prof_nome  from disciplinas
inner join professores
on disciplinas.dis_prof_id = professores.prof_id;

-- 3. Mostrar alunos matriculados em determinada disciplina. 
select alu_nome, dis_nome from alunos
inner join cursos
on alunos.alu_curso_id = cursos.cur_id 
inner join disciplinas 
on cursos.cur_id = disciplinas.dis_curso_id
where dis_nome = 'Banco de dados';

-- 4. Exibir notas de um aluno específico.
select alu_nome, not_valor from alunos
inner join matriculas
on alunos.alu_id = matriculas.mat_alu_id
inner join notas 
on matriculas.mat_id = notas.not_mat_id
where alunos.alu_nome = 'Igor Gabriel';

-- 5. Calcular médias por disciplina.
select  dis_nome, avg(not_valor)  from disciplinas
inner join matriculas
on disciplinas.dis_id =  matriculas.mat_dis_id
inner join notas
on matriculas.mat_id = notas.not_mat_id
group by disciplinas.dis_nome;

-- Exibir alunos que não possuem matrícula.
select alu_nome from alunos
left join matriculas
on alunos.alu_id = matriculas.mat_alu_id
where matriculas.mat_alu_id is null;

-- 7. Mostrar professores e os cursos em que lecionam.
select prof_nome, cur_nome from professores
inner join disciplinas
on professores.prof_id = disciplinas.dis_prof_id
inner join cursos 
on disciplinas.dis_curso_id = cursos.cur_id;

-- 8. Gerar boletim de um aluno.
select mat_id, alu_nome, dis_nome, not_valor from alunos
inner join matriculas
on alunos.alu_id = matriculas.mat_alu_id
inner join disciplinas
on matriculas.mat_dis_id = disciplinas.dis_id
inner join notas 
on matriculas.mat_id = notas.not_mat_id;

-- 9. Exibir alunos reprovados.
select alu_nome, not_valor from alunos
inner join matriculas
on alunos.alu_id = matriculas.mat_alu_id
inner join disciplinas
on matriculas.mat_dis_id = disciplinas.dis_id
inner join notas 
on matriculas.mat_id = notas.not_mat_id
where not_valor < 7;

-- 10. Listar disciplinas com mais de 10 alunos.
select dis_nome, count(mat_alu_id) from disciplinas
inner join matriculas 
on disciplinas.dis_id = matriculas.mat_dis_id
group by disciplinas.dis_nome
having count(mat_alu_id) > 10;

-- 11.Exibir alunos por curso.
select alu_nome, cur_nome from alunos
inner join cursos
on alunos.alu_curso_id = cursos.cur_id;

-- 12.Mostrar disciplinas sem professor associado.alter
select dis_nome from disciplinas
left join professores 
on disciplinas.dis_prof_id = professores.prof_id
where professores.prof_id is null;

-- 13. Exibir quantidade de alunos por disciplina.
select dis_nome, count(mat_dis_id) from alunos 
inner join matriculas 
on alunos.alu_id = matriculas.mat_alu_id 
inner join disciplinas 
on matriculas.mat_dis_id = disciplinas.dis_id
group by dis_nome;

-- 14. Mostrar histórico escolar de cada aluno.
select alu_nome, dis_nome, mat_ano, not_valor from alunos
inner join matriculas 
on alunos.alu_id = matriculas.mat_alu_id
inner join disciplinas
on matriculas.mat_dis_id =  disciplinas.dis_id 
inner join notas 
on matriculas.mat_id = notas.not_mat_id;

-- 15. Listar professores com maior número de turmas.
select prof_nome, count(dis_id) from professores
inner join disciplinas
on professores.prof_id = disciplinas.dis_prof_id
group by prof_nome
order by count(dis_id) desc;

