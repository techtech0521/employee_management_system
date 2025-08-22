document.addEventListener('DOMContentLoaded', () => {
  const showPasswordCheckbox = document.getElementById('show-password-checkbox');
  const passwordField = document.getElementById('password-field');

    showPasswordCheckbox.addEventListener('change', (e) => {
      if (e.target.checked) {
        passwordField.type = 'text';
      } else {
        passwordField.type = 'password';
      }
    });
  }
);
