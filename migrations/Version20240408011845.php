<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240408011845 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE chat_file_chat_file (chat_file_source INT NOT NULL, chat_file_target INT NOT NULL, INDEX IDX_B2FA9A3AD8EFAE54 (chat_file_source), INDEX IDX_B2FA9A3AC10AFEDB (chat_file_target), PRIMARY KEY(chat_file_source, chat_file_target)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE chat_file_chat_message (chat_file_id INT NOT NULL, chat_message_id INT NOT NULL, INDEX IDX_BC0D9545DFC5B505 (chat_file_id), INDEX IDX_BC0D9545948B568F (chat_message_id), PRIMARY KEY(chat_file_id, chat_message_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE chat_message_chat_message (chat_message_source INT NOT NULL, chat_message_target INT NOT NULL, INDEX IDX_348A40FF7E5B6C61 (chat_message_source), INDEX IDX_348A40FF67BE3CEE (chat_message_target), PRIMARY KEY(chat_message_source, chat_message_target)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE chat_message_chat_file (chat_message_id INT NOT NULL, chat_file_id INT NOT NULL, INDEX IDX_A59A7FBE948B568F (chat_message_id), INDEX IDX_A59A7FBEDFC5B505 (chat_file_id), PRIMARY KEY(chat_message_id, chat_file_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE chat_file_chat_file ADD CONSTRAINT FK_B2FA9A3AD8EFAE54 FOREIGN KEY (chat_file_source) REFERENCES file (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE chat_file_chat_file ADD CONSTRAINT FK_B2FA9A3AC10AFEDB FOREIGN KEY (chat_file_target) REFERENCES file (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE chat_file_chat_message ADD CONSTRAINT FK_BC0D9545DFC5B505 FOREIGN KEY (chat_file_id) REFERENCES file (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE chat_file_chat_message ADD CONSTRAINT FK_BC0D9545948B568F FOREIGN KEY (chat_message_id) REFERENCES message (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE chat_message_chat_message ADD CONSTRAINT FK_348A40FF7E5B6C61 FOREIGN KEY (chat_message_source) REFERENCES message (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE chat_message_chat_message ADD CONSTRAINT FK_348A40FF67BE3CEE FOREIGN KEY (chat_message_target) REFERENCES message (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE chat_message_chat_file ADD CONSTRAINT FK_A59A7FBE948B568F FOREIGN KEY (chat_message_id) REFERENCES message (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE chat_message_chat_file ADD CONSTRAINT FK_A59A7FBEDFC5B505 FOREIGN KEY (chat_file_id) REFERENCES file (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE chat_file_chat_file DROP FOREIGN KEY FK_B2FA9A3AD8EFAE54');
        $this->addSql('ALTER TABLE chat_file_chat_file DROP FOREIGN KEY FK_B2FA9A3AC10AFEDB');
        $this->addSql('ALTER TABLE chat_file_chat_message DROP FOREIGN KEY FK_BC0D9545DFC5B505');
        $this->addSql('ALTER TABLE chat_file_chat_message DROP FOREIGN KEY FK_BC0D9545948B568F');
        $this->addSql('ALTER TABLE chat_message_chat_message DROP FOREIGN KEY FK_348A40FF7E5B6C61');
        $this->addSql('ALTER TABLE chat_message_chat_message DROP FOREIGN KEY FK_348A40FF67BE3CEE');
        $this->addSql('ALTER TABLE chat_message_chat_file DROP FOREIGN KEY FK_A59A7FBE948B568F');
        $this->addSql('ALTER TABLE chat_message_chat_file DROP FOREIGN KEY FK_A59A7FBEDFC5B505');
        $this->addSql('DROP TABLE chat_file_chat_file');
        $this->addSql('DROP TABLE chat_file_chat_message');
        $this->addSql('DROP TABLE chat_message_chat_message');
        $this->addSql('DROP TABLE chat_message_chat_file');
    }
}
