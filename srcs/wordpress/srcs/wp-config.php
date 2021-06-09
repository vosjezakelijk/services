<?php

define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'hsamatha' );

define( 'DB_PASSWORD', '1129' );

define( 'DB_HOST', 'mysql-svc' );
define( 'WP_HOME', 'http://192.168.99.154:5050/' );
define( 'WP_SITEURL', 'http://192.168.99.154:5050/' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define('FS_METHOD', 'direct');

define('AUTH_KEY',         '1234');
define('SECURE_AUTH_KEY',  '1234');
define('LOGGED_IN_KEY',    '1234');
define('NONCE_KEY',        '1234');
define('AUTH_SALT',        '1234');
define('SECURE_AUTH_SALT', '1234');
define('LOGGED_IN_SALT',   '1234');
define('NONCE_SALT',       '1234');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
