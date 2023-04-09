CREATE TABLE invoice (id INT AUTO_INCREMENT NOT NULL, number VARCHAR(15) NOT NULL, total DOUBLE PRECISION NOT NULL, created_at DATETIME NOT NULL COMMENT '(DC2Type:datetime_immutable)', total_tax DOUBLE PRECISION DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
CREATE TABLE invoice_detail (id INT AUTO_INCREMENT NOT NULL, invoice_id INT NOT NULL, product_id INT NOT NULL, quantity INT NOT NULL, total DOUBLE PRECISION NOT NULL, INDEX IDX_9530E2C02989F1FD (invoice_id), INDEX IDX_9530E2C04584665A (product_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
CREATE TABLE product (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, description VARCHAR(255) NOT NULL, unit_price DOUBLE PRECISION NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
CREATE TABLE `user` (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles LONGTEXT NOT NULL COMMENT '(DC2Type:json)', password VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_8D93D649E7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
ALTER TABLE invoice_detail ADD CONSTRAINT FK_9530E2C02989F1FD FOREIGN KEY (invoice_id) REFERENCES invoice (id);
ALTER TABLE invoice_detail ADD CONSTRAINT FK_9530E2C04584665A FOREIGN KEY (product_id) REFERENCES product (id);
INSERT INTO user (email, roles, password) 
VALUES ('admin@bitsamericas.com', '[]', '$2y$13$rhnAJ3XCgpaoHS7NOyo57e5GPCtNFUJ7mbTy6/.RF8RvWx9nk9oHG'); /*password: 8afdb241*/