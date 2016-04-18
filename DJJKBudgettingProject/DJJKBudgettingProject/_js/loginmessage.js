function showLoginDialog() {
    var dialog = document.querySelector('dialog');

    if (!dialog.showModal) {
        dialogPolyfill.registerDialog(dialog);
    }

    dialog.showModal();
};
