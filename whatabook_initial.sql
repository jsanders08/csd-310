CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY '$3LfB3l1ef';
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

INSERT INTO store(locale)
    VALUES('1800 Chivas St, El Segundo, CA 94538');

INSERT INTO book(book_name, author, details)
    VALUES('The Bourne Identity', 'Robert Ludlum', 'Part 1 of The Bourne Trilogy');

INSERT INTO book(book_name, author, details)
    VALUES('The Bourne Supremacy', 'Robert Ludlum', 'Part 2 of The Bourne Trilogy');

INSERT INTO book(book_name, author, details)
    VALUES('The Bourne Ultimatum', 'Robert Ludlum', 'Part 3 of The Bourne Trilogy');

INSERT INTO book(book_name, author)
    VALUES('Brave New World', 'Aldous Huxley');

INSERT INTO book(book_name, author)
    VALUES('One Flew Over the Cuckoos Nest', 'Ken Kesey');

INSERT INTO book(book_name, author)
    VALUES('1984', 'George Orwell');

INSERT INTO book(book_name, author)
    VALUES('Catch 22', 'Joseph Heller');

INSERT INTO book(book_name, author)
    VALUES('Behold A Pale Horse', 'William Cooper');

INSERT INTO book(book_name, author)
    VALUES('Lord of the Flies', 'William Golding');


INSERT INTO user(first_name, last_name) 
    VALUES('Harland', 'Sanders');

INSERT INTO user(first_name, last_name)
    VALUES('Anton', 'Newcombe');

INSERT INTO user(first_name, last_name)
    VALUES('Julia', 'Gulia');


INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Harland'), 
        (SELECT book_id FROM book WHERE book_name = 'One Flew Over the Cuckoos Nest')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Anton'),
        (SELECT book_id FROM book WHERE book_name = 'Brave New World')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Julia'),
        (SELECT book_id FROM book WHERE book_name = 'Catch 22')
    );
