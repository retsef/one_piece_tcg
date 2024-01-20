module.exports = {
  trailingComma: "es5",
  tabWidth: 2,
  semi: false,
  singleQuote: true,
  plugins: [
    "prettier-plugin-tailwindcss"
  ],
  tailwindConfig: './app/assets/stylesheets/configs/application.config.js',
  pluginSearchDirs: false
}