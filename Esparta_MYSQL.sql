

create database esparta;

use  esparta; 

create table TB_Aluno(
	id_aluno int,
	Nome varchar(45),
    primary key(id_aluno));


insert into TB_Aluno values(1,"JOAO");
insert into TB_Aluno values(2,"CARLOS");
insert into TB_Aluno values(3,"PEDRO");
insert into TB_Aluno values(4,"MARIA");
insert into TB_Aluno values(5,"ANTONELA");
insert into TB_Aluno values(6,"ARTHUR");


create table TB_Professor(
	id_professor int,
	Nome varchar(45),
    primary key(id_professor));
    
    
insert into TB_Professor values(51,"JOAO PEDRO");
insert into TB_Professor values(52,"PAULO");
insert into TB_Professor values(53,"RODRIGO");
insert into TB_Professor values(54,"MURILO");
insert into TB_Professor values(55,"ANTONIO");
    
create table TB_Disciplina(
	id_disciplina int,
	Nome varchar(45),
    primary key (id_disciplina));
    
insert into TB_Disciplina values(71,"MATEMATICA");
insert into TB_Disciplina values(72,"QUIMICA");
insert into TB_Disciplina values(73,"PORTUGUES");
insert into TB_Disciplina values(74,"FISICA");
insert into TB_Disciplina values(75,"COMPUTACAO");
insert into TB_Disciplina values(76,"GEOGRAFIA");

create table TB_Turma(
	id_turma int,
	dia_da_semana int,
    horario varchar(45),
    id_disciplina int,
	id_professor  int,
    primary key(id_turma),
    foreign key(id_professor) references TB_Professor(id_professor),
    foreign key(id_disciplina) references TB_Disciplina(id_disciplina));
    
#Matematica    
insert into TB_Turma values(90,3,"6 30",71,51);

#QUIMICA
insert into TB_Turma values(91,5,"6 30",72,52);

#TURMA PORTUGUES
insert into TB_Turma values(92,16,"6 30",73,53);

#TURMA FISICA
insert into TB_Turma values(93,17,"6 30",74,54);

#TURMA COMPUTACAO
insert into TB_Turma values(94,18,"6 30",75,55);

    
    
 create table TB_Aluno_Turma(
	id_aluno int, 
	id_turma int,
    foreign key(id_turma) references TB_Turma(id_turma),
    foreign key(id_aluno) references TB_Aluno(id_aluno));   
    
insert into TB_Aluno_Turma values(1,90);
insert into TB_Aluno_Turma values(2,90);
insert into TB_Aluno_Turma values(3,90);


insert into TB_Aluno_Turma values(4,91);
insert into TB_Aluno_Turma values(5,91);
insert into TB_Aluno_Turma values(6,91);
insert into TB_Aluno_Turma values(1,91);

insert into TB_Aluno_Turma values(4,92);
insert into TB_Aluno_Turma values(5,92);
insert into TB_Aluno_Turma values(6,92);

insert into TB_Aluno_Turma values(1,93);
insert into TB_Aluno_Turma values(5,93);
insert into TB_Aluno_Turma values(3,93);

insert into TB_Aluno_Turma values(3,94);
insert into TB_Aluno_Turma values(5,94);
insert into TB_Aluno_Turma values(4,94);
 
/*
#Buscar os nomes de todos os alunos que frequentam alguma turma do professor 'JOAO PEDRO'.
Select TB_Aluno.Nome as NomeDosAlunos
from TB_Aluno
left join TB_Aluno_Turma on TB_Aluno.id_aluno = TB_Aluno_Turma.id_aluno
left Join TB_Turma on TB_Turma.id_turma = TB_Aluno_Turma.id_turma
left Join TB_Professor on TB_Turma.id_professor = TB_Professor.id_professor
where TB_Professor.Nome ="JOAO PEDRO" 
*/



/*
# Buscar os dias da semana que tenham aulas da disciplina 'MATEMATICA'.
select TB_Turma.dia_da_semana
from TB_Turma
left join TB_Disciplina on TB_Disciplina.id_disciplina = TB_Turma.id_disciplina
where TB_Disciplina.Nome ="MATEMATICA"
*/



/*
#Buscar todos os alunos que frequentem aulas de 'MATEMATICA' e também 'FISICA'.
Select TB_Aluno.Nome  as Alunos_FisicaMatematica
from TB_Aluno
join TB_Aluno_Turma on TB_Aluno.id_aluno = TB_Aluno_Turma.id_aluno
Join TB_Turma on TB_Turma.id_turma = TB_Aluno_Turma.id_turma
join TB_Disciplina on TB_Disciplina.id_disciplina = TB_Turma.id_disciplina 
where TB_Disciplina.Nome in ('MATEMATICA','FISICA')
Group by TB_Aluno.id_Aluno having count(*) > 1
*/



/*
#Buscar as disciplinas que não tenham nenhuma turma.
Select TB_Disciplina.Nome  as "disciplinas_em_nehuma_turma"
from TB_Disciplina 
where TB_Disciplina.id_disciplina not in (select TB_Turma.id_Disciplina from TB_Turma )
 */



/*
#Buscar os alunos que frequentem aulas de 'MATEMATICA' exceto os que frequentem 'QUIMICA'.
select TB_Aluno.Nome  
from TB_Aluno   
join TB_Aluno_Turma on TB_Aluno.id_aluno = TB_Aluno_Turma.id_aluno
Join TB_Turma on TB_Turma.id_turma = TB_Aluno_Turma.id_turma
join TB_Disciplina on TB_Disciplina.id_disciplina = TB_Turma.id_disciplina 
where TB_Disciplina.Nome in('MATEMATICA') and TB_Aluno.Nome != (select TB_Aluno.Nome from TB_Aluno   
												join TB_Aluno_Turma on TB_Aluno.id_aluno = TB_Aluno_Turma.id_aluno
												Join TB_Turma on TB_Turma.id_turma = TB_Aluno_Turma.id_turma
												join TB_Disciplina on TB_Disciplina.id_disciplina = TB_Turma.id_disciplina where TB_Disciplina.nome  in('MATEMATICA','QUIMICA')
												Group by TB_Aluno.id_Aluno  having count(*) > 1 )
 */
