/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */


 CKEDITOR.plugins.addExternal( 'abbr', '/myplugins/abbr/', 'plugin.js' );
// extraPlugins needs to be set too.
CKEDITOR.replace( 'editor1', {
	extraPlugins: 'abbr'

} );

CKEDITOR.replace( 'editor1', {
	skin: 'moonocolor,/myskins/moonocolor/'
} );

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	 config.uiColor = '#5faf00';
};
