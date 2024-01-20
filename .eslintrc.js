module.exports = {
  extends: [
    'eslint:recommended',
    'semistandard',
    'standard'
  ],
  env: {
    browser: true,
    es2021: true
  },
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
    extraFileExtensions: ['.erb']
  }
}
