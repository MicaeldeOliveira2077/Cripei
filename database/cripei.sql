-- Apaga banco de dados caso ele exista.
-- Cuidado! Atenção! PErigo!
-- Este arquivo só deve ser em tempo de desenvolvimento.
-- Apaga banco de dados caso ele exista.
DROP DATABASE IF EXISTS cripei;

-- Cria o banco de dados usando utf-8 e buscas 'case-insensitive':
CREATE DATABASE cripei CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona o banco de dados:
USE cripei;

-- Cria tabela de usuários:
CREATE TABLE users (
    user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    user_avatar VARCHAR(255) NOT NULL,
    user_birth DATE NOT NULL,
    user_bio TEXT,
    user_type ENUM('adimin','author','moderator','user') DEFAULT 'user',
    user_status ENUM('on', 'off', 'deleted') DEFAULT 'on'     
);

-- Cria tabela de artigos:
CREATE TABLE articles (
    art_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_title VARCHAR(255) NOT NULL,
    art_thumb VARCHAR(255) NOT NULL,
    art_intro VARCHAR(255) NOT NULL,
    art_author INT,
    art_content LONGTEXT NOT NULL,
    art_status ENUM('on', 'off', 'deleted') DEFAULT 'on',
    art_counter INT DEFAULT 0,
    FOREIGN KEY (art_author) REFERENCES users (user_id)
);

-- Cria tabela de comentários:
CREATE TABLE comments (
    cmt_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cmt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cmt_author INT,
    cmt_article INT,
    cmt_content TEXT NOT NULL,
    cmt_status ENUM('on', 'off', 'deleted') DEFAULT 'on',
    FOREIGN KEY (cmt_author) REFERENCES users (user_id),
    FOREIGN KEY (cmt_article) REFERENCES articles (art_id)
);

-- Cria tabela de contatos:
CREATE TABLE contacts (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    status ENUM('on', 'off', 'deleted') DEFAULT 'on'
);

-- Insere alguns usuários para testes:
INSERT INTO users (
    user_name,
    user_email,
    user_password,
    user_avatar,
    user_birth,
    user_bio,
    user_type
) VALUES (
    'Joca da Silva',
    'joca@silva.com',
    SHA1('12345_Qwerty'),
    'https://randomuser.me/api/portraits/men/89.jpg',
    '2000-10-14',
    'Comentador, organizador, enrolador e coach.',
    'admin'
), (
    'Marineuza Siriliano',
    'mari@neuza.com',
    SHA1('12345_Qwerty'),
    'https://randomuser.me/api/portraits/women/22.jpg',
    '1998-02-27',
    'Especialista, modelista, arquivista e cientista.',
    'author'
), (
    'Setembrino Trocatapas',
    'set@tapas.net',
    SHA1('12345_Qwerty'),
    'https://randomuser.me/api/portraits/men/22.jpg',
    '1982-12-01',
    'Especialista em caçar o Patolino.',
    'author'
), (
    'Hermenegilda Sanguesuga',
    'hernema@sangue.suga',
    SHA1('12345_Qwerty'),
    'https://randomuser.me/api/portraits/women/12.jpg',
    '2002-03-03',
    'Formada em controle de pragas transdimensionais.',
    'author'
), (
    'Josyswaldo',
    'josy@waldinho.atc',
    SHA1('12345_Qwerty'),
    'https://randomuser.me/api/portraits/men/12.jpg',
    '2009-11-15',
    'Motorista de Uber sem rodas.',
    'user'
);

-- Insere alguns artigos para testes:
INSERT INTO articles (
    art_date,
    art_title,
    art_thumb,
    art_intro,
    art_author,
    art_content
) VALUES (
    '2022-07-01 12:44:55',
    'Primeiro artigo do Cripei.',
    'https://picsum.photos/200',
    'Como escrever um artigo que não serve para nada neste site sem assunto.',
    2,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
), (
    '2022-07-03 12:44:55',
    'Segundo artigo do Cripei.',
    'https://picsum.photos/199',
    'Como escrever mais um artigo que não serve para nada neste site sem assunto.',
    3,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
)
, (
    '2022-07-04 12:44:55',
    'Terceiro artigo do Cripei.',
    'https://picsum.photos/201',
    'Como escrever só mais um artigo que não serve para nada neste site sem assunto.',
    2,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
);

-- Inserindo mais 4 authors:
INSERT INTO users (
    user_name,
    user_email,
    user_password,
    user_avatar,
    user_birth,
    user_bio,
    user_type
) VALUES (
    'Tim Maia',
    'Tim@maia.com',
    SHA1('12345_Qwerty'),
    'https://randomuser.me/api/portraits/men/45.jpg',
    '1990-12-20',
    'Cantor e compositor que gosta de bolo, guarana, suco de caju e goiabada para sobremesa.',
    'author'
), (
    'Nemesis de Araujo',
    'Mesis@Araara.net',
    SHA1('12345_Qwerty'),
    'https://randomuser.me/api/portraits/women/12.jpg',
    '1987-01-13',
    'Mostruosidade geneticamente modificada usada como arma secreta e cozinheiro nas horas vagas.',
    'author'
), (
    'Gangplank de Almeida Camargo',
    'Gang@Alcamar.net',
    SHA1('12345_Qwerty'),
    'https://randomuser.me/api/portraits/men/37.jpg',
    '1989-04-17',
    'Pirata chupador de laranja que está em busca de vingança.',
    'author'
), (
    'Claude Debussy',
    'Claude@Debu.act',
    SHA1('12345_Qwerty'),
    'https://randomuser.me/api/portraits/men/21.jpg',
    '1983-07-22',
    'Musico classico e compositor da musica mais bela do mundo.',
    'author'
);

-- Insere mais alguns artigos para testes:
INSERT INTO articles (
    art_date,
    art_title,
    art_thumb,
    art_intro,
    art_author,
    art_content
) VALUES (
    '2022-07-01 13:30:50',
    'Quarto artigo do Cripei.',
    'https://picsum.photos/202',
    'Como criar uma composição harmonica perfeita.',
    9,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
), (
    '2022-07-01 13:30:50',
    'Quinto artigo do Cripei.',
    'https://picsum.photos/203',
    'Tutorial de navegação nautica pirata.',
    8,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
), (
    '2022-07-01 13:30:50',
    'Sexto artigo do Cripei.',
    'https://picsum.photos/204',
    'Como se tornar um perseguidor militar audaz.',
    7,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
),  (
    '2022-07-01 13:30:50',
    'Setimo artigo do Cripei.',
    'https://picsum.photos/205',
    'Como encontrar e atrair pragas do universo 43 para armadilhas de execução',
    3,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
),  (
    '2022-07-01 13:30:50',
    'Oitavo artigo do Cripei.',
    'https://picsum.photos/206',
    'como buscar o sossego de espirito.',
    6,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
),  (
    '2022-07-01 13:30:50',
    'Nono artigo do Cripei.',
    'https://picsum.photos/202',
    'Como criar uma maquina do tempo.',
    2,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
), (
    '2022-07-01 13:30:50',
    'Decimo artigo do Cripei.',
    'https://picsum.photos/202',
    'Como criar um detetizador contra pragas transdimensionais.',
    3,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
), (
    '2022-07-01 13:30:50',
    'decimo primeiro artigo do Cripei.',
    'https://picsum.photos/202',
    'O perigo de novas ondas de doenças virais para a humanindade.',
    2,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
), (
    '2022-07-01 13:30:50',
    'Decimo segundo artigo do Cripei.',
    'https://picsum.photos/202',
    'Aulas de  navegação e leitura de mapas.',
    8,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
), (
    '2022-07-01 13:30:50',
    'Decimo terceiro artigo do Cripei.',
    'https://picsum.photos/202',
    'Os setimentos e a musica instrumental.',
    9,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos temporibus rerum! Unde numquam possimus in sint commodi tenetur sequi placeat est!</p><p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maxime, temporibus? Asperiores dolorem, in, facilis earum debitis nobis amet nostrum odit obcaecati velit consectetur soluta nemo enim saepe non laborum distinctio.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea eum inventore doloremque deserunt beatae veritatis vitae soluta magnam provident totam perferendis debitis consequatur deleniti iste impedit porro delectus, quam animi?</p><h3>Links legais:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://youtube.com">Vídeo legais</a></li><li><a href="https://instagram.com">Instagram da galera</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo asperiores placeat nostrum totam, a numquam ipsam reiciendis veniam vitae nihil amet quasi eum in quia, explicabo similique eos aut. Similique?</p>'
);

-- Insere alguns comentarios para testes:
INSERT INTO comments (
    cmt_date,
    cmt_author, 
    cmt_article,
    cmt_content 
) VALUES (
    '2022-08-01 13:40:50',
    1,
    3,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos tempori'
),  (
    '2022-08-01 13:40:50',
    2,
    4,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos tempori'
),  (
    '2022-08-01 13:40:50',
    8,
    5,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos tempori'
),  (
    '2022-08-01 13:40:50',
    4,
    6,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos tempori'
),  (
    '2022-08-01 13:40:50',
    9,
    3,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos tempori'
),  (
    '2022-08-01 13:40:50',
    8,
    9,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos tempori'
),  (
    '2022-08-01 13:40:50',
    5,
    7,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos tempori'
),  (
    '2022-08-01 13:40:50',
    5,
    4,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos tempori'
),  (
    '2022-08-01 13:40:50',
    7,
    12,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos tempori'
),  (
    '2022-08-01 13:40:50',
    1,
    10,
    '<h2>Título</h2><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi quia, debitis eaque repellat quae hic fuga explicabo quos tempori'
);