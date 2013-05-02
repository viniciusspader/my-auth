CKEDITOR.editorConfig = function( config ) {

  config.toolbarGroups = [
    { name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
    { name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
    { name: 'links' },
    { name: 'insert' },
/*    { name: 'forms' }, */
/*    { name: 'document',    groups: [ 'mode', 'document', 'doctools' ] },*/
    { name: 'styles' },
    { name: 'colors' },
    { name: 'tools' },
    { name: 'others' },
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    { name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align' ] }
  ];

}