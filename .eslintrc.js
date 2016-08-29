module.exports = {
  // So parent files don't get applied
  root: true,
  env: {
    es6: true,
    browser: true,
    node: true,
  },
  extends: 'eslint:recommended',
  parserOptions: {
    ecmaVersion: 6,
    sourceType: 'module',
  },
  rules: {
    // Errors
    'array-bracket-spacing': ['error', 'never'],
    'arrow-spacing': 'error',
    'arrow-parens': 'error',
    'block-spacing': ['error', 'always'],
    'brace-style': 'error',
    'comma-dangle': ['error', 'always-multiline'],
    'comma-spacing': ['error', {before: false, after: true}],
    'comma-style': ['error', 'last'],
    'computed-property-spacing': ['error', 'never'],
    'consistent-this': ['error', 'self'],
    'consistent-return': 'off', // Wishlist, one day
    'dot-notation': 'error',
    'dot-location': ['error', 'property'],
    'eqeqeq': ['error', 'smart']
  },
};
