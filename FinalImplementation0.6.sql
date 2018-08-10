---Database Impplementation
---Jiayuan Chen
 ---- Initialization
 --use master;
--go
--sp_msforeachtable @command1="drop table ?"
--go  use master DROP DATABASE FinalProject CREATE DATABASE "FinalProject"; USE FinalProject

----Movie
----1
CREATE TABLE Movie(
movie_id INT NOT NULL primary key,
mobie_title VARCHAR(45) NOT NULL,
movie_duration INT NOT NULL,
movie_release_date DATE,
movie_country VARCHAR(45),
movie_description VARCHAR(MAX),
--movie_distributor_person_id INT,
distributor_id INT 
)


INSERT INTO Movie (movie_id, mobie_title, movie_duration, movie_release_date, movie_country, movie_description, distributor_id) VALUES 
(1,'Manbiki Kazoku',121,'2018-06-08','Japan','After one of their shoplifting sessions, Osamu and his son come across a little girl in the freezing cold. At first reluctant to shelter the girl, Osamu羢 wife agrees to take care of her after learning of the hardships she faces. Although the family is poor',1),
(2,'Black Klansman',128,'2017-08-10','USA','Ron Stallworth, an African-American police officer from Colorado, successfully managed to infiltrate the local Ku Klux Klan and almost became the head of the local chapter.',2),
(3,'LETO',126,'2018-05-05','Russia','Leningrad, one Summer in the early Eighties.',3),
(4,'Lazzaro Felice',125,'2018-05-31','ITALY','This is the tale of a meeting between Lazzaro, a young peasant so good that he is often mistaken for simple-minded, and Tancredi, a young nobleman cursed by his imagination. ',4),
(5,'The Man Who Killed Don Quixote',132,'2017-12-09','Spain','Toby, a cynical advertising director finds himself trapped in the outrageous delusions of an old Spanish shoe-maker who believes himself to be Don Quixote.?',5),
(6,'Todos Lo Saben',132,'2018-06-20','France','Laura and her children travel from Buenos Aires to the village where she was born, on a Spanish vineyard, to attend her sister柳s wedding but unexpected events lead this gathering towards a crisis which exposes the hidden past of the family.',6),
(7,'Jiang Hu Er Nv',141,'2018-01-01','China','Qiao is in love with Bin, a local mobster. During a fight between rival gangs, she fires a gun to protect him. Qiao gets five years in prison for this act of loyalty.',7),
(8,'Chpharnaum',120,'2018-03-02','Lebanon','THE JUDGE: Why are you suing your own parents? ZAIN: For giving me life',8),
(9,'Netemo Sametemo',119,'2018-02-22','Japan','One day Asako柳s first love suddenly disappears. Two years later, she meets his perfect double.',9),
(10,'Ayka',100,'2018-06-12','RUssia','Ayka just gave birth. She can''t afford to raise a child.',10);


----2
CREATE TABLE Movie_Distributor(

distributor_id INT NOT NULL PRIMARY KEY,
distributor_name VARCHAR(45),
distributor_desription VARCHAR(45),
distributor_country VARCHAR(45)

)

INSERT INTO Movie_Distributor (distributor_id, distributor_name, distributor_desription, distributor_country) VALUES 
(1,'LE PACTE','distribution@le-pacte.com','France'),
(2,'ARP SELECTION','http://www.arpselection.eu/','France'),
(3,'UNIVERSAL PICTURES INTERNATIONAL','sylvie.kuijper@nbcuni.com','France'),
(4,'AD VITAM DISTRIBUTION','arthur@advitamdistribution.com','France'),
(5,'OCEAN FILMS DISTRIBUTION','philippe.aigle@naia.pro','France'),
(6,'MEMENTO FILMS DISTRIBUTION','arthur@advitamdistribution.com','France'),
(7,'ART HOUSE FILMS','eric@arthouse-films.fr','USA'),
(8,'DIAPHANA DISTRIBUTION','http://www.diaphana.fr/','France'),
(9,'DreamWorksAnimation','http://www.dreamworksanimation.com/','USA'),
(10,'20th Century Fox','http://www.foxmovies.com/','USA');

-- FK_Movie_Movie_Distributor_distributor_id FOREIGN KEY
ALTER TABLE Movie
ADD CONSTRAINT FK_Movie_Movie_Distributor_distributor_id
FOREIGN KEY (distributor_id) references Movie_Distributor(distributor_id)

----3
CREATE TABLE BoxOffice(
movie_id INT NOT NULL PRIMARY KEY,
movie_gross_income MONEY NOT NULL,
movie_gross_deadline DATE NOT NULL

)

INSERT INTO BoxOffice (movie_id, movie_gross_income, movie_gross_deadline) VALUES 
(1,1000000,'2018-01-05'),
(2,12000000,'2018-01-03'),
(3,14000000,'2018-01-04'),
(4,16000000,'2018-01-05'),
(5,18000000,'2018-01-06'),
(6,20000000,'2018-01-07'),
(7,22000000,'2018-01-08'),
(8,24000000,'2018-01-09'),
(9,26000000,'2018-01-10'),
(10,28000000,'2018-01-11');


----FK_BoxOffice_Movie_movie_id

ALTER TABLE BoxOffice 
ADD CONSTRAINT FK_BoxOffice_Movie_movie_id
FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)

----4

CREATE TABLE Trailer(
trailer_id INT NOT NULL PRIMARY KEY,
trailer_description VARCHAR(MAX),
trailer_duration TIME,
movie_id INT

)

INSERT INTO Trailer (trailer_id, trailer_description, trailer_duration, movie_id) VALUES 
(1,'transform 24/7 users','1900-01-01',1),
(2,'iterate turn-key interfaces','1900-01-01',2),
(3,'enhance best-of-breed infomediaries','1900-01-01',3),
(4,'architect bleeding-edge supply-chains','1900-01-01',4),
(5,'whiteboard bleeding-edge synergies','1900-01-01',5),
(6,'empower sexy e-tailers','1900-01-01',6),
(7,'mesh intuitive eyeballs','1900-01-01',7),
(8,'incentivize viral synergies','1900-01-01',8),
(9,'recontextualize scalable models','1900-01-01',9),
(10,'streamline web-enabled initiatives','1900-01-01',10);



----FK_Trailer_Movie_movie_id

ALTER TABLE Trailer
ADD CONSTRAINT FK_Trailer_Movie_movie_id
FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)

----5

CREATE TABLE Genre(
genre_id INT NOT NULL PRIMARY KEY,
genre_name VARCHAR(45),
genre_description varchar(max)
)

INSERT INTO Genre (genre_id, genre_name, genre_description) VALUES 
(1,'cartoon','Ought these are balls place mrs their times add she. Taken no great widow spoke of it small. Genius use except son esteem merely her limits. Sons park by do make on. It do oh cottage offered cottage in written. Especially of dissimilar up attachment themselves by interested boisterous. Linen mrs seems men table. Jennings dashwood to quitting marriage bachelor in. On as conviction in of appearance apartments boisterous. '),
(2,'action','Up am intention on dependent questions oh elsewhere september. No betrayed pleasure possible jointure we in throwing. And can event rapid any shall woman green. Hope they dear who its bred. Smiling nothing affixed he carried it clothes calling he no. Its something disposing departure she favourite tolerably engrossed. Truth short folly court why she their balls. Excellence put unaffected reasonable mrs introduced conviction she. Nay particular delightful but unpleasant for uncommonly who. '),
(3,'horror','Forfeited you engrossed but gay sometimes explained. Another as studied it to evident. Merry sense given he be arise. Conduct at an replied removal an amongst. Remaining determine few her two cordially admitting old. Sometimes strangers his ourselves her depending you boy. Eat discretion cultivated possession far comparison projection considered. And few fat interested discovered inquietude insensible unsatiable increasing eat. '),
(4,'funny','When be draw drew ye. Defective in do recommend suffering. House it seven in spoil tiled court. Sister others marked fat missed did out use. Alteration possession dispatched collecting instrument travelling he or on. Snug give made at spot or late that mr. '),
(5,'sad','On no twenty spring of in esteem spirit likely estate. Continue new you declared differed learning bringing honoured. At mean mind so upon they rent am walk. Shortly am waiting inhabit smiling he chiefly of in. Lain tore time gone him his dear sure. Fat decisively estimating affronting assistance not. Resolve pursuit regular so calling me. West he plan girl been my then up no. '),
(6,'observatory','She literature discovered increasing how diminution understood. Though and highly the enough county for man. Of it up he still court alone widow seems. Suspected he remainder rapturous my sweetness. All vanity regard sudden nor simple can. World mrs and vexed china since after often. '),
(7,'episode','Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced. End friendship sufficient assistance can prosperous met. As game he show it park do. Was has unknown few certain ten promise. No finished my an likewise cheerful packages we. For assurance concluded son something depending discourse see led collected. Packages oh no denoting my advanced humoured. Pressed be so thought natural. '),
(8,'future','Blind would equal while oh mr do style. Lain led and fact none. One preferred sportsmen resolving the happiness continued. High at of in loud rich true. Oh conveying do immediate acuteness in he. Equally welcome her set nothing has gravity whether parties. Fertile suppose shyness mr up pointed in staying on respect. '),
(9,'history','Silent sir say desire fat him letter. Whatever settling goodness too and honoured she building answered her. Strongly thoughts remember mr to do consider debating. Spirits musical behaved on we he farther letters. Repulsive he he as deficient newspaper dashwoods we. Discovered her his pianoforte insipidity entreaties. Began he at terms meant as fancy. Breakfast arranging he if furniture we described on. Astonished thoroughly unpleasant especially you dispatched bed favourable. '),
(10,'society','Not far stuff she think the jokes. Going as by do known noise he wrote round leave. Warmly put branch people narrow see. Winding its waiting yet parlors married own feeling. Marry fruit do spite jokes an times. Whether at it unknown warrant herself winding if. Him same none name sake had post love. An busy feel form hand am up help. Parties it brother amongst an fortune of. Twenty behind wicket why age now itself ten. ');


CREATE TABLE MovieGenreCatalog(
genre_id INT NOT NULL ,
movie_id INT NOT NULL
)

INSERT INTO MovieGenreCatalog (genre_id, movie_id) VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

----PK_genre_id_movie_id

ALTER TABLE MovieGenreCatalog
ADD CONSTRAINT PK_genre_id_movie_id
PRIMARY KEY CLUSTERED (genre_id,movie_id)

----FK_MovieGenreCatalog_genre_id

ALTER TABLE MovieGenreCatalog
ADD CONSTRAINT FK_MovieGenreCatalog_genre_id
FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)

----FK_MovieGenreCatalog_movie_id

ALTER TABLE MovieGenreCatalog
ADD CONSTRAINT FK_MovieGenreCatalog_movie_id
FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)


----6

CREATE TABLE News(
news_id INT NOT NULL PRIMARY KEY,
new_title VARCHAR(MAX) NOT NULL,
news_description varchar(MAX),
news_source VARCHAR(MAX),
news_editor VARCHAR(MAX)
)

INSERT INTO News (news_id, new_title, news_description, news_source, news_editor) VALUES 
(1,'yet its express parties use','yet its express parties use','Going as by do known noise','tom'),
(2,'Was has unknown few certain ten promise','Was has unknown few certain ten promise','yet its express parties use','mary'),
(3,'Not far stuff she think the jokes.','Was has unknown few certain ten promise','Was has unknown few certain ten promise','kitty'),
(4,'. Began he at terms meant as fancy. ','Not far stuff she think the jokes.','Repulsive he he as deficient newspaper dashwoods w','dick'),
(5,'at of in loud rich true.','Was has unknown few certain ten promise','Not far stuff she think the jokes.','washington'),
(6,'Oh conveying do immediate acuteness in he','Oh conveying do immediate acuteness in he','Whatever settling goodness too and honoured ','mary'),
(7,'Whatever settling goodness too and honoured ','Whatever settling goodness too and honoured ','Not far stuff she think the jokes.','dick'),
(8,'my advanced humoured.','my advanced humoured.','Going as by do known noise','peter'),
(9,'Repulsive he he as deficient newspaper dashwoods w','Repulsive he he as deficient newspaper dashwoods w','my advanced humoured.','simon'),
(10,'Going as by do known noise','Going as by do known noise','Was has unknown few certain ten promise','helen');


CREATE TABLE MovieNewsCatalog(
news_id INT NOT NULL,
movie_id INT NOT NULL
)

INSERT INTO MovieNewsCatalog (news_id, movie_id) VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

----PK_news_id_movie_id
ALTER TABLE MovieNewsCatalog
ADD CONSTRAINT PK_news_id_movie_id
PRIMARY KEY CLUSTERED (news_id,movie_id)

----FK_MovieNewsCatalog_genre_id

ALTER TABLE MovieNewsCatalog
ADD CONSTRAINT FK_MovieNewsCatalog_news_id
FOREIGN KEY (news_id) REFERENCES News(news_id)

----FK_MovieNewsCatalog_movie_id

ALTER TABLE MovieNewsCatalog
ADD CONSTRAINT FK_MovieNewsCatalog_movie_id
FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)



----7
CREATE TABLE Award(
award_id INT NOT NULL PRIMARY KEY,
award_title VARCHAR(45),
award_description VARCHAR(MAX),
award_year INT
)



INSERT INTO Award (award_id, award_title, award_description, award_year) VALUES 
(1,'voluptatem','Improved own provided blessing may peculiar domestic. Sight house has sex never. No visited raising gravity outward subject my cottage mr be. Hold do at tore in park feet near my case. Invitation at understood occasional sentiments insipidity inhabiting in. Off melancholy alteration principles old. Is do speedily kindness properly oh. Respect article painted cottage he is offices parlors. ',2001),
(2,'iste','Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced. End friendship sufficient assistance can prosperous met. As game he show it park do. Was has unknown few certain ten promise. No finished my an likewise cheerful packages we. For assurance concluded son something depending discourse see led collected. Packages oh no denoting my advanced humoured. Pressed be so thought natural. ',2012),
(3,'sapinte','Two assure edward whence the was. Who worthy yet ten boy denote wonder. Weeks views her sight old tears sorry. Additions can suspected its concealed put furnished. Met the why particular devonshire decisively considered partiality. Certain it waiting no entered is. Passed her indeed uneasy shy polite appear denied. Oh less girl no walk. At he spot with five of view. ',2011),
(4,'saepe','Effects present letters inquiry no an removed or friends. Desire behind latter me though in. Supposing shameless am he engrossed up additions. My possible peculiar together to. Desire so better am cannot he up before points. Remember mistaken opinions it pleasure of debating. Court front maids forty if aware their at. Chicken use are pressed removed. ',2006),
(5,'officia','Now indulgence dissimilar for his thoroughly has terminated. Agreement offending commanded my an. Change wholly say why eldest period. Are projection put celebrated particular unreserved joy unsatiable its. In then dare good am rose bred or. On am in nearer square wanted. ',2001),
(6,'quod','Ignorant saw her her drawings marriage laughter. Case oh an that or away sigh do here upon. Acuteness you exquisite ourselves now end forfeited. Enquire ye without it garrets up himself. Interest our nor received followed was. Cultivated an up solicitude mr unpleasant. ',2003),
(7,'odit','Apartments simplicity or understood do it we. Song such eyes had and off. Removed winding ask explain delight out few behaved lasting. Letters old hastily ham sending not sex chamber because present. Oh is indeed twenty entire figure. Occasional diminution announcing new now literature terminated. Really regard excuse off ten pulled. Lady am room head so lady four or eyes an. He do of consulted sometimes concluded mr. An household behaviour if pretended. ',2002),
(8,'illum','Ye to misery wisdom plenty polite to as. Prepared interest proposal it he exercise. My wishing an in attempt ferrars. Visited eat you why service looking engaged. At place no walls hopes rooms fully in. Roof hope shy tore leaf joy paid boy. Noisier out brought entered detract because sitting sir. Fat put occasion rendered off humanity has. ',1999),
(9,'fugit','He do subjects prepared bachelor juvenile ye oh. He feelings removing informed he as ignorant we prepared. Evening do forming observe spirits is in. Country hearted be of justice sending. On so they as with room cold ye. Be call four my went mean. Celebrated if remarkably especially an. Going eat set she books found met aware. ',1998),
(10,'dolores','Or kind rest bred with am shed then. In raptures building an bringing be. Elderly is detract tedious assured private so to visited. Do travelling companions contrasted it. Mistress strongly remember up to. Ham him compass you proceed calling detract. Better of always missed we person mr. September smallness northward situation few her certainty something. ',2017);



CREATE TABLE AwardMovieTable(
award_id INT NOT NULL,
movie_id INT NOT NULL

)

INSERT INTO AwardMovieTable (award_id, movie_id) VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

----PK_award_id_movie_id
ALTER TABLE AwardMovieTable
ADD CONSTRAINT PK_award_id_movie_id
PRIMARY KEY CLUSTERED (award_id,movie_id)

----FK_MovieAwardCatalog_genre_id

ALTER TABLE AwardMovieTable
ADD CONSTRAINT FK_MovieAwardCatalog_award_id
FOREIGN KEY (award_id) REFERENCES Award(award_id)

----FK_MovieAwardCatalog_movie_id

ALTER TABLE AwardMovieTable
ADD CONSTRAINT FK_MovieAwardCatalog_movie_id
FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)


----8

CREATE TABLE Rating(
rating_id INT NOT NULL PRIMARY KEY,
rating INT,
movie_id INT,
rating_website VARCHAR(MAX)

)

INSERT INTO Rating (rating_id, rating, movie_id, rating_website) VALUES 
(1,10,1,'http://histats.com/nibh/quisque.xml?tempus=lacus&semper=at&est=velit&quam=vivamus&pharetra=vel&magna=nulla&ac=eget&consequat=eros&metus=elementum&sapien=pellentesque&ut=quisque&nunc=porta&vestibulum=volutpat&ante=erat&ipsum=quisque&primis=erat&in=eros&faucibus=viverra&orci=eget&luctus=congue&et=eget&ultrices=semper&posuere=rutrum&cubilia=nulla&curae=nunc&mauris=purus&viverra=phasellus&diam=in&vitae=felis&quam=donec&suspendisse=semper&potenti=sapien&nullam=a&porttitor=libero&lacus=nam&at=dui&turpis=proin&donec=leo&posuere=odio&metus=porttitor&vitae=id&ipsum=consequat'),
(2,9,2,'https://networkadvertising.org/amet/cursus/id/turpis/integer/aliquet/massa.json?vel=molestie&pede=hendrerit&morbi=at&porttitor=vulputate&lorem=vitae&id=nisl&ligula=aenean&suspendisse=lectus&ornare=pellentesque&consequat=eget&lectus=nunc&in=donec&est=quis&risus=orci&auctor=eget&sed=orci&tristique=vehicula&in=condimentum&tempus=curabitur&sit=in&amet=libero&sem=ut&fusce=massa&consequat=volutpat&nulla=convallis&nisl=morbi&nunc=odio&nisl=odio&duis=elementum&bibendum=eu&felis=interdum&sed=eu&interdum=tincidunt&venenatis=in&turpis=leo&enim=maecenas&blandit=pulvinar&mi=lobortis&in=est&porttitor=phasellus&pede=sit&justo=amet&eu=erat&massa=nulla&donec=tempus&dapibus=vivamus&duis=in&at=felis&velit=eu&eu=sapien&est=cursus&congue=vestibulum'),
(3,10,3,'http://miitbeian.gov.cn/pellentesque/ultrices/mattis.js?phasellus=ante&id=nulla&sapien=justo&in=aliquam&sapien=quis&iaculis=turpis&congue=eget&vivamus=elit&metus=sodales&arcu=scelerisque&adipiscing=mauris&molestie=sit&hendrerit=amet&at=eros&vulputate=suspendisse&vitae=accumsan&nisl=tortor&aenean=quis&lectus=turpis&pellentesque=sed&eget=ante&nunc=vivamus&donec=tortor&quis=duis&orci=mattis&eget=egestas&orci=metus&vehicula=aenean&condimentum=fermentum&curabitur=donec&in=ut&libero=mauris&ut=eget&massa=massa&volutpat=tempor&convallis=convallis&morbi=nulla&odio=neque&odio=libero&elementum=convallis&eu=eget&interdum=eleifend&eu=luctus&tincidunt=ultricies&in=eu&leo=nibh&maecenas=quisque&pulvinar=id&lobortis=justo&est=sit&phasellus=amet&sit=sapien&amet=dignissim&erat=vestibulum&nulla=vestibulum&tempus=ante&vivamus=ipsum&in=primis&felis=in&eu=faucibus&sapien=orci&cursus=luctus&vestibulum=et&proin=ultrices&eu=posuere&mi=cubilia&nulla=curae&ac=nulla&enim=dapibus&in=dolor&tempor=vel&turpis=est&nec=donec&euismod=odio&scelerisque=justo&quam=sollicitudin&turpis=ut&adipiscing=suscipit&lorem=a&vitae=feugiat&mattis=et&nibh=eros&ligula=vestibulum'),
(4,9,4,'http://jalbum.net/non/mauris/morbi/non/lectus/aliquam.aspx?sed=elit&interdum=sodales&venenatis=scelerisque&turpis=mauris&enim=sit&blandit=amet&mi=eros&in=suspendisse&porttitor=accumsan&pede=tortor&justo=quis&eu=turpis&massa=sed&donec=ante&dapibus=vivamus&duis=tortor&at=duis&velit=mattis&eu=egestas&est=metus&congue=aenean&elementum=fermentum&in=donec&hac=ut&habitasse=mauris&platea=eget&dictumst=massa&morbi=tempor&vestibulum=convallis&velit=nulla&id=neque&pretium=libero&iaculis=convallis&diam=eget&erat=eleifend&fermentum=luctus&justo=ultricies&nec=eu&condimentum=nibh&neque=quisque&sapien=id&placerat=justo&ante=sit&nulla=amet&justo=sapien&aliquam=dignissim&quis=vestibulum&turpis=vestibulum&eget=ante&elit=ipsum&sodales=primis&scelerisque=in&mauris=faucibus&sit=orci&amet=luctus&eros=et&suspendisse=ultrices&accumsan=posuere&tortor=cubilia&quis=curae&turpis=nulla&sed=dapibus&ante=dolor&vivamus=vel&tortor=est&duis=donec&mattis=odio&egestas=justo&metus=sollicitudin&aenean=ut&fermentum=suscipit&donec=a&ut=feugiat&mauris=et&eget=eros&massa=vestibulum&tempor=ac&convallis=est&nulla=lacinia'),
(5,10,5,'http://nhs.uk/magna.jpg?justo=mauris&eu=vulputate&massa=elementum&donec=nullam&dapibus=varius&duis=nulla&at=facilisi&velit=cras&eu=non&est=velit&congue=nec&elementum=nisi&in=vulputate&hac=nonummy&habitasse=maecenas&platea=tincidunt&dictumst=lacus&morbi=at&vestibulum=velit&velit=vivamus&id=vel&pretium=nulla&iaculis=eget&diam=eros&erat=elementum&fermentum=pellentesque&justo=quisque&nec=porta&condimentum=volutpat&neque=erat&sapien=quisque&placerat=erat&ante=eros&nulla=viverra&justo=eget&aliquam=congue&quis=eget&turpis=semper&eget=rutrum&elit=nulla&sodales=nunc&scelerisque=purus&mauris=phasellus&sit=in&amet=felis&eros=donec&suspendisse=semper&accumsan=sapien&tortor=a&quis=libero&turpis=nam&sed=dui&ante=proin'),
(6,5,6,'https://ucla.edu/sit.html?nunc=interdum&donec=venenatis&quis=turpis&orci=enim&eget=blandit&orci=mi&vehicula=in&condimentum=porttitor&curabitur=pede&in=justo&libero=eu&ut=massa&massa=donec&volutpat=dapibus&convallis=duis&morbi=at&odio=velit&odio=eu&elementum=est&eu=congue&interdum=elementum&eu=in&tincidunt=hac&in=habitasse&leo=platea&maecenas=dictumst&pulvinar=morbi&lobortis=vestibulum&est=velit&phasellus=id&sit=pretium&amet=iaculis&erat=diam&nulla=erat&tempus=fermentum&vivamus=justo&in=nec&felis=condimentum&eu=neque&sapien=sapien&cursus=placerat'),
(7,6,7,'http://goodreads.com/aliquam/convallis/nunc/proin/at/turpis/a.html?faucibus=vestibulum&accumsan=proin&odio=eu&curabitur=mi&convallis=nulla&duis=ac&consequat=enim&dui=in&nec=tempor&nisi=turpis&volutpat=nec&eleifend=euismod&donec=scelerisque&ut=quam&dolor=turpis&morbi=adipiscing&vel=lorem&lectus=vitae&in=mattis&quam=nibh&fringilla=ligula&rhoncus=nec&mauris=sem&enim=duis&leo=aliquam&rhoncus=convallis&sed=nunc'),
(8,7,8,'http://ibm.com/praesent.png?rhoncus=et&dui=ultrices&vel=posuere&sem=cubilia&sed=curae&sagittis=donec&nam=pharetra&congue=magna&risus=vestibulum&semper=aliquet&porta=ultrices&volutpat=erat&quam=tortor&pede=sollicitudin&lobortis=mi&ligula=sit&sit=amet&amet=lobortis&eleifend=sapien&pede=sapien&libero=non&quis=mi&orci=integer&nullam=ac&molestie=neque&nibh=duis&in=bibendum&lectus=morbi&pellentesque=non&at=quam&nulla=nec&suspendisse=dui&potenti=luctus&cras=rutrum&in=nulla&purus=tellus&eu=in&magna=sagittis&vulputate=dui&luctus=vel&cum=nisl&sociis=duis&natoque=ac&penatibus=nibh&et=fusce&magnis=lacus&dis=purus&parturient=aliquet&montes=at&nascetur=feugiat&ridiculus=non&mus=pretium&vivamus=quis&vestibulum=lectus&sagittis=suspendisse&sapien=potenti&cum=in&sociis=eleifend&natoque=quam&penatibus=a&et=odio&magnis=in&dis=hac&parturient=habitasse&montes=platea&nascetur=dictumst&ridiculus=maecenas&mus=ut&etiam=massa&vel=quis&augue=augue&vestibulum=luctus&rutrum=tincidunt'),
(9,8,9,'https://microsoft.com/in/purus/eu/magna/vulputate/luctus.js?rutrum=platea&nulla=dictumst&tellus=aliquam&in=augue&sagittis=quam&dui=sollicitudin&vel=vitae&nisl=consectetuer&duis=eget&ac=rutrum&nibh=at&fusce=lorem&lacus=integer&purus=tincidunt&aliquet=ante&at=vel&feugiat=ipsum&non=praesent&pretium=blandit&quis=lacinia&lectus=erat&suspendisse=vestibulum&potenti=sed&in=magna&eleifend=at&quam=nunc&a=commodo&odio=placerat&in=praesent&hac=blandit&habitasse=nam&platea=nulla&dictumst=integer'),
(10,4,10,'http://oakley.com/donec/ut/dolor.xml?ut=non&blandit=velit&non=donec&interdum=diam&in=neque&ante=vestibulum&vestibulum=eget&ante=vulputate&ipsum=ut&primis=ultrices&in=vel&faucibus=augue&orci=vestibulum&luctus=ante&et=ipsum&ultrices=primis&posuere=in&cubilia=faucibus&curae=orci&duis=luctus&faucibus=et&accumsan=ultrices&odio=posuere&curabitur=cubilia&convallis=curae&duis=donec&consequat=pharetra&dui=magna&nec=vestibulum&nisi=aliquet&volutpat=ultrices&eleifend=erat&donec=tortor&ut=sollicitudin&dolor=mi&morbi=sit&vel=amet&lectus=lobortis&in=sapien&quam=sapien&fringilla=non&rhoncus=mi&mauris=integer&enim=ac&leo=neque&rhoncus=duis&sed=bibendum&vestibulum=morbi&sit=non&amet=quam&cursus=nec&id=dui&turpis=luctus&integer=rutrum');


----FK_Rating_movie_id
ALTER TABLE Rating
ADD CONSTRAINT Rating_movie_id
FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)

----10
CREATE TABLE Person(
person_id INT NOT NULL PRIMARY KEY,
SSN INT,
firstname varchar(45) NOT NULL,
lastname VARCHAR(45) NOT NULL,
gender VARCHAR(10),
birthday DATE,
phone INT,

)

INSERT INTO Person VALUES
(1,null,'selena','gomez','female','1992-07-22',null),
(2,null,'franka','potente','male','1974-07-22',null),
(3,null,'willem','dafoe','male','1967-02-02',null),
(4,null,'AJ','cook','male','1993-07-22',null),
(5,null,'rhys','ifans','female','1987-09-02',null),
(6,null,'skyler','gisondo','male','1942-12-30',null),
(7,null,'clive','standen','male','1987-08-03',null),
(8,null,'david','spade','male','1988-03-02',null),
(9,null,'john','leguizamo','male','1999-01-22',null),
(10,null,'madison','pettis','female','1992-09-04',null)

--DROP TABLE Person

--NEED DATA


----9

CREATE TABLE MovieDirectorCatalog(
movie_id INT NOT NULL,
director_id INT NOT NULL

)

INSERT INTO MovieDirectorCatalog (movie_id, director_id) VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

--DROP TABLE MovieDirectorCatalog

CREATE TABLE Director(
director_id INT NOT NULL PRIMARY KEY,
director_description VARCHAR(MAX),
person_id INT NOT NULL 
)

INSERT INTO Director (director_id, director_description, person_id) VALUES 
(1,'Breakfast agreeable incommode departure it an. By ignorant at on wondered relation. Enough at tastes really so cousin am of. Extensive therefore supported by extremity of contented. Is pursuit compact demesne invited elderly be. View him she roof tell her case has sigh. Moreover is possible he admitted sociable concerns. By in cold no less been sent hard hill. ',1),
(2,'Article evident arrived express highest men did boy. Mistress sensible entirely am so. Quick can manor smart money hopes worth too. Comfort produce husband boy her had hearing. Law others theirs passed but wishes. You day real less till dear read. Considered use dispatched melancholy sympathize discretion led. Oh feel if up to till like. ',2),
(3,'Rendered her for put improved concerns his. Ladies bed wisdom theirs mrs men months set. Everything so dispatched as it increasing pianoforte. Hearing now saw perhaps minutes herself his. Of instantly excellent therefore difficult he northward. Joy green but least marry rapid quiet but. Way devonshire introduced expression saw travelling affronting. Her and effects affixed pretend account ten natural. Need eat week even yet that. Incommode delighted he resolving sportsmen do in listening. ',3),
(4,'Considered an invitation do introduced sufficient understood instrument it. Of decisively friendship in as collecting at. No affixed be husband ye females brother garrets proceed. Least child who seven happy yet balls young. Discovery sweetness principle discourse shameless bed one excellent. Sentiments of surrounded friendship dispatched connection is he. Me or produce besides hastily up as pleased. Bore less when had and john shed hope. ',4),
(5,'Another journey chamber way yet females man. Way extensive and dejection get delivered deficient sincerity gentleman age. Too end instrument possession contrasted motionless. Calling offence six joy feeling. Coming merits and was talent enough far. Sir joy northward sportsmen education. Discovery incommode earnestly no he commanded if. Put still any about manor heard. ',5),
(6,'Lose john poor same it case do year we. Full how way even the sigh. Extremely nor furniture fat questions now provision incommode preserved. Our side fail find like now. Discovered travelling for insensible partiality unpleasing impossible she. Sudden up my excuse to suffer ladies though or. Bachelor possible marianne directly confined relation as on he. ',6),
(7,'Next his only boy meet the fat rose when. Do repair at we misery wanted remove remain income. Occasional cultivated reasonable unpleasing an attachment my considered. Having ask and coming object seemed put did admire figure. Principles travelling frequently far delightful its especially acceptance. Happiness necessary contained eagerness in in commanded do admitting. Favourable continuing difficulty had her solicitude far. Nor doubt off widow all death aware offer. We will up able in both do sing. ',7),
(8,'Cordially convinced did incommode existence put out suffering certainly. Besides another and saw ferrars limited ten say unknown. On at tolerably depending do perceived. Luckily eat joy see own shyness minuter. So before remark at depart. Did son unreserved themselves indulgence its. Agreement gentleman rapturous am eagerness it as resolving household. Direct wicket little of talked lasted formed or it. Sweetness consulted may prevailed for bed out sincerity. ',8),
(9,'Tiled say decay spoil now walls meant house. My mr interest thoughts screened of outweigh removing. Evening society musical besides inhabit ye my. Lose hill well up will he over on. Increasing sufficient everything men him admiration unpleasing sex. Around really his use uneasy longer him man. His our pulled nature elinor talked now for excuse result. Admitted add peculiar get joy doubtful. ',9),
(10,'Piqued favour stairs it enable exeter as seeing. Remainder met improving but engrossed sincerity age. Better but length gay denied abroad are. Attachment astonished to on appearance imprudence so collecting in excellence. Tiled way blind lived whose new. The for fully had she there leave merit enjoy forth. ',10);

--DROP TABLE Director

----PK_director_id_movie_id
ALTER TABLE MovieDirectorCatalog
ADD CONSTRAINT PK_director_id_movie_id
PRIMARY KEY CLUSTERED (director_id,movie_id)

----FK_Director_Person_person_id
ALTER TABLE Director
ADD CONSTRAINT FK_Director_Person_person_id
FOREIGN KEY (person_id) REFERENCES Person(person_id)

----FK_MovieDirectorCatalog_Movie_movie_id
ALTER TABLE MovieDirectorCatalog
ADD CONSTRAINT FK_MovieDirectorCatalog_Movie_movie_id
FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)


----FK_MovieDirectorCatalog_director_director_id
ALTER TABLE MovieDirectorCatalog
ADD CONSTRAINT FK_MovieDirectorCatalog_director_director_id
FOREIGN KEY (director_id) REFERENCES Director(director_id)

----11
CREATE TABLE Actor(
actor_id INT NOT NULL PRIMARY KEY,
actor_description VARCHAR(MAX),
person_id INT NOT NULL
)

INSERT INTO Actor (actor_id, actor_description, person_id) VALUES 
(1,'Breakfast agreeable incommode departure it an. By ignorant at on wondered relation. Enough at tastes really so cousin am of. Extensive therefore supported by extremity of contented. Is pursuit compact demesne invited elderly be. View him she roof tell her case has sigh. Moreover is possible he admitted sociable concerns. By in cold no less been sent hard hill. ',1),
(2,'Am of mr friendly by strongly peculiar juvenile. Unpleasant it sufficient simplicity am by friendship no inhabiting. Goodness doubtful material has denoting suitable she two. Dear mean she way and poor bred they come. He otherwise me incommode explained so in remaining. Polite barton in it warmly do county length an. ',2),
(3,'Seen you eyes son show. Far two unaffected one alteration apartments celebrated but middletons interested. Described deficient applauded consisted my me do. Passed edward two talent effect seemed engage six. On ye great do child sorry lived. Proceed cottage far letters ashamed get clothes day. Stairs regret at if matter to. On as needed almost at basket remain. By improved sensible servants children striking in surprise. ',3),
(4,'Old unsatiable our now but considered travelling impression. In excuse hardly summer in basket misery. By rent an part need. At wrong of of water those linen. Needed oppose seemed how all. Very mrs shed shew gave you. Oh shutters do removing reserved wandered an. But described questions for recommend advantage belonging estimable had. Pianoforte reasonable as so am inhabiting. Chatty design remark and his abroad figure but its. ',4),
(5,'Wrote water woman of heart it total other. By in entirely securing suitable graceful at families improved. Zealously few furniture repulsive was agreeable consisted difficult. Collected breakfast estimable questions in to favourite it. Known he place worth words it as to. Spoke now noise off smart her ready. ',5),
(6,'So delightful up dissimilar by unreserved it connection frequently. Do an high room so in paid. Up on cousin ye dinner should in. Sex stood tried walls manor truth shy and three his. Their to years so child truth. Honoured peculiar families sensible up likewise by on in. ',6),
(7,'Can curiosity may end shameless explained. True high on said mr on come. An do mr design at little myself wholly entire though. Attended of on stronger or mr pleasure. Rich four like real yet west get. Felicity in dwelling to drawings. His pleasure new steepest for reserved formerly disposed jennings. ',7),
(8,'Needed feebly dining oh talked wisdom oppose at. Applauded use attempted strangers now are middleton concluded had. It is tried _no added purse shall no on truth. Pleased anxious or as in by viewing forbade minutes prevent. Too leave had those get being led weeks blind. Had men rose from down lady able. Its son him ferrars proceed six parlors. Her say projection age announcing decisively men. Few gay sir those green men timed downs widow chief. Prevailed remainder may propriety can and. ',8),
(9,'Arrived totally in as between private. Favour of so as on pretty though elinor direct. Reasonable estimating be alteration we themselves entreaties me of reasonably. Direct wished so be expect polite valley. Whose asked stand it sense no spoil to. Prudent you too his conduct feeling limited and. Side he lose paid as hope so face upon be. Goodness did suitable learning put. ',9),
(10,'Acceptance middletons me if discretion boisterous travelling an. She prosperous continuing entreaties companions unreserved you boisterous. Middleton sportsmen sir now cordially ask additions for. You ten occasional saw everything but conviction. Daughter returned quitting few are day advanced branched. Do enjoyment defective objection or we if favourite. At wonder afford so danger cannot former seeing. Power visit charm money add heard new other put. Attended no indulged marriage is to judgment offering landlord. ',10);


CREATE TABLE MovieActorCatalog(
movie_id INT NOT NULL,
actor_id INT NOT NULL
)

INSERT INTO MovieActorCatalog (movie_id, actor_id) VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);


----PK_movie_id_actor_id
ALTER TABLE MovieActorCatalog
ADD CONSTRAINT PK_movie_id_actor_id
PRIMARY KEY CLUSTERED (movie_id,actor_id)

----FK_MovieActorCatalog_Movie_movie_id
ALTER TABLE MovieActorCatalog
ADD CONSTRAINT FK_MovieActorCatalog_Movie_movie_id
FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)

----FK_MovieActorCatalog_Actor_actor_id
ALTER TABLE MovieActorCatalog
ADD CONSTRAINT FK_MovieActorCatalog_Actor_actor_id
FOREIGN KEY (actor_id) REFERENCES Actor(actor_id)

----FK_Actor_Person_person_id
ALTER TABLE Actor
ADD CONSTRAINT FK_Actor_Person_person_id
FOREIGN KEY (person_id) REFERENCES Person(person_id)

----12

Create TABLE [User]
(
[user_id] INT NOT NULL PRIMARY KEY,
person_id INT NOT NULL FOREIGN KEY REFERENCES Person(person_id),
username VARCHAR(45) CHECK(LEN(username) >= 4) NOT NULL UNIQUE,
--check
passwordHash BINARY(64) NOT NULL,
email VARCHAR(45) NOT NULL UNIQUE CHECK(email like '%@%')
)
GO
CREATE PROCEDURE dbo.AddUser
	@pUserID INT,
	@pPersonID INT,
	@pUsername VARCHAR(45),
	@pPassword VARCHAR(50),
	@pEmail VARCHAR(45),
	@responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO dbo.[User] (user_id, person_id, username, passwordHash, email)
		VALUES(@pUserID, @pPersonID, @pUsername, HASHBYTES('SHA2_512', @pPassword), @pEmail)
		SET @responseMessage='Success'
	END TRY
	BEGIN CATCH
		SET @responseMessage=ERROR_MESSAGE()
	END CATCH
END
   


EXEC dbo.AddUser 1,1,'david',0xa917d01789b58dfd3a702c715496269886f5d363d7445f42ee7b963e9de2a1da7dfbf0b88248ca648e69927353c0a76aaccd1d9b2ef1e32a7fe18ca3710f8929,'david@david.com',OUTPUT
EXEC dbo.AddUser 2,2,'nancy',0x3115b8e43395b0209d3705ee38e3bc1c99ee11a3dab7ff186095938bde9c67aaba0d044c3d20fa77cc30edd2f3dc5e9ceb505b53f5444f5f810c452c272e0a2d,'nancy@nancy.com',OUTPUT

EXEC dbo.AddUser 3,3,'allen',0x43ecb6c485484d5b4179cab6fb9cc8f6d0e1adb902b92719be806bb3649967402ccc27d5e917b212523329c83946435228d9706d5c042a07a31a72e27fd58131,'allen@allen.com',output
EXEC dbo.AddUser 4,4,'berg',0x635f30c4d8f626e353b6ee230ac31c9cc193fc0cfe3be2f00137eaf7de80f48fabaa9927f6bae18705811455762b0dd231a1b5734ef428a690734897173019c5,'berg@berg.com',output
EXEC dbo.AddUser 5,5,'tommy',0x07c49590f6c58d25d7feb39b37e4e86ad19e142a281bed9b6945847800340658e1f32c0e37a0721f47a740f2b88030acd1070afe0e2df194ce0e14361733921f,'tommy@tommy.com',output
EXEC dbo.AddUser 6,6,'timm',0x8fb49df23b4682493b190ba79332c7e5c8e1962a6043625028c85c04deeafcc70c9361e80288493a55dbea8160a461934e760a8f05e0f39df716cec3e52f1d03,'timm@timm.com',output
EXEC dbo.AddUser 7,7,'toar',0x340b814ad27246022dca6cdc16bd8494ac2cc0e279ff95bf55da0677408704fc9da18cd34a62224ddc57869e2f2d51573d5dfd82e23fa4e9d4d35f232fbb695a,'tooobar@timmdfasdf.com',output
EXEC dbo.AddUser 8,8,'toarrer',0x0e2df2d5a28cfbe73b5d833e77859b0fcbc861a4f1c2ae7566a43ee04ca75a57d0a4ba13d24b2e85225b321855c68e55768534592642dea3e0c64157275f654a,'tor@timmdf.com',output
EXEC dbo.AddUser 9,9,'goerge123',0x58b88141e650c3471185c3b50418ba6563f624aab2d4780dcba2b0a9dd9279ffdb288615f061d289d26ae66c96731d25ada2b7e4164e64546a78fbff0bb38bb2,'asdf@asdf.com',output
EXEC dbo.AddUser 10,10,'ggg1234',0x81c82bcae9ca4bcdee5025e46a9765f7625ec086506b60222bd1afac94d6ecad318d0e6163fd039d3a66e372b96386aceb74baf0ee6587393fc84a200cc80eb7,'ppccc@qwer.com',output



/*
INSERT INTO User (user_id, person_id, username, passwordHash, email) VALUES 
(1,1,'david',0xa917d01789b58dfd3a702c715496269886f5d363d7445f42ee7b963e9de2a1da7dfbf0b88248ca648e69927353c0a76aaccd1d9b2ef1e32a7fe18ca3710f8929,'david@david.com'),
(2,2,'nancy',0x3115b8e43395b0209d3705ee38e3bc1c99ee11a3dab7ff186095938bde9c67aaba0d044c3d20fa77cc30edd2f3dc5e9ceb505b53f5444f5f810c452c272e0a2d,'nancy@nancy.com'),
(3,3,'allen',0x43ecb6c485484d5b4179cab6fb9cc8f6d0e1adb902b92719be806bb3649967402ccc27d5e917b212523329c83946435228d9706d5c042a07a31a72e27fd58131,'allen@allen.com'),
(4,4,'berg',0x635f30c4d8f626e353b6ee230ac31c9cc193fc0cfe3be2f00137eaf7de80f48fabaa9927f6bae18705811455762b0dd231a1b5734ef428a690734897173019c5,'berg@berg.com'),
(5,5,'tommy',0x07c49590f6c58d25d7feb39b37e4e86ad19e142a281bed9b6945847800340658e1f32c0e37a0721f47a740f2b88030acd1070afe0e2df194ce0e14361733921f,'tommy@tommy.com'),
(6,6,'timm',0x8fb49df23b4682493b190ba79332c7e5c8e1962a6043625028c85c04deeafcc70c9361e80288493a55dbea8160a461934e760a8f05e0f39df716cec3e52f1d03,'timm@timm.com'),
(7,7,'toar',0x340b814ad27246022dca6cdc16bd8494ac2cc0e279ff95bf55da0677408704fc9da18cd34a62224ddc57869e2f2d51573d5dfd82e23fa4e9d4d35f232fbb695a,'tooobar@timmdfasdf.com'),
(8,8,'toarrer',0x0e2df2d5a28cfbe73b5d833e77859b0fcbc861a4f1c2ae7566a43ee04ca75a57d0a4ba13d24b2e85225b321855c68e55768534592642dea3e0c64157275f654a,'tor@timmdf.com'),
(9,9,'goerge123',0x58b88141e650c3471185c3b50418ba6563f624aab2d4780dcba2b0a9dd9279ffdb288615f061d289d26ae66c96731d25ada2b7e4164e64546a78fbff0bb38bb2,'asdf@asdf.com'),
(10,10,'ggg1234',0x81c82bcae9ca4bcdee5025e46a9765f7625ec086506b60222bd1afac94d6ecad318d0e6163fd039d3a66e372b96386aceb74baf0ee6587393fc84a200cc80eb7,'ppccc@qwer.com');
*/


CREATE TABLE User_Watchlist
(
watchlist_id INT NOT NULL,
movie_id INT NOT NULL FOREIGN KEY REFERENCES Movie(movie_id),
[user_id] INT NOT NULL FOREIGN KEY REFERENCES [User]([user_id])

)

INSERT INTO User_Watchlist (watchlist_id, movie_id, user_id) VALUES 
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10);

----PK_movie_id_user_id
ALTER TABLE User_Watchlist
ADD CONSTRAINT PK_movie_id_user_id
PRIMARY KEY CLUSTERED (movie_id,[user_id])

----15
CREATE TABLE Theatre
(
theatre_id INT NOT NULL PRIMARY KEY,
theatre_name VARCHAR(45) NOT NULL,
theatre_description VARCHAR(MAX)
)




INSERT INTO Theatre (theatre_id, theatre_name, theatre_description) VALUES 
(1,'White Rocklettuce','Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(2,'Obscure Morning-glory','Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(3,'Pineland Rayless Goldenrod','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(4,'Carline Thistle','Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(5,'Coastal Plain Willow','Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(6,'Smallflowered Anemone','Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(7,'Palmtree Cyanea','Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(8,'Jamaican Goldback Fern','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(9,'Stinkweed','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(10,'Douglas'' Phacelia','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.');


----14
CREATE TABLE Showroom
(
showroom_id INT NOT NULL PRIMARY KEY,
showroom_name VARCHAR(45),
theatre_id INT NOT NULL FOREIGN KEY REFERENCES Theatre(theatre_id)
)

INSERT INTO Showroom (showroom_id, showroom_name, theatre_id) VALUES 
(1,'Two-toed tree sloth',1),
(2,'Arctic fox',2),
(3,'Paddy heron (unidentified)',3),
(4,'Lizard, collared',4),
(5,'American bighorn sheep',5),
(6,'White-fronted bee-eater',6),
(7,'Barbet, levaillant''s',7),
(8,'Black and white colobus',8),
(9,'Swallow-tail gull',9),
(10,'Buffalo, wild water',10);

----13
CREATE TABLE Screening_Schedule(
screening_id INT NOT NULL PRIMARY KEY,
showroom_id INT NOT NULL FOREIGN KEY REFERENCES Showroom(showroom_id),
movie_id INT NOT NULL FOREIGN KEY REFERENCES Movie(movie_id),
showtime DATETIME
)


INSERT INTO Screening_Schedule (screening_id, showroom_id, movie_id, showtime) VALUES 
(1,1,1,'2018-07-10 14:00:00'),
(2,2,2,'2018-07-11 14:00:00'),
(3,3,3,'2018-07-12 14:00:00'),
(4,4,4,'2018-07-13 14:00:00'),
(5,5,5,'2018-07-14 14:00:00'),
(6,6,6,'2018-07-15 14:00:00'),
(7,7,7,'2018-07-16 14:00:00'),
(8,8,8,'2018-07-17 14:00:00'),
(9,9,9,'2018-07-18 14:00:00'),
(10,10,10,'2018-07-19 14:00:00');

----16
CREATE TABLE Employee
(
employee_id INT NOT NULL PRIMARY KEY,
employee_role VARCHAR(45) NOT NULL,
theatre_id INT NOT NULL FOREIGN KEY REFERENCES Theatre(theatre_id),
person_id INT NOT NULL FOREIGN KEY REFERENCES Person(person_id)

)

INSERT INTO Employee (employee_id, employee_role, theatre_id, person_id) VALUES 
(1,'doorguard',1,1),
(2,'waitress',2,2),
(3,'waiter',3,3),
(4,'sales',4,4),
(5,'manager',5,5),
(6,'manager',6,6),
(7,'sales',7,7),
(8,'waitress',8,8),
(9,'doorguard',9,9),
(10,'waiter',10,10);


----17

CREATE TABLE Theatre_Address
(
theatre_id INT NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES Theatre(theatre_id),
city VARCHAR(45),
[state] VARCHAR(45),
zipcode INT,
address_line_1 VARCHAR(45),
address_line_2 VARCHAR(45)
)

INSERT INTO Theatre_Address (theatre_id, city, state, zipcode, address_line_1, address_line_2) VALUES 
(1,'Iwatsuki','Texas',10000,'3999 Prentice Terrace','Luster'),
(2,'Krajan','Hawaii',10001,'40 Pearson Park','Mandrake'),
(3,'Portel','Texas',10002,'63 Huxley Circle','Shopko'),
(4,'Tambovka','Pennsylvania',10003,'7020 Ronald Regan Place','Miller'),
(5,'Hobscheid','Connecticut',10004,'922 Butternut Alley','Duke'),
(6,'El Paso','California',10005,'5769 Schiller Plaza','Delaware'),
(7,'Kalashnikovo','North Dakota',10006,'44 Stone Corner Pass','Arapahoe'),
(8,'Des Moines','Wisconsin',10007,'306 Wayridge Lane','Orin'),
(9,'Malhiao','Texas',10008,'178 Anhalt Court','Clarendon'),
(10,'Vacha','Nevada',10009,'7 Mendota Avenue','Claremont');




----18
CREATE TABLE Ticket
(
ticket_id INT NOT NULL PRIMARY KEY,
ticket_price MONEY,
screening_id INT NOT NULL FOREIGN KEY REFERENCES Screening_Schedule(screening_id),
[user_id] INT NOT NULL FOREIGN KEY REFERENCES [User]([user_id])

)

INSERT INTO Ticket (ticket_id, ticket_price, screening_id, user_id) VALUES 
(1,45,1,1),
(2,45,2,2),
(3,45,3,3),
(4,55,4,4),
(5,45,5,5),
(6,55,6,6),
(7,45,7,7),
(8,45,8,8),
(9,65,9,9),
(10,65,10,10);

-- Create a function to check whether a user'age over 13 for pg13 restriction
-- Function will return user'age greater than 13 

CREATE FUNCTION CheckPG13 (@user_id varchar(30))
RETURNS INT
AS
BEGIN
   DECLARE @Age INT=0;
   SELECT @Age =  DATEDIFF(hour,birthday,GETDATE())/8766
          FROM Person
		  JOIN [User]
		  ON Person.person_id = [User].person_id
          WHERE [user_id] = @user_id
          
   RETURN @Age;
END;

-- Add table-level CHECK constraint based on the new function for the Reservation table
ALTER TABLE [User] ADD CONSTRAINT CheckUserAgeOver13 CHECK (dbo.CheckPG13([user_id]) > 13);


--Create a column compute function to compute the average rating of the movie 


CREATE FUNCTION AverageRating(@movie_id INT)
RETURNS Float
AS
   BEGIN
      DECLARE @avgRating FLOAT =
         (SELECT AVG(rating)
          FROM Rating
          WHERE movie_id = @movie_id);
      
      RETURN @avgRating;
END

-- Add a computed column to the Sales.Customer

ALTER TABLE Movie
ADD AvrageRating AS (dbo.AverageRating(movie_id));

SELECT *
FROM Movie

-- Create view

CREATE VIEW Top10BoxOfficeMovie AS 
SELECT TOP 10 m.movie_id
FROM Movie m
JOIN BoxOffice b
ON m.movie_id = b.movie_id
ORDER BY movie_gross_income DESC

CREATE VIEW Top10RatedMovies AS 
SELECT TOP 10 m.movie_id
FROM Movie m
JOIN Rating r
ON m.movie_id = r.movie_id
ORDER BY rating DESC

-- Encryption
-- Create DMK
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Test_P@sswOrd';

-- Create certificate to protect symmetric key
CREATE CERTIFICATE TestCertificate
WITH SUBJECT = 'TestCertificate',
EXPIRY_DATE = '2026-10-31';

-- Create symmetric key to encrypt data
CREATE SYMMETRIC KEY TestSymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE TestCertificate;

-- Open symmetric key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;

UPDATE PERSON SET SSN = EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'SSN1')
WHERE PERSON_ID > 0

-- Close the symmetric key
CLOSE SYMMETRIC KEY TestSymmetricKey;

-- Drop the symmetric key
DROP SYMMETRIC KEY TestSymmetricKey;

-- Drop the certificate
DROP CERTIFICATE TestCertificate;

--Drop the DMK
DROP MASTER KEY;
