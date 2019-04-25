$(document).on('turbolinks:load', function () {
    // initialization of unfold component
    $.HSCore.components.HSUnfold.init($('[data-unfold-target]'), {
        afterOpen: function () {
            $(this).find('input[type="search"]').focus();
        }
    });
    $('.best_in_place').best_in_place();
    // initialization of malihu scrollbar
    $.HSCore.components.HSMalihuScrollBar.init($('.js-scrollbar'));
    // initialization of text editors
    $.HSCore.components.HSSummernoteEditor.init('.js-summernote-editor');
    // initialization of show animations
    $.HSCore.components.HSShowAnimation.init('.js-animation-link');
    // initialization of file attach module
    $.HSCore.components.HSFileAttach.init('.js-custom-file-attach');
    // initialization of custom select
    $('.js-select').selectpicker();
});