--
-- Base Table
--
CREATE TABLE `contact` (
  `Contact_ID` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `contact`
  ADD PRIMARY KEY (`Contact_ID`);

ALTER TABLE `contact`
  MODIFY `Contact_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Permissions
--
INSERT INTO `permission` (`permission_key`, `module`, `label`, `nav_label`, `nav_href`, `show_in_menu`) VALUES
('add', 'OnePlace\\Contact\\Controller\\ContactController', 'Add', '', '', 0),
('edit', 'OnePlace\\Contact\\Controller\\ContactController', 'Edit', '', '', 0),
('index', 'OnePlace\\Contact\\Controller\\ContactController', 'Index', 'Contacts', '/contact', 1),
('list', 'OnePlace\\Contact\\Controller\\ApiController', 'List', '', '', 1),
('view', 'OnePlace\\Contact\\Controller\\ContactController', 'View', '', '', 0);

--
-- Form
--
INSERT INTO `core_form` (`form_key`, `label`) VALUES ('contact-single', 'Contact');

--
-- Index List
--
INSERT INTO `core_index_table` (`table_name`, `form`, `label`) VALUES
('contact-index', 'contact-single', 'Contact Index');

--
-- Tabs
--
INSERT INTO `core_form_tab` (`Tab_ID`, `form`, `title`, `subtitle`, `icon`, `counter`, `sort_id`, `filter_check`, `filter_value`) VALUES ('contact-base', 'contact-single', 'Contact', 'Base', 'fas fa-cogs', '', '0', '', '');

--
-- Buttons
--
INSERT INTO `core_form_button` (`Button_ID`, `label`, `icon`, `title`, `href`, `class`, `append`, `form`, `mode`, `filter_check`, `filter_value`) VALUES
(NULL, 'Save Contact', 'fas fa-save', 'Save Contact', '#', 'primary saveForm', '', 'contact-single', 'link', '', ''),
(NULL, 'Edit Contact', 'fas fa-edit', 'Edit Contact', '/contact/edit/##ID##', 'primary', '', 'contact-view', 'link', '', ''),
(NULL, 'Add Contact', 'fas fa-plus', 'Add Contact', '/contact/add', 'primary', '', 'contact-index', 'link', '', '');

--
-- Fields
--
INSERT INTO `core_form_field` (`Field_ID`, `type`, `label`, `fieldkey`, `tab`, `form`, `class`, `url_view`, `url_ist`, `show_widget_left`, `allow_clear`, `readonly`, `tbl_cached_name`, `tbl_class`, `tbl_permission`) VALUES
(NULL, 'text', 'Name', 'label', 'contact-base', 'contact-single', 'col-md-3', '/contact/view/##ID##', '', 0, 1, 0, '', '', '');

COMMIT;